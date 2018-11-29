function findQnresult(tp) {
    $.ajax({
        url: "/ass/getQnRs",
        data: {type: tp},
        success: function (data) {
            $.each(data, function (key, val) {
                alert("111111");
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
                        "                         <div class=\"col s3\">\n" +
                        "                            <p class=\"collections-title\" onclick='deleteAss(" + val.cid + "," + val.type + ")'>删除</p>\n" +
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
                        "                         <div class=\"col s3\">\n" +
                        "                            <p class=\"collections-title\" onclick='deleteAss(" + val.cid + "," + val.type + ")'>删除</p>\n" +
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

function deleteAss(id, type) {
    $.ajax({
        url: "/ass/delRs",
        data: {"cid": id},
        success: function (data) {
            if (type == 2) {
                $("#qn1").children(":not(:first)").remove();
                findQnresult(2)
            } else {

                $("#qn2").children(":not(:first)").remove();
                findQnresult(1)

            }
        },
        error: function () {
            console.info("失败")
        }
    })
}