$(function () {
    $(".warn-btn").click(function () {
        setTimeout(refreshWarnInfo(), 2000);


        $("#viewwarn").openModal();
    });
    $(".score-btn").click(function () {
        refreshScore();
        $("#viewexam").openModal();
    });


    refreshStulist()

});

function refreshWarnInfo() {
    $.ajax({
        url: "/allWarns",
        data: "",
        success: function (data) {

            if (data.warnList != "null") {
                $("#warndetils").html("");
                ss = "";
                $.each(data.warnList, function (k, v) {
                    ss += "<tr><td>" + v.student.userName + "</td><td>" + v.warnMessage + "</td><td>" + v.pointsOff + "</td><td>" + v.teacher.userName + "</td>" +
                        "<td><a href='#' onclick='undoWarn(\"" + v.student.userName + "\",\"" + v.id + "\")'><i class='mdi-action-delete'></i></a>" + "<a href='#' onclick='editWarn(\"" + v.pointsOff + "\",\"" + v.warnMessage + "\",\"" + v.student.uid + "\",\"" + v.id + "\")'><i class='mdi-editor-mode-edit'></i></a></td></tr>"
                });
                $("#warndetils").html(ss)

            } else {
                alert("没有警告")
            }
        },
        error: function () {
            console.info("bad")
        }
    })
}

function refreshStulist() {
    $.ajax({
        url: "/stuList",
        data: "",
        success: function (data) {
            if (data.stuList != "null") {

                ss = "";
                $.each(data.stuList, function (k, v) {
                    ss += "<a href=\"#!\" class=\"collection-item sel-items modal-action modal-close\" onclick='warnx(\"" + v.uid + "\")'>" + v.userName + "</a>"
                });
                $(".stulist").html(ss);
                $(".sel-items").click(function () {
                    $(this).addClass("active");
                    $(this).siblings().removeClass("active")
                })
            } else {
                alert("没有学生")
            }
        },
        error: function () {
            console.info("bad")
        }
    })


}

function refreshScore() {
    $.ajax({
        url: "/tea/scores",
        data: "",
        success: function (data) {
            $("#scoreDetils").html("");
            if (data.scoresList != undefined) {
                ss = "";
                $.each(data.scoresList, function (k, v) {
                    ss += "<tr><td>" + v.stu + "</td>" +
                        "<td>" + v.score + "</td>" +
                        "<td>" + v.time + "</td>" +
                        "<td>" + v.tea + "</td></tr>"
                });
                $("#scoreDetils").html(ss)
            }
        },
        error: function () {
            console.info("bad")
        }
    })
}

function undoWarn(stuN, warnId) {
    swal({
            title: "确定删除" + stuN + "的这次警告吗",
            text: "",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "删除！",
            closeOnConfirm: false
        },
        function () {
            $.ajax({
                url: "/delWarn",
                data: {"warnid": warnId},
                success: function (data) {
                    if (data.msg = "success")
                        swal({
                            title: "成功",
                            text: stuN + "的警告已经被删除",
                            timer: 800,
                            type: "success",
                            showConfirmButton: false
                        });
                    refreshWarnInfo();
                },
                error: function () {
                    swal("失败", "检查是否登录", "error");
                }
            })


        });
}

function editWarn(pointsoff, warnMessage, beWarnedId, warnId) {
    //console.info(v)
    $("#viewwarn").closeModal();
    // studentUid = x; //$(x).parent().attr("id").substr(4)

    swal({
        title: "修改警告信息!",
        text: "扣分数 <input type='text' class='wann' id='apointe' value='" + pointsoff + "'>"
        + "原因 <input type='text' class='wann'  id='areasone' value='" + warnMessage + "'><div id='watip' class=\"sa-error-container\">" +
        "      <div class=\"icon\">!</div>\n" +
        "      <p>输入警告信息</p>" +
        "    </div>",
        html: true,
        type: "prompt",
        closeOnConfirm: false,
        closeOnCancel: true,
        showCancelButton: true

    }, function () {
        points = $("#apointe").val();
        warnReason = $("#areasone").val();
        tt = /^[0-9]\d*$/;
        if (!tt.test(points) || warnReason == "") {
            $("#watip").addClass("show");
            $(".wann").focus(function () {
                $(".sa-error-container").removeClass("show")
            })
        } else {

            editWarns(warnId, beWarnedId, points, warnReason);


            swal({
                title: "成功",
                text: "警告修改成功",
                timer: 800,
                type: "success",
                showConfirmButton: false
            });
        }


    })

}
function addWarn() {
    $("#viewwarn").closeModal();
    $("#slstu").openModal()
}


function warnx(x) {
    studentUid = x; //$(x).parent().attr("id").substr(4)

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

function editWarns(wid, uid, marks, warnReason) {
    $.ajax({

        url: "/editwarn",
        data: {"wid": wid, "beWarned": uid, "punish": marks, "reason": warnReason},
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