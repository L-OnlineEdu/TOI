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
                        "<td><a href='#' onclick='undoWarn(\"" + v.student.userName + "\",\"" + v.id + "\")'><i class='mdi-action-delete'></i></a></td></tr>"
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

function addWarn() {
    $("#viewwarn").closeModal();
    $("#slstu").openModal()
}
