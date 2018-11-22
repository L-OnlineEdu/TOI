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
systemMType = {
    "askQ": "1",
    "handsUp": "2",
    "paperPush": "3",
    "paperFinish": "4",
    "warn": "5",
    "ansQ": "6",
    "ated": "7",
    "cour": "9",
    "exit": "10",
    "ques": "11",
    "subAsw": "12",
    "other": "13",
    "pract": "14",
    "conEstablish": "0",
    "JoCour": "15",
    "questionN": "16"
};
currentFilterType = "1";

receIdx = 0;
myuid = 0;
myCharHistory = {};
id = "";
cclock = "";
$(function () {
    init();
    //initLongConnnect()
    //loadAllGroup()
    // checkmsg()
    /* $('#dicBigBox').scroll(function () {
         initDrop();
     })*/
    initWS()
});

function init() {

    myuid = $("#userId").val();
    $(".discussionTitleCard").hover(function () {
        gdiv = "#g" + $(this).attr("id").substr(3);
        //  if ($(gdiv).children().length>0){
        $(this).children(".count").html($(gdiv).children().length)
        //}

    })
}

function initWS() {
    var host = location.origin.split("//")[1].split(":")[0];
    var webSocket = new WebSocket("ws://" + host + ":8080/ws/" + myuid + "/1");
    webSocket.onopen = function (event) {
        console.log("连接成功");
        console.log(event);
        //cclock=setInterval(function(){
        //initWS();


        //},1*1000)
    };
    webSocket.onerror = function (event) {
        console.log("连接失败");
        console.log(event);
    };
    webSocket.onclose = function (event) {
        console.log("Socket连接断开");
        console.log(event);
    };
    webSocket.onmessage = function (event) {
        //接受来自服务器的消息
        var obj = eval('(' + event.data + ')');
        var objl = [];
        objl.push(obj);
        jiexi(objl)
        // console.info(event)
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
        currentFilterType = discussType.broad;
        receIdx = 0
    } else {
        currentFilterType = discussType.group;
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
    temlplate = $("#disscussTemplate").html();
    ss = "";
    $.each(groupList, function (k, v) {
        ss += temlplate.temp(v)
    });
    $("#tablists").append(ss);
    $(".discussionTitleCard").hover(function () {
        gdiv = "#g" + $(this).attr("id").substr(3);
        //  if ($(gdiv).children().length>0){
        $(this).children(".count").html($(gdiv).children().length)
        //}

    })
}

//发送消息
function send() {
    sendMsg = $("#sendMsg").val();
    // receId=$("#receId").val()
    $.ajax({
        url: "/sendM",
        data: {"receiveid": receIdx, "msg": sendMsg, "msgtype": currentFilterType},
        success: function (data) {
            alert("发送成功")
            //  var content={"sender":"我","msg":sendMsg}
            //  var tx=$("#sendx").val()
            //  var ss= tx.temp(content)
            //  $("#sendMsg").val("")
            /*   $("#chatBox-content-demo").append(ss)
               $('#chatBox-content-demo').scrollTop( $('#chatBox-content-demo')[0].scrollHeight );*/

        }
        , error: function () {
            console.info("send bad")
        }
    })
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

function initLongConnnect() {
    connect();
    /*    window.onbeforeunload= function(event) {
            return confirm("确定离开此页面吗？");
        }*/

    window.onunload = function (event) {
        onclose();
        return confirm("确定离开此页面吗？");
    }

}

//长连接检查消息
function connect() {
    $.ajax({
        url: "/longpolling?method=onOpen",
        cache: false,
        dataType: "text",
        success: function (data) {
            if (data == "unlogin") {
                alert("未登录");
                window.location.href = "/login"
            }
            else {
                connect();
                // console.info(data)
                //var obj = JSON.stringify(data);
                var obj = eval('(' + data + ')');
                var objl = [];
                objl.push(obj);
                jiexi(objl)
            }

        }
    });
}

function onclose() {
    $.ajax({
        url: "/longpolling?method=onClose",
        cache: false,
        dataType: "text",
        success: function (data) {
            //connect();
            console.info(data)
        }
    });
}

function groupMode() {
    if ($(".list").children().length <= 1) {
        loadAllGroup();

    }

}


function loadAllGroup() {
    $(".my-return").hide();
    $.ajax({
        url: "/loadAllGroup",
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


//解析消息
function jiexi(msgList) {
    $.each(msgList, function (key, val) {
        console.info(val);
        val.sendTime = val.sendTime.split(" ")[3];
        switch (val.types) {
            case discussType.person:
                //个人消息
                var chatId;
                if (val.receiveId == myuid) {
                    chatId = val.sender.uid;
                } else {
                    chatId = val.receiveId
                }
                if ($("#p" + chatId).length < 1) {

                    $("#personMBox").prepend("<ul class=\"chat-thread\" id='p" + chatId + "' style='display:none'></ul>")

                }
                if (val.sender.uid == myuid)
                /* $("#p"+val.receiveId).append("<li class='rightChat'>"+val.message+"</li>")*/
                    console.info("收到一条自己的消息");
                else
                    $("#p" + chatId).append("<li class='leftChat' data-uid='" + val.sender.uid + "'>" + val.message + "</li>");


                $("#p" + chatId).scrollTop($("#p" + chatId)[0].scrollHeight);
                if ($("#p" + chatId).css("display") == 'none') {
                    //  ss="p"+val.receiveId

                    sx = '<span>收到一条新消息</span><a class="btn light-blue" onclick="openPersonMsgDialog(\'' + val.sender.uid + '\')">查看<a>';
                    console.info(sx);
                    Materialize.toast(sx, 5000);

                }
                if (val.message.indexOf("ssqn") != -1) {
                    b = val.message.replace("ssqn", "");
                    alert("根据老师要求，需要你对ID为" + b + "的同学进行评价");
                    $(location).attr('href', '/qn/question.html?flag=ssqn&&rid=' + b + "&&type=1")
                }
                break;
            case discussType.sys:
                alertMessage(val);
                break;
            case discussType.group:
            case discussType.broad:
                //群组消息
                if ($("#g" + val.receiveId).length < 1) {
                    //  console.info(val.receiveId+" "+val.types)
                    if (currentFilterType == val.types && receIdx == val.receiveId)
                        $("#dicBigBox").prepend("<div class=\"dl\" id='g" + val.receiveId + "'></div>");
                    else {
                        $("#dicBigBox").prepend("<div class=\"dl\" style='display: none' id='g" + val.receiveId + "'></div>");
                        groupMode();
                    }

                }

                if (val.sender.role == 'stu') {
                    tx = $("#newMesTemplate").html();
                }
                else {
                    tx = $("#newMesTemplateT").html();
                }


                ss = tx.temp(val);
                $("#g" + val.receiveId).append(ss);

                if ($("#g" + val.receiveId).css("display") == 'none') {
                    Materialize.toast('<span>收到一条新消息</span><a class="btn light-blue" onclick="openGroupMessage(' + val.receiveId + ')">查看<a>', 5000)
                }
                $("#g" + val.receiveId).scrollTop($("#g" + val.receiveId)[0].scrollHeight);
                initDrop();

                break;
        }

    })
}

function initDrop() {
    $('.dropdown-button').dropdown({
        inDuration: 300,
        outDuration: 225,
        constrain_width: false, // Does not change width of dropdown to that of the activator
        hover: false, // Activate on hover
        gutter: 0, // Spacing from edge
        belowOrigin: true, // Displays dropdown below the button
        alignment: 'left' // Displays dropdown with edge aligned to the left of button
    });
}

function turnMessage(messageIdx) {
    //console.info(typeof messageIdx)
    messageId = "#" + messageIdx;
    if (messageIdx.substr(0, 1) == "p") {

        $(messageId).show();
        $(messageId).siblings(":not(':last')").hide();
        $("#personModal").openModal();
    } else {
        $(messageId).show();
        $(messageId).siblings(":not(':last')").hide();
    }
}

function closeModal() {
    $("#personModal").closeModal({
        complete: function () {
            currentFilterType = discussType.broad;
            receIdx = 0;
            $("#personMBox").children(":not(':last')").hide();
        }
    })
}

function saveMsg(message) {
    //保存到本地
}

function chatChange() {
    msg = $("#chatBox-content-demo").html();
    $("#chatBox-content-demo").html("");
    saveMsgHistory(msg, currentFilterType, receIdx);
}

function saveMsgHistory(msgHTML, cType, rid) {
    keyx = "c" + cType + "r" + rid;
    myCharHistory[keyx] = msgHTML;
}

$("#couring").click(function () {
    if (this.text == "点击进入课堂") {
        teaid = $("#teaid").val();
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/stu/joinCourse",//url
            data: {"teaId": teaid},
            success: function (result) {
                window.location = "/stu/studying.jsp"
            },
            error: function () {
                alert("异常！");
            }
        });
    }
});

function alertMessage(message) {
    var details = $("#details");
    var couring = $("#couring");
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
                        sendAnsQs(message.sender.uid, inputValue)

                    });

                break;
            case  systemMType.handsUp:


                swal({
                        title: "举手",
                        text: message.sender.userName + "向您举起了手",
                        imageUrl: "/utils/swx/handsup.png",
                        showCancelButton: true,
                        confirmButtonText: "对他提问",
                        cancelButtonText: "忽略",
                        closeOnConfirm: false,
                        closeOnCancel: true
                    },
                    function (isConfirm) {
                        if (isConfirm) {
                            askQx(message.sender.uid)
                        }
                    });
                break;
            case  systemMType.paperPush:
                //if(cRole=='tea'){return;}
                m = message.message;
                marr = m.split(",");
                paperid = marr[1];
                extime = marr[3];

                local = "/stu/takeExam?paperid=" + paperid + "&examTime=" + extime;
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
                            clearInterval(id);
                        },
                        '去看看': function () {

                            window.location.href = local;
                        }
                    }
                });
                break;

            case systemMType.pract:
                m = message.message;
                marr = m.split(",");
                paperid = marr[1];
                extime = marr[3];
                local = "/stu/takePractice?paperid=" + paperid + "&practiceTime=" + extime;
                if (M.dialog5) {
                    return M.dialog5.show();
                }
                M.dialog5 = jqueryAlert({
                    'content': "你有新的练习推送快去看看吧",
                    'modal': true,
                    'contentTextAlign': 'left',
                    'width': '450px',
                    'animateType': 'linear',
                    'runs': runs(local),
                    'buttons': {
                        '不去': function () {
                            M.dialog5.close();
                            closeModal(id)
                        },
                        '好的': function () {
                            window.location.href = local;
                        }
                    }
                });
                break;

            case  systemMType.paperFinish:
                m = message.message;
                score = m.split(":")[1];
                $(".scoress").append("<li class=\"collection-item dismissable\" style=\"touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">\n" +
                    score + "分" +
                    "<label  style=\"text-decoration: none;\">" + message.sendTime + "<a href=\"#\" class=\"secondary-content\"><span class=\"ultra-small\"><span class=\"task-cat teal\">" + message.sender.userName + "</span></span></a>\n" +
                    "                        </label>\n" +
                    "                    </li>");
                break;

            case systemMType.ques:
                flag = $("#flag").val();
                if (flag != "Iamteacher") {
                    m = message.message;
                    marr = m.split(":");
                    $.ajax({
                        url: "/stu/selectQues",
                        data: {"quesId": marr[1]},
                        success: function (data) {
                            $("#quescont").html(data.question.title);

                            arr = [];
                            al = ['A', 'B', 'C', 'D'];

                            for (i = 0; i < al.length; i++) {
                                xstart = data.question.answers.search(al[i]);
                                xend = -1;
                                if (i + 1 != al.length) {
                                    xend = data.question.answers.search(al[i + 1])
                                }
                                arr[i] = data.question.answers.slice(xstart, xend)
                            }
                            $("#sa1").text(arr[0]);
                            $("#sa2").text(arr[1]);
                            $("#sa3").text(arr[2]);
                            $("#sa4").text(arr[3])
                        }
                        , error: function () {
                            alert("异常")
                        }
                    });
                    $("#modal6").openModal()
                }
                break;

            case systemMType.subAsw:
                subFlag = $("#subFlag").val();
                if (subFlag == "showResult") {
                    m = message.message;
                    marr = m.split(":");

                    rateA = (marr[3] / marr[1]) * 100;
                    rateB = (marr[5] / marr[1]) * 100;
                    rateC = (marr[7] / marr[1]) * 100;
                    rateD = (marr[9] / marr[1]) * 100;
                    rateN = 100 - (rateA + rateB + rateC + rateD);
                    $(".right_pillar_bg_1").css("height", rateA + "%");
                    $(".right_pillar_bg_4").css("height", rateB + "%");
                    $(".right_pillar_bg_6").css("height", rateC + "%");
                    $(".right_pillar_bg_8").css("height", rateD + "%");
                    $(".right_pillar_bg_10").css("height", rateN + "%");

                    realRateA = rateA.toString().substring(0, 5);
                    realRateB = rateB.toString().substring(0, 5);
                    realRateC = rateC.toString().substring(0, 5);
                    realRateD = rateD.toString().substring(0, 5);
                    realRateN = rateN.toString().substring(0, 5);

                    if (rateA > 0)
                        $(".right_pillar_bg_1").html(marr[3] + "<br>" + realRateA + "%");
                    if (rateB > 0)
                        $(".right_pillar_bg_4").html(marr[5] + "<br>" + realRateB + "%");
                    if (rateC > 0)
                        $(".right_pillar_bg_6").html(marr[7] + "<br>" + realRateC + "%");
                    if (rateD > 0)
                        $(".right_pillar_bg_8").html(marr[9] + "<br>" + realRateD + "%");
                    if (rateN > 0)
                        $(".right_pillar_bg_10").html((marr[1] - marr[3] - marr[5] - marr[7] - marr[9]) + "<br>" + realRateN + "%")
                }
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

            case systemMType.ansQ:
                swal({
                    title: message.sender.userName + "回答了问题",
                    text: "回答：" + message.message,
                    type: "info",
                    showLoaderOnConfirm: true
                });
                break;

            case  systemMType.JoCour:
                m = message.message;
                marr = m.split(":");

                $("#showState tr").each(function () {
                    if (marr[3] == $(this).children().eq(2).text().trim()) {
                        $(this).children().eq(0).html(
                            "<i style=\"float: left; width: 15px; height: 15px; background-color: rgb(72, 209, 174); margin-right: 3px;\"></i>"
                        )
                    }
                });
                break;

            case  systemMType.exit:
                m = message.message;
                marr = m.split(":");
                $("#showState tr").each(function () {
                    if (marr[3] == $(this).children().eq(2).text().trim()) {
                        $(this).children().eq(0).html(
                            "<i style=\"float: left; width: 15px; height: 15px; background-color: rgb(216,216,216); margin-right: 3px;\"></i>"
                        )
                    }
                });
                break;
            case systemMType.cour:
                couring.text("点击进入课堂");
                couring.css("background-color", "#ffd208");
                m = message.message;
                marr = m.split(":");
                teaid = marr[1];
                $("#teaid").val(teaid);
                break;
            case systemMType.ated:
                ateding.text("点击签到");
                ateding.css("background-color", "#ffd208");
                m = message.message;
                marr = m.split(":");
                arid = marr[1];
                $("#arid").val(arid);
                /*swal({
                        title: "点名",
                        text: "请输入您的学号姓名",
                        type: "input",
                        showCancelButton: true,
                        closeOnConfirm: false,
                        animation: "slide-from-top",
                        inputPlaceholder: "格式：20XXXX李小明"
                    },
                    function(inputValue){
                        if (inputValue === false) return false;

                        if (inputValue === "") {
                            swal.showInputError("请先输入您的信息");
                            return false
                        }

                        swal("签到成功", "您的信息为：" + inputValue,"success");
                    });*/
                break;
            case systemMType.conEstablish:
                console.info("conn establash");
                clearInterval(cclock);
                break;

            case systemMType.questionN:

                if (message.message == "tsqn" && $("#msgflag").val() != "true") {
                    alert("教师已推送试卷，需要评价");
                    $(location).attr('href', '/qn/question.html?flag=tsqn&&ruid=' + message.sender.uid + '&&type=1')

                }
                if (message.message.indexOf("ssqn") != -1 && $("#msgflag").value != "true") {
                    b = val.message.replace("ssqn", "");
                    alert("根据老师要求，需要你对ID为" + b + "的同学进行评价");
                    $(location).attr('href', '/qn/question.html?flag=ssqn&&rid=' + b + "&&type=1")
                }

                break;
            default:
                console.info(message.systemMessageType);
                break;
        }

    } else {
        console.info(message + "  ->e")
        //普通消息
    }
}

function warnx(x) {
    studentUid = x; //$(x).parent().attr("id").substr(4)

    /* swal({
             title: "确定警告该学生吗？",
             text: "此操作无法撤销！",
             type: "warning",
             showCancelButton: true,
             confirmButtonColor: "#DD6B55",
             confirmButtonText: "警告！",
             closeOnConfirm: false

         },
         function(){*/
    swal({
        title: "请输入警告信息!",
        text: "扣分数 <input type='text' class='wann' id='apoint'>"
        + "原因 <input type='text' class='wann'  id='areason'><div id='watip' class=\"sa-error-container\">" +
        "      <div class=\"icon\">!</div>\n" +
        "      <p>输入警告信息</p>" +
        "    </div>",
        html: true,
        type: "prompt",
        closeOnConfirm: false,
        closeOnCancel: true,
        showCancelButton: true

    }, function () {
        points = $("#apoint").val();
        warnReason = $("#areason").val();
        tt = /^[0-9]\d*$/;
        if (!tt.test(points) || warnReason == "") {
            $("#watip").addClass("show");
            $(".wann").focus(function () {
                $(".sa-error-container").removeClass("show")
            })
        } else {

            sendWarns(studentUid, points, warnReason);

            swal({
                title: "成功",
                text: "成功警告该学生",
                timer: 800,
                type: "success",
                showConfirmButton: false
            });
        }


    })


    /* });*/
}

function handsupx(x) {
    teacherUid = x;//$(x).parent().attr("id").substr(4)
    swal({
            title: "确定举手吗？",
            text: "将向老师举手",
            type: "info",
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

function sendMsgx() {
    // studentUid=$(x).parent().attr("id").substr(4)
    swal({
            title: "发言",
            text: "输入你想说的话：",
            type: "input",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "发送",
            cancelButtonText: "取消",
            animation: "slide-from-top",
            inputPlaceholder: "输入一些话"
        },
        function (inputValue) {
            if (inputValue === false) return false;

            if (inputValue === "") {
                swal.showInputError("你需要输入内容！");
                return false
            }
            sendMessage(inputValue)

        });
}

function sendMessage(sendMsg) {
    $.ajax({
        url: "/sendM",
        data: {"receiveid": receIdx, "msg": sendMsg, "msgtype": currentFilterType},
        success: function (data) {

            if (currentFilterType == discussType.person) {
                ulid = "#p" + receIdx;
                if ($(ulid).length < 1) {
                    $("#personMBox").prepend("<ul class=\"chat-thread\" id='p" + receIdx + "' style='display: block'></ul>")
                }
                $(ulid).append("<li  class='rightChat' data-uid='" + myuid + "'>" + sendMsg + "</li>");
                $(ulid).scrollTop($(ulid)[0].scrollHeight);
                $("#messagex").val("")

            } else {
                if (data.msg = "success")
                    swal({
                        title: "成功",
                        text: "成功发送",
                        timer: 800,
                        type: "success",
                        showConfirmButton: false
                    });
                else
                    swal("错误", "失败", "error");
            }
        }
        , error: function () {
            swal("错误", "发送失败", "error");
            //  console.info("send bad")
        }
    })
}

function sendPersonMesonage() {
    m = $("#messagex").val();
    if (m == "") {
        $("#messagex").focus();
        $("#messagex").attr("placeholder", "输入消息内容");
    } else {
        sendMessage(m)
    }


}

function askQx(x) {
    studentUid = x;//$(x).parent().attr("id").substr(4)
    swal({
            title: "提问！",
            text: "输入你的问题：",
            type: "input",
            showCancelButton: true,
            cancelButtonText: "取消",
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
            swal({
                title: "成功",
                text: "已经成功提出问题",
                timer: 800,
                type: "success",
                showConfirmButton: false
            });
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
            clearInterval(id);
        }
        $(".alert-btn-p")[1].innerHTML = "去看看(" + i + "s)"
    }, 1 * 1000)


}

function sendWarns(uid, marks, warnReason) {
    $.ajax({
        url: "/warn",
        data: {"beWarned": uid, "punish": marks, "reason": warnReason},
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
        url: "/askQ",
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

function sendAnsQs(uid, answer) {
    $.ajax({
        url: "/ansQ",
        data: {"receverid": uid, "messageDetial": answer},
        success: function (data) {
            if (data.msg = "success") {
                swal({
                    title: "成功",
                    text: "回答成功",
                    timer: 800,
                    type: "success",
                    showConfirmButton: false
                });
            } else {
                swal("失败", "回答失败:)",
                    "error");

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
        url: "/hdup",
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

function openPersonMsgDialog(receiveID) {
    if ($("#p" + receiveID).length < 1) {
        $("#personMBox").children(":not(':last')").hide();
    }
    receIdx = receiveID;
    currentFilterType = discussType.person;
    turnMessage("p" + receIdx)
}

function openGroupMessage(groupid) {
    groupDiv = "#g" + groupid;
    console.info(groupDiv);
    $("#tab" + groupid).addClass("slgroup");
    $("#tab" + groupid).siblings().removeClass("slgroup");
    if ($(groupDiv).html() == undefined) {
        $("#dicBigBox").children(":not(':last')").hide();
    }
    if (groupid != 0)
        currentFilterType = discussType.group;
    else if (groupid == 0)
        currentFilterType = discussType.broad;
    else
        console.info("error" + groupid);
    receIdx = groupid;
    turnMessage("g" + groupid)
}

function findQnresult(tp) {
    $.ajax({
        url: "/getQnRs",
        data: {type: tp},
        success: function (data) {
            $.each(data.qn, function (key, val) {
                if (tp == 2) {
                    $("#qn1").append(
                        "        <li class=\"collection-item\">\n" +
                        "                    <div class=\"row\">\n" +
                        "                        <div class=\"col s6\">\n" +
                        "                            <p class=\"collections-title\">" + val.result + "</p>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"col s3\">\n" +
                        "                            <span class=\"task-cat cyan\">tea1</span>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"col s3\">\n" +
                        "                            <div class=\"project-line-1\"></div>\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                </li>"
                    )
                } else {
                    $("#qn2").append(
                        "        <li class=\"collection-item\">\n" +
                        "                    <div class=\"row\">\n" +
                        "                        <div class=\"col s6\">\n" +
                        "                            <p class=\"collections-title\">" + val.result + "</p>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"col s3\">\n" +
                        "                            <span class=\"task-cat cyan\">匿名</span>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"col s3\">\n" +
                        "                            <div class=\"project-line-1\"></div>\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                </li>"
                    )


                }


            })
        },
        error: function () {
            console.info("失败")
        }
    })


}