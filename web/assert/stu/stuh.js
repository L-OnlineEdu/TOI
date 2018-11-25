$(function () {
    refreshInfoMap()
});

function refreshInfoMap() {
    $.ajax({
        url: "/feedStu",
        data: {},
        success: function (data) {
            if (data != "null") {
                var mypoints = data.myScore;
                $("#mypoints").html(mypoints + "分");
                var onlineDisNum = data.onlineDiscuss;
                $("#onliNum").html(onlineDisNum + "人");
                var warnNums = data.warnNums;
                $("#warnNum").html(warnNums + "个");
                var warnList = data.warnList;
                var testing = "无";
                if (data.lastExam == null) {
                    testing = "无";
                    $("#lexamtime").html("没有正在进行的测验")
                } else {
                    testing = "有";
                    $("#lexamtime").html("开始时间：" + data.lastExam.startTimes.substr(0, 19));
                    $("#enterexam").attr("href", "/stu/takeExam?paperid=" + data.lastExam.paper.pid + "&examTime=" + data.lastExam.examTime)
                }


                //console.info(testing)
                $("#isExam").html(testing);
                $("#warn-collection").children(":not(':first')").remove();
                $("#score-collection").children(":not(':first')").remove();
                ss = "";
                $(warnList).each(function (k, v) {
                    ss += "<li class=\"collection-item\">\n" +
                        "                    <div class=\"row\">\n" +
                        "                        <div class=\"col s7\">\n" +
                        "                            <p class=\"collections-title\"><strong>-" + v.pointsOff + "</strong>分</p>\n" +
                        "                            <p class=\"collections-content\"></p>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"col s2\">\n" +
                        "                            <span class=\"task-cat cyan\">" + v.teacher.userName + "</span>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"col s3\">警告原因：\n" +
                        "                            " + v.warnMessage + "\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                </li>"

                });
                $("#warn-collection").append(ss);

                var scoreList = data.scoreReportList;
                ss2 = "";
                $(scoreList).each(function (k, v) {
                    ss2 += "<li class=\"collection-item\">\n" +
                        "                    <div class=\"row\">\n" +
                        "                        <div class=\"col s7\">\n" +
                        "                            <p class=\"collections-title\"><strong>" + v.score + "</strong>分</p>\n" +
                        "                            <p class=\"collections-content\"></p>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"col s2\">\n" +
                        "                            <span class=\"task-cat cyan\">" + v.tea + "</span>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"col s3\">用时：\n" +
                        "                            " + v.time + "分钟\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                </li>"

                });

                $("#score-collection").append(ss2)
            }
        },
        error: function () {
            console.info("badx")
        }
    })
}