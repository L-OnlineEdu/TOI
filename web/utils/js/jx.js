$(function () {
    checkmsg()
});

function send() {
    sendMsg = $("#sendMsg").val();
    receId = $("#receId").val();

    $.ajax({
        url: "/sendM",
        data: {"receiveid": receId, "msg": sendMsg},
        success: function (data) {
            alert("发送成功")
        }
        , error: function () {

        }
    })
}

function checkmsg() {

    $.get("/receM", function (data, status) {
        if (data.msg == "success") {
            var sender = data.received.sender.userName;
            var messg = data.received.message;
            //  console.info(sender+" "+messg);
            var ss = "<tr><td>" + sender + "</td><td>" + messg + "</td></tr>";
            $("#ta").append(ss);
            checkmsg();

        } else {
            checkmsg();
        }

    });
}