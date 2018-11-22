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


        var returns = matchs;
        return (returns + "") == "undefined" ? "" : returns
    })
};

function checkx(th, right) {
    var r = $(".qright");
    var w = $(".qwrong");
    var ps = $("#prescores");
    rightnum = parseInt(r.html());
    wrongnum = parseInt(w.html());
    nx = $(th).attr('name');
    $(th).attr("checked", true);
    $("[name=" + nx + "]").attr("disabled", true);
    console.info(nx.substr(2));
    if ($(th).val().substr(-1) == right) {

        $("#dtk" + nx.substr(2)).css("background", "green");
        r.html(rightnum + 1);
        ps.html(r.html())
    } else {
        $("#dtk" + nx.substr(2)).css("background", "red");
        $("#ans" + nx.substr(2)).show();
        w.html(wrongnum + 1)
    }
    $("#dtk" + nx.substr(2)).children().css("color", "white")

}

$(function () {
    findpaper()
});

function findpaper() {

    if (getTh()) {
        th = getTh();

        $.ajax({
            url: "/displaypaper",
            data: {"paperid": th},
            success: function (data) {

                if (data.msg != "null") {
                    ss = "";
                    sx = "";
                    lex = 0;
                    //$.each(data.paperList,function (key,val) {
                    lex = data.questionList.length;
                    //  console.info("pid:"+val.pid)
                    $.each(data.questionList, function (keyx, valx) {
                        var tx = $("#tb").val();
                        valx.keyx = keyx;
                        valx.key1 = keyx + 1;
                        aa = "";
                        arr = [];
                        al = ['A', 'B', 'C', 'D'];
                        if (valx.answers.indexOf("A、") > -1) {
                            aa = "、"
                        } else {
                            aa = "."
                        }

                        for (i = 0; i < al.length; i++) {
                            xstart = valx.answers.search(al[i] + "\.?、?");
                            xend = -1;
                            if (i + 1 != al.length)
                                xend = valx.answers.search(al[i + 1] + "\.?、?");
                            arr[i] = valx.answers.slice(xstart + 2, xend)
                            //console.info(al[i]+" st:"+xstart+" xe:"+xend)
                            //console.info(i+":"+arr[i])
                        }
                        //valx.a=arr
                        valx.a00 = arr[0];
                        valx.a01 = arr[1];
                        valx.a02 = arr[2];
                        valx.a03 = arr[3];

                        ss += tx.temp(valx);
                        sx += $("#dtkt").val().temp(valx)

                    });

                    //  })
                    $(".content_lit").html(lex);
                    $(".content_fs").html(lex);
                    $("#dtk").html(sx);
                    $("#tbbox").html(ss)
                } else {
                    console.info("试卷不存在")
                }

            },
            error: function () {
                console.info("bad")
            }
        })

    }
    else console.info("题号不存在")
}

function getTh() {
    th = $("#th").val();
    if (th != "") {
        return th;
    } else {
        return false;
    }
}


function answers() {
    swal({
            title: "确定交卷？",
            text: "交卷后将结束本次测验！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定交卷",
            cancelButtonText: "再做会",
            closeOnConfirm: false,
            closeOnCancel: false
        },
        function (isConfirm) {
            var ps = $("#prescores").text();
            if (isConfirm) {
                map = {};
                $(".radioOrCheck:checked").each(function () {
                    console.info($(this).val());
                    var ans = $(this).val();
                    questionNo = $(this).val().match(/\d+/);
                    choice = $(this).val().match(/[A-Da-d]/);
                    map[questionNo] = choice.toString();
                });
                $("#answers").val(JSON.stringify(map));
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "correctpaper",//url
                    data: $('#submitForm').serialize(),
                    success: function (result) {
                        swal({
                                title: "提交成功",
                                text: "本次测验成绩：" + result.scores + "分",
                                type: "success",
                                confirmButtonText: "OK",
                                closeOnConfirm: true,
                            },
                            function (isConfirm) {
                                window.location = "/stu/stuhome.jsp"
                            })
                    },
                    error: function () {
                        alert("异常！");
                    }
                });
            } else {
                swal("取消", "继续答题",
                    "error");
            }
        });
}

function ti_jiao() {
    swal({
            title: "提交练习？",
            text: "确定提交本次练习？",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定",
            cancelButtonText: "再做会",
            closeOnConfirm: false,
            closeOnCancel: false
        },
        function (isConfirm) {
            var ps = $("#prescores").text();
            if (isConfirm) {
                map = {};
                $(".radioOrCheck:checked").each(function () {
                    console.info($(this).val());
                    var ans = $(this).val();
                    questionNo = $(this).val().match(/\d+/);
                    choice = $(this).val().match(/[A-Da-d]/);
                    map[questionNo] = choice.toString();
                });
                $("#answers").val(JSON.stringify(map));
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "correctPractice",//url
                    data: $('#submitForm').serialize(),
                    success: function (result) {
                        swal({
                                title: "提交成功",
                                text: "本次测验成绩：" + result.scores + "分",
                                type: "success",
                                confirmButtonText: "OK",
                                closeOnConfirm: true,
                            },
                            function (isConfirm) {
                                window.location = "/stu/stuhome.jsp"
                            })
                    },
                    error: function () {
                        alert("异常！");
                    }
                });
            } else {
                swal("取消", "继续答题",
                    "error");
            }
        });
}