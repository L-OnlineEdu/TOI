<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录</title>
    <link rel="stylesheet" href="/utils/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/utils/assets/css/admin.css">
    <link rel="stylesheet" href="/utils/assets/css/app.css">
</head>

<body data-type="login">

<div class="am-g myapp-login">
    <div class="myapp-login-logo-block  tpl-login-max">
        <div class="myapp-login-logo-text">
            <div class="myapp-login-logo-text">
                在线教育<span> 登录</span> <i class="am-icon-skyatlas"></i>

            </div>
        </div>

        <div class="login-font">
            <i>登录 </i> 或<span> 注册</span>
        </div>
        <div class="am-u-sm-10 login-am-center">
            <form class="am-form" action="/home/login" method="post">
                <fieldset>
                    <div class="am-form-group">
                        <input type="text" name="userName" class="" id="doc-ipt-email-1" placeholder="在这里输入用户名">
                    </div>
                    <div class="am-form-group">
                        <input type="password" name="passWd" class="" id="doc-ipt-pwd-1" placeholder="在这里输入密码">
                    </div>
                    <p>
                        <button type="submit" class="am-btn am-btn-default">登录</button>
                    </p>
                </fieldset>
            </form>
        </div>
    </div>
</div>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>

</html>