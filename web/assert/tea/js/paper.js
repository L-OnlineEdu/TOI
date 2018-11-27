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

function checkx(th, right) {
    nx = $(th).attr('name');
    $(th).attr("checked", true);
    if ($(th).val().substr(-1) == right) {
        //alert("对了")
        $("[name=" + nx + "]").attr("disabled", true)
    } else {
        mapx = {'A': 1, 'B': 2, 'C': 3, 'D': 4};
        //$(this)
        abcd = $("#p" + $(th).attr("name")).html().split("<br>");
        abcd[mapx[$(th).val().substr(-1)]] = "<font color='red'>" + abcd[mapx[$(th).val().substr(-1)]] + "</font>";
        abcd[mapx[right]] = "<font color='green'>" + abcd[mapx[right]] + "</font>";

        $("#p" + $(th).attr("name")).html(abcd.join("<br>"));
        $("[name=" + nx + "]").attr("disabled", true)
        //alert("错误")
    }

}

$(function () {
    findpaper()
});
arrx = [];
arrp = [];
pushid = '1';

function findpaper() {

    $.ajax({
        url: "/tea/findAllPaper",
        data: "",
        success: function (data) {
            //alert(data.length)
            //pushid = data.paperList[0].pid;
            var da = JSON.parse(data);
            console.info(da.paperList);
            pushid = da.paperList[0].pid;


            danti = 0;
            tiku = 0;
            tiku = da.paperList.length;
            $.each(da.paperList, function (key, val) {
                console.info("pid:" + val.pid);
                pid = val.pid;
                arrp[pid] = val;
                arrx[pid] = val.questionList;
                danti += val.questionList.length;
                /* arrx[pid] = 10;
                 danti += 10;*/

                $("#thaom").append(" <span id='p" + pid + "' onclick='jx(this)'>\n" +
                    "                <div style=\"display: flex; flex-direction: row; justify-content: space-between; align-items: center; height: 36px; margin-bottom: 5px; margin-top: 5px; cursor: pointer; position: relative; box-sizing: border-box; \"   >\n" +
                    "                    <i class=\"fa fa-caret-right\" style=\"position: absolute; left: 10px; top: 9px; color: rgb(102, 102, 102); display: block;\"></i>\n" +
                    "                    <div style=\"font-size: 12px; color: rgb(0, 0, 0); padding-left: 26px;\">\n" +
                    "                        <i class=\"mdi-content-inbox\" style=\"font-size: 21px; margin-right: 5px; vertical-align: middle; position: relative; top: -1px; left: -2px;\"></i>\n" +
                    "                        <span>" + val.pname + "</span>\n" +
                    "                    </div>\n" +
                    "                    <label style=\"text-align: right; font-size: 12px; color: rgb(74, 74, 74); margin-right: 30px;\">" + val.questionList.length + "</label>\n" +
                    "                </div>\n" +
                    "            </span>")


                //$("#sl").append("<option value='"+val.pid+"' id='k"+key+"' name='cop'>"+val.pname+"</option>")

            });

            $('select').material_select();
            jiexi();
            $("#p0").children().addClass("selectx");
            $("#dtt").html(danti);

            $(".deleteCl").click(function () {
                var but = "<center><Button class='waves-effect waves-light btn red' onclick='de(" + $(this).attr("id").substring(7) + ")'>确认删除</Button></center>";
                console.info("1234567890-" + but);
                $("#alertChoose").openModal();
                $("#alertChoose").children(":first").html(but);
            });

            $(".editorCl").click(function () {
                var editId = $(this).attr("id").substring(7);
                console.info("1234567890-" + editId);
                editor(editId);
                $("#alertEditor").openModal();
                //$("#alertEditor").children(":first").html(but);
            });
            $("#zjj").html(tiku)

        },
        error: function () {
            console.info("bad")
        }
    })

}

function jiexi() {
    // console.info(pushid)
    k = 1;
    if ($(".selectx ").parent().attr("id") != undefined) {
        pushid = $(".selectx").parent().attr("id").substr(1);
        k = pushid
    }


    ss = "";
    $.each(arrx[k], function (keyx, valx) {
        var tx = $("#questionx").html();
        valx.thx = (keyx + 1);

        if (valx.flag == undefined) {
            arr = [];
            al = ['A', 'B', 'C', 'D'];
            if (valx.answer.indexOf("A、") > -1) {
                aa = "、"
            } else {
                aa = "."
            }

            for (i = 0; i < al.length; i++) {
                xstart = valx.answer.search(al[i] + "\.?、?");
                xend = -1;
                if (i + 1 != al.length)
                    xend = valx.answer.search(al[i + 1] + "\.?、?");
                arr[i] = valx.answer.slice(xstart + 2, xend)

            }
            valx.a00 = arr[0];
            valx.a01 = arr[1];
            valx.a02 = arr[2];
            valx.a03 = arr[3];

            valx.flag = true;
        }


        ss += tx.temp(valx)

    });
    $("#qbox").html(ss);
    dra()
}

/*function sendx() {
    //window.location.href="about:blank";
    //window.close();
    // window.parent.close()
    //  window.parent.closeWin()
    //$("body").empty()
    // $("body").prepend($("#tp").html())
    swal({
            title: "测验",
            text: "输入测验开启时间",
            type: "input",
            showCancelButton: false,
            closeOnConfirm: false,
            animation: "slide-from-top",
            inputPlaceholder: "单位为分钟"
        },
        function (inputValue) {

            tt = /^[0-9]\d*$/;


            if (inputValue == "0" || !tt.test(inputValue)) {
                swal.showInputError("输入测验所需时间");
                return false
            }

            $.ajax({
                url: "/tea/pushpaper",
                data: {'paperid': pushid, 'examTime': inputValue},
                success: function (data) {
                    console.info(data.msg);
                    if (data.msg == "success") {
                        swal("成功！", "测验已开启", "success");
                        window.location.href = "/tea/paperPushed"

                    } else {
                        swal("失败！", "确认是否登录", "error");
                    }
                }
            })
        });


}*/

function jx(t) {

    $(t).children().addClass("selectx");
    $(t).siblings().children().removeClass("selectx");
    jiexi();
    $(".PaperContext").html(arrp[pushid].pcontext);
    $(".PaperTime").html(arrp[pushid].ptime);
    $(".editorPaperContext").val(arrp[pushid].pcontext);
    $(".editorPaperTime").val(arrp[pushid].ptime)
}

$("#importQuestion").click(function () {
    $("#importQ").openModal();
});

function de(qu) {
    console.info("dasdadasd" + qu);
    $.ajax({
        url: "/tea/deleteQuestion",
        data: {"questionid": qu},
        success: function (data) {
            if (confirm("删除成功")) {
                location.reload()
            }
            //setTimeout("location.reload();", 500)
            // findpaper()
        }

    })
}

function editor(qu) {
    console.info("1234567-" + qu);
    $.ajax({
        url: "/tea/getQuestion",
        data: {"questionid": qu},
        success: function (data) {
            // alert(data.length);
            var da = JSON.parse(data);
            var ane = da.answer;
            var Alocation = ane.indexOf("A");
            var Blocation = ane.indexOf("B");
            var Clocation = ane.indexOf("C");
            var Dlocation = ane.indexOf("D");
            var str = ane.substring(Alocation, Blocation - 1) + "\n" + ane.substring(Blocation, Clocation - 1) + "\n" + ane.substring(Clocation, Dlocation - 1) + "\n" + ane.substring(Dlocation);
            $("#editorQuestionid").val(da.questionid);
            $("#editorRightAnswer").val(da.rightAnswer);
            $("#editorTitle").val(da.title);
            $("#editorType").val(da.type);
            $("#editorPaperId").val(da.pid);
            $("#editorAnswer").val(str)
        }

    })
}

$("#editTrue").click(function () {
    var questionid = $("#editorQuestionid").val();
    var rightAnswer = $("#editorRightAnswer").val();
    var title = $("#editorTitle").val();
    var answer = $("#editorAnswer").val();
    console.info("questionid  " + questionid + " " + rightAnswer + " " + title + " " + answer);
    $.ajax({
        url: "/tea/updateQuestion",
        data: {"questionid": questionid, "rightAnswer": rightAnswer, "title": title, "answer": answer},
        success: function (data) {
            if (confirm("更新成功")) {
                location.reload()
            }
            //setTimeout("location.reload();", 3000)
            // findpaper()
        }

    })
});
$(".PaperContext").dblclick(function () {
    $(".PaperContext").hide();
    $(".editorPaperContext").show()
});

$(".PaperTime").dblclick(function () {
    $(".PaperTime").hide();
    $(".editorPaperTime").show()
});

$(".editorPaperContext").blur(function () {
    $(".editorPaperContext").hide();
    $(".PaperContext").show();
    var pid = arrp[pushid].pid;
    var pcontext = $(".editorPaperContext").val();
    var ptime = $(".editorPaperTime").val();
    console.info("pcontext  " + pcontext + " " + ptime);
    $.ajax({
        url: "/tea/updatePaper",
        data: {"pid": pid, "ptime": ptime, "pcontext": pcontext},
        success: function (data) {

            if (confirm("更新成功")) {
                location.reload()
            }
            //location.reload()
            //setTimeout("location.reload();", 3000)
        }

    })
});

$(".editorPaperTime").blur(function () {
    $(".editorPaperTime").hide();
    $(".PaperTime").show();
    var pid = pushid;
    var pcontext = $(".editorPaperContext").val();
    var ptime = $(".editorPaperTime").val();
    console.info("pcontext  " + pid + " " + pcontext + " " + ptime);
    $.ajax({
        url: "/tea/updatePaper",
        type: "POST",
        data: {"pid": pid, "ptime": ptime, "pcontext": pcontext},
        dataType: "json",
        success: function (data) {
            //$(".editorPaperTime").hide();
            //$(".PaperTime").show();
            if (confirm("更新成功")) {
                location.reload()
            }
            //setTimeout("location.reload();", 3000)
        }

    })

});

$(".delPaper").click(function () {
    /*var pid = pushid
    $.ajax({
        url:"/deletePaperAction.action",
        type:"POST",
        data:{"pid":pid},
        dataType:"json",
        success:function(data){
            window.location.href = "./pushpaper.jsp"
        }

    })*/

    swal({
            title: "确定删除" + pid + "的试卷吗",
            text: "",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "删除！",
            closeOnConfirm: false
        },
        function () {
            $.ajax({
                url: "/tea/deletePaper",
                data: {"pid": pid},
                success: function (data) {
                    swal({
                        title: "成功",
                        text: pid + "的试卷已经被删除",
                        timer: 3000,
                        type: "success",
                        showConfirmButton: false
                    });
                    setTimeout("location.reload();", 3000)
                },
                error: function () {
                    swal("失败", "检查是否登录", "error");
                }
            })


        });
});

$(".addPaper").click(function () {
    $("#trash").show();
});

$("#addPaperTrue").click(function () {
    listq = [];
    var pname = $("#addPaperTitle").val();
    var pcontext = $("#addContext").val();
    var ptime = $("#addPaperTime").val();
    console.info("questionid  " + pname + " " + pcontext + " " + ptime);
    $("#addPaperQID").children().children().each(function () {
        var quid = $(this).attr("id").substr(11);
        listq.push(quid)

    });
    var str = JSON.stringify(listq);
    //alert(str);
    $.ajax({
        url: "/tea/addPaper",
        type: "POST",
        data: {"pname": pname, "pcontext": pcontext, "ptime": ptime, "questionList": str},
        //dataType: "json",
        success: function (data) {
            if (confirm("添加成功")) {
                location.reload()
            }
            //setTimeout("location.reload();", 1000)
        },
        eror: function () {
            alert("添加失败")
        }


    })
});

function dra() {
    $(".drag").draggable({
        cancel: "a.ui-icon", //点击图标不会启动拖动
        revert: "invalid", // 当物品不掉落时，物品将恢复到其初始位置
        containment: "document",
        opacity: 0.7,
        helper: "clone",//移动留痕迹
        cursor: "move",
        drag: function (event, ui) {

            //ui.helper.animate({height:"25px",width:"25px"});
        }
    });
}

$("#trash").droppable({
    drop: function (event, ui) {
        deleteImage(ui.draggable)
    }
});

function deleteImage($item) {
    $item.fadeOut(function () {
        var $list = $("ul", $("#addPaperQID")).length ?
            $("ul", $("#addPaperQID")) :
            $("<ul class='gallery ui-helper-reset ulsP'/>").appendTo($("#addPaperQID"));
        $item.append("").appendTo($list).fadeIn(function () {
        });
    });

}
