function Token(value) {
    this.value = value;

}

Token.prototype.login = function (url, callback) {
    $.ajax({
        url: url,
        data: {"token": this.value},
        success: function (data) {
            if (data.msg == "success") {
                callback(data.user)
            } else {
                console.info("Token失效")
            }
        },
        error: function () {
            console.info("连接失败")
        }
    })
};
Token.prototype.store = function () {
    localStorage.setItem("token", JSON.stringify(this));
};
// Token.prototype.clear=function () {
//     localStorage.removeItem("token");
// }
