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
String.prototype.answer = function (obj) {

    return this.replace(/[A-Z](\.|、)/gi, function (matchs) {


        var returns = "<br><input type='radio' onclick=\"checkx(this,\'" + obj.rightAnswer + "\')\" name='" + obj.questionId + "' value='" + obj.questionId + matchs.substr(0, 1) + "'>" + matchs;
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

function findpaper() {
    $.ajax({
        url: "/papers",
        data: "",
        success: function (data) {
            ss = "";
            $.each(data.paperList, function (key, val) {
                console.info("pid:" + val.pid);
                $.each(val.questions, function (keyx, valx) {
                    var tx = $("#quest").val();
                    valx.thx = keyx + "、";
                    valx.answers = valx.answers.answer(valx);


                    ss += tx.temp(valx)

                })
            });
            $("#quesbox").html(ss)
        },
        error: function () {
            console.info("bad")
        }
    })

}