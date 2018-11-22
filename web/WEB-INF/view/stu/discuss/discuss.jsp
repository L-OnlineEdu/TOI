<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>讨论</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link href="/utils/css/discss.css" rel="stylesheet">


    <!-- CORE CSS-->
    <link href="/utils/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="/utils/css/style.css" type="text/css" rel="stylesheet" media="screen,projection">

    <link type="text/css" href="/utils/css/chat.css" rel="stylesheet">
    <link type="text/css" href="/utils/alert/css/alert.css" rel="stylesheet">

</head>

<body>


<!-- Modal Structure -->
<!--发送消息框-->
<div id="modal3" class="modal">

    <div class="modal-content ">

        <!--ss-->


        <div class="row">
            <div class="input-field col s12">
                <input type="text" id="sendMsg"/>
                <label for="sendMsg" class="">发送消息</label>
            </div>
            <!--     <div class="row">
                     <div class="input-field col s12">
                         <button class="btn cyan waves-effect waves-light right" type="submit" name="action">Submit
                             <i class="mdi-content-send right"></i>
                         </button>
                     </div>
                 </div>-->
        </div>
        <!--ss-->
    </div>
    <div class="modal-footer   lighten-4">
        <a href="#" class="waves-effect waves-red btn-flat modal-action modal-close">关闭</a>
        <a href="#" class="waves-effect waves-green btn-flat modal-action modal-close" onclick="send()">发送</a>
    </div>
</div>

<!--给某人发消息-->

<div class="modal" id="personModal">

    <div class="modal-content  chatbox" id="personMBox">

        <!--ss-->
        <ul class="chat-thread">
            <li class="leftChat" data-uid="1">Are we meeting today?</li>
            <li class="leftChat" data-uid="1">I was thinking after lunch, I have a meeting in the morning</li>

            <li class="leftChat" data-uid="1">Are we meeting today?</li>
            <li class="leftChat" data-uid="1">I was thinking after lunch, I have a meeting in the morning</li>

        </ul>


        <div class="row">
            <div class="input-field col s12">
                <input type="text" id="messagex" style="color: #FFFFFF"/>
                <label for="messagex" class="">发送消息</label>
            </div>

        </div>
        <!--ss-->
    </div>
    <div class="modal-footer   lighten-4">
        <a href="#" class="waves-effect waves-red btn-flat" onclick="closeModal()">关闭</a>
        <a href="#" class="waves-effect waves-green btn-flat" onclick="sendPersonMesonage()">发送</a>
    </div>

</div>

<%--选择小组框--%>
<div id="slgroup" class="modal modal-fixed-footer">
    <div class="modal-content">
        <h4>选择小组</h4>
        <div class="collection">
            <a href="#!" class="collection-item">白菜</a>
            <a href="#!" class="collection-item active">青菜</a>
            <a href="#!" class="collection-item">萝卜</a>
            <a href="#!" class="collection-item">土豆</a>
        </div>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">确定</a>
    </div>
</div>

<!-- jQuery Library -->
<script src="/utils/js/jquery-1.11.2.min.js"></script>
<script src="/utils/alert/js/alert.js"></script>
<%--me--%>
<script type="text/javascript" src="/assert/core/msg/reconnecting-websocket.min.js"></script>

<script type="text/javascript" src="/assert/core/msg/ws.js"></script>

<script type="text/javascript" src="/assert/core/msg/jxoo.js"></script>
<!--materialize js-->
<script type="text/javascript" src="/utils/js/materialize.min.js"></script>

<!--plugins.js - Some Specific JS codes for Plugin Settings-->
<script type="text/javascript" src="/utils/js/plugins.js"></script>
<link rel="stylesheet" type="text/css" href="/utils/swx/sweetalert.css">
<script src="/utils/swx/sweetalert-dev.js"></script>

<div class="pace  pace-inactive">
    <div class="pace-progress" data-progress-text="100%" data-progress="99"
         style="transform: translate3d(100%, 0px, 0px);">
        <div class="pace-progress-inner"></div>
    </div>
    <div class="pace-activity"></div>
</div>

<style>
    body ul .dropdown-content {
        position: fixed;
    !important;
    }
</style>
<div data-reactroot="" style="flex: 1 1 0%; height: 100%;">
    <div class="page">
        <div class="bgColor">
            <!-- START HEADER -->
            <header id="header" class="page-topbar">
                <!-- start header nav-->
                <div class="navbar-fixed">
                    <nav class="cyan">
                        <div class="nav-wrapper">
                            <h1 class="logo-wrapper"><a href="/stu/stuhome.jsp" class="brand-logo darken-1"><img
                                    src="/utils/img/materialize-logo.png" alt="materialize logo"></a> <span
                                    class="logo-text">Materialize</span></h1>
                            <ul class="right hide-on-med-and-down">

                                <li>
                                    <a href="/stu/stuhome.jsp" class="waves-effect waves-block waves-light">
                                        <i class="mdi-maps-local-library"
                                           style="margin-top:-7px;margin-bottom:-14px"></i>
                                        <label style="display: block; text-align: center; font-size: 10px; line-height: 14px; cursor: pointer; color:#FFF;">首页</label>
                                    </a>

                                </li>

                                <li>
                                    <a href="/stu/discuss" class="waves-effect waves-block waves-light">
                                        <i class="mdi-social-poll" style="margin-top:-7px;margin-bottom:-14px"></i>
                                        <label style="display: block; text-align: center; font-size: 10px; line-height: 14px; cursor: pointer; color:#FFF;">我的讨论</label>
                                    </a>

                                </li>
                                <li>
                                    <div class="row" style="width:150px;margin-bottom:-10px;">
                                        <div class="col col s4 m4 l4" style="padding-top:10px;">
                                            <img src="/utils/ava/${user.uid}.jpg" alt=""
                                                 class="circle responsive-img valign ">
                                        </div>
                                        <div class="col col s1 m1 l1" style="margin-left:-20px;">
                                            <ul id="profile-dropdown" class="dropdown-content" style="width:20px;">
                                                <li><a href="/login">退出</a>
                                                </li>

                                            </ul>

                                            <a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn"
                                               style="width:200px;" href="#" data-activates="profile-dropdown">
                                                ${user.userName} ▼
                                            </a>

                                        </div>
                                    </div>
                                </li>

                            </ul>

                        </div>

                    </nav>
                </div>
                <!-- end header nav-->
            </header>
            <div class="discussions" style="height: calc(100% - 60px);">
                <div class="discussionPanel">
                    <div class="discussionPanel" style="width: 270px;">

                        <div class="list" id="tablists">
                            <div class="discussionTitleCard slgroup" onclick="openGroupMessage('0')" id="tab0">
                                <div class="infoBox">
                                    <span style="font-size: 20px; margin-right: 4px;">课堂讨论</span>

                                </div>
                                <div class="count" style="background-color: rgb(67, 134, 112);">0</div>

                            </div>
                        </div>

                    </div>
                </div>
                <div class="teacherContent">


                    <div class="contents">

                    </div>


                </div>
                <div class="discussionList" id="dicBigBox">
                    <div style="width: 100%; height: 36px; flex: 0 0 auto;"></div>

                </div>
                <div class="bottomCard">
                    <div class="discussionBottomBar">
                        <div class="leftBtns">

                            <button class="btn waves-effect waves-light" onclick="sendMsgx()" type="button"
                                    style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px 16px 0px 12px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); height: 56px; line-height: 56px; min-width: 88px; color: rgb(255, 255, 255); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; position: relative; overflow: hidden; text-align: center;">
                                <div>

                                    <span style="position: relative; padding-left: 8px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 20px;">发送消息</span>
                                </div>
                            </button>
                            <button class="btn waves-effect waves-light" onclick="groupMode()" type="button"
                                    style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px 16px 0px 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); height: 56px; line-height: 56px; min-width: 88px; color: rgb(255, 255, 255); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; position: relative; overflow: hidden;  text-align: center;">
                                <div>
                                    <span style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; overflow: hidden; pointer-events: none;"></span>
                                    <span style="position: relative; padding-left: 8px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 20px;">分组讨论</span>
                                </div>
                            </button>

                            <%--  <button class="btn waves-effect waves-light"  onclick="handsupx('0')" type="button" style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px 16px 0px 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); height: 56px; line-height: 56px; min-width: 88px; color: rgb(255, 255, 255); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; position: relative; overflow: hidden;  text-align: center;">
                                  <div>
                                      <span style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; overflow: hidden; pointer-events: none;"></span>
                                      <span style="position: relative; padding-left: 8px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 20px;">举手</span>
                                  </div>
                              </button>--%>
                        </div>
                        <div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="userName" value="${user.userName}"/>
<input type="hidden" id="userId" value="${user.uid}"/>
<input type="hidden" id="userRole" value="${user.role}"/>
<script type="text/html" id="newMesTemplateT">
    <div class="discussionCard" style="padding: 16px 12px 12px;">
        <img size="64" class="dropdown-button" href="#!" data-activates="dropdown%mid%"
             src="/utils/ava/%sender.uid%.jpg"
             class="avatar"
             style="color: rgb(255, 255, 255); background-color: rgb(255, 255, 255); user-select: none; display: inline-flex; align-items: center; justify-content: center; font-size: 32px; border-radius: 50%; height: 64px; width: 64px;">
        <ul id="dropdown%mid%" class="dropdown-content" style="position:fixed;">
            <li><a href="#!" onclick="handsupx('%sender.uid%')">举手</a></li>
            <li><a href="#!" onclick="openPersonMsgDialog('%sender.uid%')">发消息</a></li>
        </ul>
        <div class="contentInfo">

            <div class="title">
                <div class="name"><span style="margin-right: 0px;"></span>

                    <div class="time">%sendTime%</div>
                    <span class="badgex" data-badge-caption="老师消息"></span>
                </div>

            </div>
            <div class="content">%message%</div>
        </div>
    </div>

</script>
<script type="text/html" id="newMesTemplate">
    <div class="discussionCard" style="padding: 16px 12px 12px;">
        <img size="64" class="dropdown-button" href="#!" data-activates="dropdown%mid%"
             src="/utils/ava/%sender.uid%.jpg"
             class="avatar"
             style="color: rgb(255, 255, 255); background-color: rgb(255, 255, 255); user-select: none; display: inline-flex; align-items: center; justify-content: center; font-size: 32px; border-radius: 50%; height: 64px; width: 64px;">
        <ul id="dropdown%mid%" class="dropdown-content" style="position:fixed;">
            <li><a href="#!" onclick="openPersonMsgDialog('%sender.uid%')">发消息</a></li>
        </ul>

        <div class="contentInfo">
            <div class="title">
                <div class="name"><span style="margin-right: 0px;"></span>
                    <div class="time">%sendTime%</div>
                </div>

            </div>
            <div class="content">%message%</div>
        </div>
    </div>

</script>
<script type="text/html" id="disscussTemplate">

    <div class="discussionTitleCard" onclick="openGroupMessage('%gid%')" id="tab%gid%">
        <div class="infoBox">
            <span style="font-size: 20px; margin-right: 4px;">%gname%</span>

        </div>
        <div class="count" style="background-color: rgb(67, 134, 112);">0</div>

    </div>
</script>

<style>
    .slgroup {
        background-color: rgb(76, 190, 161);
    }
</style>
</body>

</html>
