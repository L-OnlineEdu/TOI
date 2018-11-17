String.prototype.temp = function (obj) {

    return this.replace(/\%\w+\.?\w+?\.?\w+?\%/gi, function (matchs) {


        var returns = obj[matchs.replace(/\%/g, "")];
        if (matchs.indexOf("\.") > 0) {
            matchs = matchs.replace(/\%/g, "");
            arr = matchs.split("\.");
            if (arr.length > 2) {
                returns = obj[arr[0]][arr[1]][arr[2]]
            } else {
                returns = obj[arr[0]][arr[1]]
            }
        }
        return (returns + "") == "undefined" ? "" : returns
    })
};
discussType = {"broad": "1", "group": "2", "person": "3", "sys": "4"};
/*课堂讨论 1 */
/*小组讨论 2 */
/* 个人聊天 3 */
/*系统消息 4 */
systemMType = {"askQ": "1", "handsUp": "2", "paperPush": "3", "paperFinish": "4", "warn": "5", "other": "0"};
currentType = "1";
receIdx = 0;
myuid = 0;
myCharHistory = {};
$(function () {
    init();
    loadAllGroup()
    //checkmsg()
});

function returnx() {

    loadAllGroup();
}

function init() {
    $("#tabs").tabs();
    myuid = $("#currentUserId").val();

    if (currentType == discussType.broad) {

        //加载老师和学生
    } else if (currentType == discussType.group) {
        //加载我的小组

        //加载组内成员
    } else {
        //加载个人聊天
    }
}

//加载组内成员
function loadGmember(groupId, gname) {
    $(".my-return").show();

    $.ajax({
        url: "loadGroupMem",
        data: {"groupId": groupId},
        success: function (data) {
            if (data.msg == "success") {

                initGroupView(data.groupMembers, gname)
            } else {
                console.info(data.msg)
            }
        },
        error: function () {
            console.info("失败")
        }
    });
    if (groupId == 0) {
        currentType = discussType.broad;
        receIdx = 0
    } else {
        currentType = discussType.group;
        receIdx = groupId;
    }

}

//加载所有小组
function loadAllGroup() {
    $(".my-return").hide();
    $.ajax({
        url: "loadAllGroup",
        data: "",
        success: function (data) {
            if (data.msg == "success") {
                initGroupListView(data.groupList)
            } else {
                console.info(data.msg)
            }
        },
        error: function () {
            console.info("失败")
        }
    })
}

//加载小组成员界面
function initGroupView(ulist, gname) {
    //console.info(ulist[0])
    $("#leftHead").html("小组成员");
    $("#rightHead").html("在" + gname + "讨论");
    chatChange();

    ss = "";
    cRole = $("#currentUserRole").val();

    temlplate = $("#leftArea").html();
    $.each(ulist, function (k, v) {
        if (v.role == "tea") {
            //教师的按钮组
            btns = $("#normalbtn").html();
            if (cRole == "stu")
                btns += $("#teabtns").html()

        } else {
            if (v.role == "stu") {
                //学生的按钮组
                btns = $("#normalbtn").html();
                if (cRole == "tea")
                    btns += $("#stubtns").html()
            }
        }
        v.buttons = btns;
        ss += temlplate.temp(v)
    });
    $("#leftA").html(ss)
}

//加载小组列表界面
function initGroupListView(groupList) {
    $("#leftHead").html("选择讨论组");
    $("#rightHead").html("课堂讨论");
    chatChange();

    // ss=""
    ss = $("#leftAreaClassDiss").html();
    cRole = $("#currentUserRole").val();

    temlplate = $("#leftAreaGList").html();
    // if (typeof (groupList)=="string"){
    //     groupList=JSON.parse(groupList);
    // }
    $.each(groupList, function (k, v) {
        ss += temlplate.temp(v)
    });

    $("#leftA").html(ss)
}

//发送消息
function send() {
    sendMsg = $("#sendMsg").val();
    // receId=$("#receId").val()
    $.ajax({
        url: "/sendM",
        data: {"receiveid": receIdx, "msg": sendMsg, "msgtype": currentType},
        success: function (data) {
            //alert("发送成功")
            var content = {"sender": "我", "msg": sendMsg};
            var tx = $("#sendx").val();
            var ss = tx.temp(content);
            $("#sendMsg").val("");
            $("#chatBox-content-demo").append(ss);
            $('#chatBox-content-demo').scrollTop($('#chatBox-content-demo')[0].scrollHeight);

        }
        , error: function () {
            console.info("send bad")
        }
    })
}

function sleep(numberMillis) {
    var now = new Date();
    var exitTime = now.getTime() + numberMillis;
    while (true) {
        now = new Date();
        if (now.getTime() > exitTime)
            return;
    }
}

//检查新消息
function checkmsg() {

    $.get("/receM", function (data, status) {
        if (data.msg == "success") {
            //  console.info(data.msgList);

            jiexi(data.msgList, receIdx);
            checkmsg();
        } else {
            console.info("fail");
            if (data.msg == "unlogin") {
                alert("未登录");
                window.location.href = "index.jsp"
            } else
                checkmsg();
        }

    });
}

//解析消息
function jiexi(msgList, receId) {
    $.each(msgList, function (key, val) {
        if (val.receiveId == receId && val.types == currentType) {
            //console.info(val.receiveId==receId&&val.types==currentType)
            if (val.sender.uid == myuid) {
                return true;
            }
            var tx = $("#recex").val();
            var ss = "";
            val.sendTime = val.sendTime.split(" ")[3];
            ss = tx.temp(val);
            $("#chatBox-content-demo").append(ss);
            $('#chatBox-content-demo').scrollTop($('#chatBox-content-demo')[0].scrollHeight);

        } else {
            // alert("aa")
            saveMsg(val);
            alertMessage(val)
            //保存消息并提醒有新消息
        }
    })
}

function saveMsg(message) {
    //保存到本地
}

function chatChange() {
    msg = $("#chatBox-content-demo").html();
    $("#chatBox-content-demo").html("");
    saveMsgHistory(msg, currentType, receIdx);
}

function saveMsgHistory(msgHTML, cType, rid) {
    keyx = "c" + cType + "r" + rid;
    myCharHistory[keyx] = msgHTML;
}

function alertMessage(message) {
    M = {};
    //根据消息类型分别提醒

    if (message.types == discussType.sys) {
        //系统消息
        //   if(message.beAlertId!=myuid){return;}
        switch (message.systemMessageType + "") {
            case  systemMType.askQ:
                //   if(message.beAlertId!=myuid){return;}
                swal({
                        title: "提问！",
                        text: "" + message.message,
                        type: "input",
                        showCancelButton: false,
                        closeOnConfirm: false,
                        animation: "slide-from-top",
                        inputPlaceholder: "输入你的答案"
                    },
                    function (inputValue) {
                        if (inputValue === false) return false;

                        if (inputValue === "") {
                            swal.showInputError("你需要输入答案！");
                            return false
                        }

                        swal("非常好！", "你输入了：" + inputValue, "success");
                    });

                break;
            case  systemMType.handsUp:
                swal({
                    title: "举手",
                    text: message.sender.userName + "向您举起了手",
                    imageUrl: "swx/handsup.png"
                });
                break;
            case  systemMType.paperPush:
                if (cRole == 'tea') {
                    return;
                }
                m = message.message;
                marr = m.split(":");
                pid = marr[1];
                local = "stu/takeExam?paperid=" + pid;
                if (M.dialog5) {
                    return M.dialog5.show();
                }
                M.dialog5 = jqueryAlert({
                    'content': "老师推送了试卷快去看看吧",
                    'modal': true,
                    'contentTextAlign': 'left',
                    'width': '450px',
                    'animateType': 'linear',
                    'runs': runs(local),
                    'buttons': {
                        '不去': function () {
                            M.dialog5.close();
                        },
                        '去看看': function () {

                            window.location.href = local;
                        }
                    }
                });

                break;
            case  systemMType.paperFinish:
                break;

            case systemMType.warn:
                swal({
                    title: "警告",
                    text: "" + message.message,
                    type: "warning",
                    showCancelButton: false,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定！",
                    closeOnConfirm: true
                });
                break;
            case  systemMType.other:
                break;


            default:
                console.info(message.systemMessageType);
                break;
        }

    } else {

        //普通消息
    }
}

function warnx(x) {
    studentUid = $(x).parent().attr("id").substr(4);

    swal({
            title: "确定警告该学生吗？",
            text: "此操作无法撤销！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "警告！",
            closeOnConfirm: false

        },
        function () {
            swal({
                    title: "扣分！",
                    text: "输入扣多少分：",
                    type: "input",
                    showCancelButton: false,
                    closeOnConfirm: false,
                    animation: "slide-from-top",
                    inputPlaceholder: "不扣分填0"
                },
                function (inputValue) {
                    if (inputValue === false) return false;

                    if (inputValue === "") {
                        swal.showInputError("你需要输入扣分数！");
                        return false
                    }
                    sendWarns(studentUid, inputValue);
                    swal("成功！", "你的操作已生效", "success");
                });


        });
}

function handsupx(x) {
    teacherUid = $(x).parent().attr("id").substr(4);
    swal({
            title: "确定举手吗？",
            text: "你将无法撤销该操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "举手！",
            cancelButtonText: "取消！",
            closeOnConfirm: false
        },
        function (isConfirm) {
            if (isConfirm) {
                sendHandsUp(teacherUid, "");
                swal("成功！", "你的操作已生效。",
                    "success");
            } else {
                swal("取消！", "该操作已取消",
                    "error");
            }
        });
}

function sendMsgx(x) {

}

function askQx(x) {
    studentUid = $(x).parent().attr("id").substr(4);
    swal({
            title: "提问！",
            text: "输入你的问题：",
            type: "input",
            showCancelButton: true,
            closeOnConfirm: false,
            animation: "slide-from-top",
            inputPlaceholder: "输入一些话"
        },
        function (inputValue) {
            if (inputValue === false) return false;

            if (inputValue === "") {
                swal.showInputError("你需要输入问题！");
                return false
            }
            sendAskQs(studentUid, inputValue);
            swal("成功", "已经提出该问题", "success");
        });
}

//伴随弹框运行
function runs(ll) {
    // alert("aa")
    i = 5;
    id = setInterval(function () {
        i--;
        if (i == 0) {
            window.location.href = ll;
            //clearInterval(id);
        }
        $(".alert-btn-p")[1].innerHTML = "去看看(" + i + "s)"
    }, 1 * 1000)


}

function sendWarns(uid, marks) {
    $.ajax({
        url: "warn",
        data: {"beWarned": uid, "punish": marks},
        success: function (data) {
            if (data.msg != "success") {
                console.info("fail")
            }
        },
        error: function () {
            console.info("失败")
        }
    })
}

function sendAskQs(uid, question) {
    $.ajax({
        url: "askQ",
        data: {"beAsked": uid, "messageDetial": question},
        success: function (data) {
            if (data.msg != "success") {
                console.info("fail")
            }
        },
        error: function () {
            console.info("失败")
        }
    })
}

function sendHandsUp(uid, question) {
    $.ajax({
        url: "hdup",
        data: {"beAsked": uid, "messageDetial": question},
        success: function (data) {
            if (data.msg != "success") {
                console.info("fail")
            }
        },
        error: function () {
            console.info("失败")
        }
    })
}