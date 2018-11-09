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
$(function () {
    checkmsg()
});

function send() {
    sendMsg = $("#sendMsg").val();
    receId = $("#receId").val();
    types = $("#types").val();

    $.ajax({
        url: "/sendM",
        data: {"receiveid": receId, "msg": sendMsg, "msgtype": types},
        success: function (data) {
            //alert("发送成功")
            var content = {"sender": "我", "msg": sendMsg};
            var tx = $("#sendx").val();
            var ss = tx.temp(content);
            $("#msgbox").append(ss);
            $('#msgbox').scrollTop($('#msgbox')[0].scrollHeight);

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

function checkmsg() {

    $.get("/receM", function (data, status) {
        if (data.msg == "success") {

            $.each(data.msgList, function (key, val) {
                var tx = $("#recex").val();
                var ss = "";
                ss = tx.temp(val);
                $("#msgbox").append(ss);
                $('#msgbox').scrollTop($('#msgbox')[0].scrollHeight);
                //   sleep(500)
                // console.info("ss:"+ss+"val:"+val);
            });

            // var sender=data.received.sender.userName;
            // var messg=data.received.message;
            // var content={"sender":sender,"msg":messg}
            // var tx=$("#sendx").val()
            // var ss= tx.temp(content)
            // $("#msgbox").append(ss)
            // $('#msgbox').scrollTop( $('#msgbox')[0].scrollHeight );

            //  var ss="<tr><td>"+sender+"</td><td>"+messg+"</td></tr>"
            //  $("#ta").append(ss);
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