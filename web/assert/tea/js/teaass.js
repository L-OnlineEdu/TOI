$(function () {

    tokenvalue = $("#token").html().trim();
    token = new Token(tokenvalue);
    user = new User();
    token.login("/core/autologin", function (userData) {
        user.parseJSON(userData);
        user.show()
    })

});