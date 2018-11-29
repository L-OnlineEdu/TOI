$(document).ready(function () {

    /*  $('.modal').modal({
             dismissible: false, // Modal can be dismissed by clicking outside of the modal
              starting_top: '4%', // Starting top style attribute
              ending_top: '10%', // Ending top style attribute
              ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
                  alert("Ready");
                  console.log(modal, trigger);
              },
              complete: function() { alert('Closed'); } // Callback for Modal close
          }
      );*/

});

function sendM() {
    var a = $("#ifm").contents().find("input:radio:checked").select().val();
    if (a == "tsqn") {
        sendMsg = a;
        receId = 0;
        $.ajax({
            url: "/ass/sendTsM",
            data: {"receiveid": receId, "msg": sendMsg, "msgtype": 4},
            success: function (data) {
                alert("发送成功")
            }
            , error: function () {
                console.info("send bad")
            }
        })
    }
    if (a == "ssqn") {
        window.location.href = 'http://localhost:8080/utils/temp/ssqn.html'

    }
    $('#a1').click();


}






