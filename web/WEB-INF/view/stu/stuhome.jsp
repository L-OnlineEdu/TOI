<%--
  Created by IntelliJ IDEA.
  User: kwinter
  Date: 2018/5/15
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>在线教育系统</title>


    <!-- CORE CSS-->
    <link href="/utils/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="/utils/css/style.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="/utils/swx/sweetalert.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link type="text/css" href="/utils/alert/css/alert.css" rel="stylesheet">

</head>

<body onload="checkCourse()">


<!-- //////////////////////////////////////////////////////////////////////////// -->

<!-- START HEADER -->
<header id="header" class="page-topbar">
    <!-- start header nav-->
    <div class="navbar-fixed">
        <nav class="cyan">
            <div class="nav-wrapper">
                <h1 class="logo-wrapper"><a href="/stu/home" class="brand-logo darken-1"><img
                        src="/utils/img/materialize-logo.png" alt="materialize logo"></a> <span class="logo-text">Materialize</span>
                </h1>
                <ul class="right hide-on-med-and-down">

                    <li>
                        <a href="/stu/home" class="waves-effect waves-block waves-light">
                            <i class="mdi-maps-local-library" style="margin-top:-7px;margin-bottom:-14px"></i>
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
                                <img src="/utils/ava/${user.uid}.jpg" alt="" class="circle responsive-img valign ">
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

<div>
    <div class="row">
        <div class="col s12 m6 l3">
            <div class="card">
                <div class="card-content  white-text" style="background:#5BE7C4">
                    <p class="card-stats-title"><i class="mdi-action-description"></i>我的成绩</p>
                    <h4 class="card-stats-number" id="mypoints">26分</h4>
                    <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-up"></i> <span
                            class="green-text text-lighten-5">最后一次测验分数</span>
                    </p>
                </div>
                <div class="card-action  darken-2" style="background:#5BE7C4">
                    <div id="clients-bar">
                        <a href="#work-collections" style="color:ghostwhite">详情</a>
                    </div>

                </div>
            </div>
        </div>
        <div class="col s12 m6 l3">
            <div class="card">
                <div class="card-content  white-text" style="background:#7A57D1">
                    <p class="card-stats-title"><i class="mdi-social-group"></i>我的讨论</p>
                    <h4 class="card-stats-number" id="onliNum">1人</h4>
                    <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-up"></i> <span
                            class="purple-text text-lighten-5">当前在线人数</span>
                    </p>
                </div>
                <div class="card-action  darken-2" style="background:#7A57D1">
                    <a href="/stu/discuss" style="color:ghostwhite">进入讨论</a>

                </div>
            </div>
        </div>
        <div class="col s12 m6 l3">
            <div class="card">
                <div class="card-content" style="background:#F5F7FA">
                    <p class="card-stats-title"><i class="mdi-alert-warning"></i>收到警告</p>
                    <h4 class="card-stats-number" id="warnNum">0个</h4>
                    <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-up"></i> <span
                            class="text-lighten-5">收到警告数目</span>
                    </p>
                </div>
                <div class="card-action darken-2" style="background:#F5F7FA">
                    <a href="#work-collections" style="color:black">详情</a>

                </div>
            </div>
        </div>
        <div class="col s12 m6 l3">
            <div class="card">
                <div class="card-content white-text" style="background:#50C1E9">
                    <p class="card-stats-title"><i class="mdi-av-snooze"></i>进行中的测验</p>
                    <h4 class="card-stats-number" id="isExam">无</h4>
                    <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-down"></i><span
                            class="deep-purple-text text-lighten-5" id="lexamtime">上次测验时间YYYY-MM-HH-SS</span>
                    </p>
                </div>
                <div class="card-action  darken-2" style="background:#50C1E9">
                    <a id="enterexam" href="#" style="color:ghostwhite">进入测验</a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col s12 m6 l4">
            <div id="profile-card" class="card">
                <div class="card-image waves-effect waves-block waves-light" style="background:#7F95D1">
                    <span style="background:#7F95D1"></span>
                </div>
                <div class="card-content">
                    <img src="/utils/ava/${user.uid}.jpg" alt=""
                         class="circle responsive-img activator card-profile-image">
                    <a href="/qn/question.html?flag=a&&rid=0&&type=0"
                       class="btn-floating activator btn-move-up waves-effect waves-light darken-2 right">
                        <i class="mdi-editor-mode-edit"></i>
                    </a>

                    <span class="card-title activator grey-text text-darken-4">${user.userName}</span>
                    <p><i class="mdi-action-perm-identity cyan-text text-darken-2"></i>${user.uid}</p>
                    <p><i class="mdi-communication-business cyan-text text-darken-2"></i>学生</p>
                    <p><i class="mdi-social-group  cyan-text text-darken-2"></i> 小组1</p>

                </div>


            </div>


        </div>

        <div class="col s12 m6 l4">
            <input type="hidden" id="teaid"/>
            <div id="flight-card" class="card">
                <div class="card-header  darken-2 amber">
                    <div class="card-title">
                        <h4 class="flight-card-title">今日课程</h4>
                        <p class="flight-card-date">2018-6-2</p>
                    </div>
                </div>
                <div class="card-content-bg white-text">
                    <div class="card-content">
                        <div class="row" style="text-align:center">


                            <div class="col s12 m12 l12">
                                <i class="mdi-social-notifications-on large"></i>
                            </div>


                            <div class="col s12 m12 l12  center-align">
                                <s:if test="courseFlag">
                                    <a id="couring" style="background-color: #ffd208"
                                       class="waves-effect waves-light btn-large">点击进入课堂</a>
                                </s:if>
                                <s:else>
                                    <a id="couring" class="waves-effect waves-light btn-large">暂无当前课程</a>
                                </s:else>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col s6 m6 l6 center-align">
                                <div class="flight-info">
                                    <p class="small"><span class="grey-text text-lighten-4">教师未登录</span></p>

                                </div>
                            </div>
                            <div class="col s6 m6 l6 center-align flight-state-two">
                                <div class="flight-info">
                                    <p class="small">
                                                    <span id="showHisCou" class="activator grey-text text-lighten-4">
                                                        查看历史课程
                                                    </span>
                                    </p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-reveal" style="display: none; transform: translateY(0px);">
                                <span class="card-title grey-text text-darken-4">我的历史课程
                                    <i class="mdi-navigation-close right"></i>
                                </span>
                    <div id="showDiv"></div>

                    <div class="row" style="text-align:center">


                        <%--<div class="col s12 m12 l12">
                            <i class="mdi-action-receipt large"></i>
                        </div>--%>


                        <%--<div class="col s12 m12 l12  center-align">
                            <a class="activator waves-effect waves-light btn-large">练习未开启</a>

                        </div>--%>

                    </div>
                    <%--<div class="row">
                        <div class="col s6 m6 l6 center-align">
                            <div class="flight-info">
                                <p class="small"><span class="grey-text">教师未登录</p>

                            </div>
                        </div>
                        <div class="col s6 m6 l6 center-align flight-state-two">
                            <div class="flight-info">
                                <p class="small"><span class="grey-text">上次练习时间</span></p>

                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>


        <div class="col s12 m12 l4">
            <ul id="task-card" class="collection with-header">
                <li class="collection-header cyan">
                    <h4 class="task-card-title">最近的签到</h4>
                    <p class="task-card-date">2015/5/1</p>
                </li>
                <li class="collection-item dismissable"
                    style="touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                    <input type="checkbox" id="task1">
                    <label for="task1" style="text-decoration: none;">2018/4/1 00：00 <a href="#"
                                                                                        class="secondary-content"><span
                            class="ultra-small">未签到</span></a>
                    </label>
                    <span class="task-cat teal">tea1</span>
                </li>
                <li class="collection-item dismissable"
                    style="touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                    <input type="checkbox" id="task2">
                    <label for="task2" style="text-decoration: none;">2018/4/1 00：00 <a href="#"
                                                                                        class="secondary-content"><span
                            class="ultra-small">未签到</span></a>
                    </label>
                    <span class="task-cat teal">tea1</span>
                </li>
                <li class="collection-item dismissable"
                    style="touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                    <input type="checkbox" id="task3" checked="checked"/>
                    <label for="task3" style="text-decoration: line-through;">2018/4/1 00：00 <a href="#"
                                                                                                class="secondary-content"><span
                            class="ultra-small">已签到</span></a>
                    </label>
                    <span class="task-cat teal">tea1</span>
                </li>
                <li class="collection-item dismissable"
                    style="touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                    <input type="checkbox" id="task4" checked="checked" disabled/>
                    <label for="task4" style="text-decoration: line-through;">2018/4/1 00：00 <a href="#"
                                                                                                class="secondary-content"><span
                            class="ultra-small">签到过期</span></a>
                    </label>
                    <span class="task-cat teal">tea1</span>
                </li>
            </ul>
        </div>

    </div>


</div>


<div id="work-collections">
    <div class="row">
        <span id="l-socre"></span>

        <div class="col s12 m12 l6">
            <ul id="score-collection" class="collection">
                <li class="collection-item avatar">
                    <i class="mdi-action-description circle light-blue darken-2"></i>
                    <span class="collection-header">成绩</span>
                    <p>你的历史成绩</p>
                    <a href="#" class="secondary-content"><i class="mdi-navigation-close"></i></a>
                </li>
                <li class="collection-item">
                    <div class="row">
                        <div class="col s6">
                            <p class="collections-title">0分</p>
                            <p class="collections-content">2018/5/1</p>
                        </div>
                        <div class="col s3">
                            <span class="task-cat cyan">tea1</span>
                        </div>
                        <div class="col s3">
                            <div class="project-line-1"></div>
                        </div>
                    </div>
                </li>
                <li class="collection-item">
                    <div class="row">
                        <div class="col s6">
                            <p class="collections-title">0分</p>
                            <p class="collections-content">2018/5/1</p>
                        </div>
                        <div class="col s3">
                            <span class="task-cat cyan">tea1</span>
                        </div>
                        <div class="col s3">
                            <div id="project-line-2"></div>
                        </div>
                    </div>
                </li>
                <li class="collection-item">
                    <div class="row">
                        <div class="col s6">
                            <p class="collections-title">0分</p>
                            <p class="collections-content">2018/5/1</p>
                        </div>
                        <div class="col s3">
                            <span class="task-cat cyan">tea1</span>
                        </div>
                        <div class="col s3">
                            <div class="project-line-1"></div>
                        </div>
                    </div>
                </li>
                <li class="collection-item">
                    <div class="row">
                        <div class="col s6">
                            <p class="collections-title">0分</p>
                            <p class="collections-content">2018/5/1</p>
                        </div>
                        <div class="col s3">
                            <span class="task-cat cyan">tea1</span>
                        </div>
                        <div class="col s3">
                            <div class="project-line-1"></div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <span id="l-warn"></span>
        <div class="col s12 m12 l6">
            <ul id="warn-collection" class="collection">
                <li class="collection-item avatar">
                    <i class="mdi-alert-warning circle red darken-2"></i>
                    <span class="collection-header">警告</span>
                    <p>你收到的警告</p>
                    <a href="#" class="secondary-content"><i class="mdi-navigation-close"></i></a>
                </li>
                <li class="collection-item">
                    <div class="row">
                        <div class="col s7">
                            <p class="collections-title"><strong>-3</strong>分</p>
                            <p class="collections-content">2018/5/1</p>
                        </div>
                        <div class="col s2">
                            <span class="task-cat cyan">tea1</span>
                        </div>
                        <div class="col s3">
                            扣分原因
                        </div>
                    </div>
                </li>
                <li class="collection-item">
                    <div class="row">
                        <div class="col s7">
                            <p class="collections-title"><strong>-3</strong>分</p>
                            <p class="collections-content">2018/5/1</p>
                        </div>
                        <div class="col s2">
                            <span class="task-cat cyan">tea1</span>
                        </div>
                        <div class="col s3">
                            扣分原因
                        </div>
                    </div>
                </li>
                <li class="collection-item">
                    <div class="row">
                        <div class="col s7">
                            <p class="collections-title"><strong>-3</strong>分</p>
                            <p class="collections-content">2018/5/1</p>
                        </div>
                        <div class="col s2">
                            <span class="task-cat cyan">tea1</span>
                        </div>
                        <div class="col s3">
                            扣分原因
                        </div>
                    </div>
                </li>
                <li class="collection-item">
                    <div class="row">
                        <div class="col s7">
                            <p class="collections-title"><strong>-3</strong>分</p>
                            <p class="collections-content">2018/5/1</p>
                        </div>
                        <div class="col s2">
                            <span class="task-cat cyan">tea1</span>
                        </div>
                        <div class="col s3">
                            扣分原因
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>

<div id="work-collections1">
    <div class="row">
        <span id="l-socre1"></span>
        <div class="col s12 m12 l6" style="width: 573px">
            <ul id="qn1" class="collection">
                <li class="collection-item avatar">
                    <i class="mdi-file-folder circle light-blue darken-2"></i>
                    <span class="collection-header">教师评价</span>
                    <p>老师对你的评价结果</p>
                    <a href="#" class="secondary-content"><i class="mdi-navigation-close"></i></a>
                </li>


            </ul>
        </div>


        <span id="l-warn1"></span>
        <div class="col s12 m12 l6">
            <ul id="qn2" class="collection">
                <li class="collection-item avatar">
                    <i class="mdi-action-bug-report circle red darken-2"></i>
                    <span class="collection-header">学生评价</span>
                    <p>学生对你的评价结果</p>
                    <a href="#" class="secondary-content"><i class="mdi-navigation-close"></i></a>
                </li>


            </ul>
        </div>
    </div>
</div>


</div>
<input type="hidden" id="userId" value="${user.uid}">
<script src="/utils/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/assert/core/msg/reconnecting-websocket.min.js"></script>

<script type="text/javascript" src="/assert/core/msg/ws.js"></script>

<script type="text/javascript" src="/assert/core/msg/jxoo.js"></script>
<script>
    msgfilter = 1;
    refreshInfoMap();
    function checkCourse() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/stu/checkCourStatu",//url
            success: function (result) {

            }
        });
    }

    $(document).ready(function () {

        $("#showHisCou").click(function () {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/stu/findHistCou",//url
                success: function (result) {
                    $("#showDiv").html("<table id=\"showCourse\" class=\"striped\">\n" +
                        "                                    <thead>\n" +
                        "                                    <tr>\n" +
                        "                                        <th data-field=\"id\">课程名称</th>\n" +
                        "                                        <th data-field=\"name\">讲课老师</th>\n" +
                        "                                        <th data-field=\"price\">时间</th>\n" +
                        "                                    </tr>\n" +
                        "                                    </thead>\n" +
                        "                                </table>");
                    $.each(result.courses, function (i, course) {
                        $("#showCourse").append("<tr><td>" + course.courseName + "</td><td>" + course.teacher.userName +
                            "</td><td>" + course.date + "</td></tr>")
                    });
                },
                error: function () {
                    alert("异常！");
                }
            });
        });
        findQnresult(1);
        findQnresult(2)

    })
</script>


<script src="/utils/swx/sweetalert-dev.js"></script>
<script src="/assert/stu/stuh.js"></script>
<!--materialize js-->
<script type="text/javascript" src="/utils/js/materialize.min.js"></script>
<script src="/utils/alert/js/alert.js"></script>

</body>

</html>
