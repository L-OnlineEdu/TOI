function User() {
    /*this.id=id;
    this.name=name;
    this.passwd=passwd;*/


}

User.prototype.show = function () {
    console.info("id" + this.uid + "name" + this.uname + "passwd" + this.passwd);
};
User.prototype.parseJSON = function (userJson) {
    this.uid = userJson.uid;
    this.uname = userJson.userName;
    this.passwd = userJson.passWord;
    this.role = userJson.role;
};