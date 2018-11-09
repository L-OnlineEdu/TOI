<%--
  Created by IntelliJ IDEA.
  User: kwinter
  Date: 2018/5/17
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="description"
          content="Materialize is a Material Design Admin Template,It's modern, responsive and based on Material Design by Google. ">
    <meta name="keywords"
          content="materialize, admin template, dashboard template, flat admin template, responsive admin template,">
    <title>Materialize - Material Design Admin Template</title>

    <link href="/assert/tea/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <!-- Favicons-->
    <link rel="icon" href="images/favicon/favicon-32x32.png" sizes="32x32">
    <!-- Favicons-->
    <link rel="apple-touch-icon-precomposed" href="images/favicon/apple-touch-icon-152x152.png">
    <!-- For iPhone -->
    <meta name="msapplication-TileColor" content="#00bcd4">
    <meta name="msapplication-TileImage" content="images/favicon/mstile-144x144.png">
    <!-- For Windows Phone -->
    <!-- CORE CSS-->
    <link href="/utils/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="/utils/css/style.css" type="text/css" rel="stylesheet" media="screen,projection">

    <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
    <link href="/assert/tea/css/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="/assert/tea/css/jquery-jvectormap.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="/assert/tea/css/chartist.min.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link rel="stylesheet" type="text/css" href="/utils/swx/sweetalert.css">
    <script src="/utils/swx/sweetalert-dev.js"></script>
    <style>
        #showAted {
            width: 300px;
            height: 455px;
            float: right;
            background-color: #ffffff;
        }

        #showtext {
            text-align: center;
        }

        #details {
            width: 60%;
            height: 100%;
            margin: auto;
            overflow-y: auto;
        }

        ::-webkit-scrollbar {
            width: 10px;
        }

        ::-webkit-scrollbar-track {
            border-radius: 10px;
            background-color: rgba(25, 147, 147, 0.1);
        }

        ::-webkit-scrollbar-thumb {
            border-radius: 10px;
            background-color: rgba(25, 147, 147, 0.2);
        }
    </style>
</head>

<body>

<input type="hidden" id="flag" value="Iamteacher"/>

<input type="hidden" id="aridValue">
<div id="modal1" class="modal">
    <div class="modal-content">
        在线学生<br><br>
        <div id="showOnline">

        </div>
        <hr>
        离线学生<br><br>
        <div id="showOffline">

        </div>
        <hr>

        <div class="progress">
            <div id="prog" class="progress-bar progress-bar-info progress-bar-striped"
                 role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                出勤率：20%
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">我知道了^_^</a>
    </div>
</div>

<div id="modal2" class="modal">
    <div id="recInfo" class="modal-content">
    </div>
    <div class="modal-footer">
        <a href="#!" onclick="emptyRecInfo()" class=" modal-action modal-close waves-effect waves-green btn-flat">我知道了^_^</a>
    </div>
</div>

<!-- 查看警告 -->
<div id="viewwarn" class="modal">
    <div class="modal-content">
        <table class="hoverable centered">
            <thead>
            <tr>
                <th>被警告学生</th>
                <th>警告原因</th>
                <th>扣分数</th>
                <th>发出人</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="warndetils">

            </tbody>
        </table>
    </div>
    <div class="modal-footer">
        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">关闭</a>
        <a href="#" onclick="addWarn()" class="waves-effect waves-light btn light-red">发出警告</a>
    </div>

</div>

<!-- 查看测验成绩-->
<div id="viewexam" class="modal">
    <div class="modal-content" id="uknowx">
        <table class="hoverable centered">
            <thead>
            <tr>
                <th>学生</th>
                <th>成绩</th>
                <th>耗时（分钟）</th>
                <th>测验老师</th>
            </tr>
            </thead>
            <tbody id="scoreDetils">

            </tbody>
        </table>
    </div>
    <div class="modal-footer">
        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">关闭</a>
    </div>

</div>


<!-- 选择学生 -->

<div id="slstu" class="modal">
    <div class="modal-content">
        <h4>选择接受警告的学生</h4>
        <div class="collection stulist">

        </div>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">关闭</a>
    </div>
</div>
<!-- //////////////////////////////////////////////////////////////////////////// -->

<!-- START HEADER -->
<header id="header" class="page-topbar">
    <!-- start header nav-->
    <div class="navbar-fixed">
        <nav class="cyan">
            <div class="nav-wrapper">
                <h1 class="logo-wrapper"><a href="/tea/home.jsp" class="brand-logo darken-1"><img
                        src="/utils/img/materialize-logo.png" alt="materialize logo"></a> <span class="logo-text">Materialize</span>
                </h1>
                <ul class="right hide-on-med-and-down">

                    <li>
                        <a href="/tea/home.jsp" class="waves-effect waves-block waves-light">
                            <i class="mdi-maps-local-library" style="margin-top:-7px;margin-bottom:-14px"></i>
                            <label style="display: block; text-align: center; font-size: 10px; line-height: 14px; cursor: pointer; color:#FFF;">我的课堂</label>
                        </a>

                    </li>

                    <li>
                        <a href="/tea/ppaper" class="waves-effect waves-block waves-light">
                            <i class="mdi-social-poll" style="margin-top:-7px;margin-bottom:-14px"></i>
                            <label style="display: block; text-align: center; font-size: 10px; line-height: 14px; cursor: pointer; color:#FFF;">我的题库</label>
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
    <div class="wrapper" style="background:#e8e8e8;">
        <div class="btnBox" style="padding-top:20px;">
            <div class="tool-bar">
                <div class="smallBtn warn-btn">
                    <div style="width: 100%; display: flex; background-color: white; flex-direction: row; box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 2px 0px; position: relative; height: 60px; cursor: pointer;">
                        <div style="display: flex; flex-direction: column; justify-content: center; align-items: center; position: relative; width: 60px; height: 60px; color: white; background-color: rgb(2, 169, 153); font-size: 28px;">
                            2
                        </div>
                        <div style="position: relative; overflow: hidden; -webkit-box-flex: 1; flex: 1 1 0%; height: 60px;">
                            <div style="color: rgb(238, 238, 238); font-size: 64px; position: absolute; bottom: -32px; right: -16px;">
                                <i class="large mdi-alert-error" aria-hidden="true"></i>
                            </div>
                            <div style="position: relative; height: 60px; display: flex; flex-direction: column; justify-content: center;">
                                <h3 style="font-size: 18px; color: rgb(101, 101, 101); margin: 0px; padding: 0px; text-align: center; font-weight: normal; align-items: center; justify-content: center;">
                                    警告</h3>
                                <div style="display: flex; flex-direction: row; align-items: center; justify-content: center;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bigBtn">
                    <div style="width: 100%; padding: 0px; border-radius: 4px;">
                        <div style="width: 100%; display: flex; background-color: white; flex-direction: row; box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 2px 0px; position: relative; height: 60px; cursor: pointer;">
                            <div style="display: flex; flex-direction: column; justify-content: center; align-items: center; position: relative; width: 60px; height: 60px; color: white; background-color: rgb(2, 169, 153); font-size: 28px;">
                                1
                            </div>
                            <div onclick="window.open('/tea/ppaper')"
                                 style="position: relative; overflow: hidden; -webkit-box-flex: 1; flex: 1 1 0%; height: 60px;">
                                <div style="color: rgb(238, 238, 238); font-size: 64px; position: absolute; bottom: -32px; right: -16px;">
                                    <i class="large  mdi-social-poll" aria-hidden="true"></i>
                                </div>
                                <div style="position: relative; height: 60px; display: flex; flex-direction: column; justify-content: center;">
                                    <h3 style="font-size: 18px; color: rgb(101, 101, 101); margin: 0px; padding: 0px; text-align: center; font-weight: normal; align-items: center; justify-content: center;">
                                        答题</h3>
                                    <div style="display: flex; flex-direction: row; align-items: center; justify-content: center;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div onclick="showPrac()" class="random-btn">
                        <div class="cover"></div>
                        <i class="large mdi-editor-border-color" aria-hidden="true"
                           style="font-size: 24px; margin-bottom: 4px;"></i>
                        练习
                    </div>
                </div>
                <div class="smallBtn" onclick="window.open('/tea/discuss')">
                    <div style="width: 100%; display: flex; background-color: white; flex-direction: row; box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 2px 0px; position: relative; height: 60px; cursor: pointer;">
                        <div style="display: flex; flex-direction: column; justify-content: center; align-items: center; position: relative; width: 60px; height: 60px; color: white; background-color: rgb(2, 169, 153); font-size: 28px;">
                            1
                        </div>
                        <div style="position: relative; overflow: hidden; -webkit-box-flex: 1; flex: 1 1 0%; height: 60px;">
                            <div style="color: rgb(238, 238, 238); font-size: 64px; position: absolute; bottom: -32px; right: -16px;">
                                <i class="large mdi-social-people" aria-hidden="true"></i>
                            </div>
                            <div style="position: relative; height: 60px; display: flex; flex-direction: column; justify-content: center;">
                                <h3 style="font-size: 18px; color: rgb(101, 101, 101); margin: 0px; padding: 0px; text-align: center; font-weight: normal; align-items: center; justify-content: center;">
                                    讨论</h3>
                                <div style="display: flex; flex-direction: row; align-items: center; justify-content: center;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bigBtn score-btn">
                    <div style="width: 100%; padding: 0px; border-radius: 4px;">
                        <div style="width: 100%; display: flex; background-color: white; flex-direction: row; box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 2px 0px; position: relative; height: 60px; cursor: pointer;">
                            <div style="display: flex; flex-direction: column; justify-content: center; align-items: center; position: relative; width: 60px; height: 60px; color: white; background-color: rgb(193, 212, 207); font-size: 28px;">
                                0
                            </div>
                            <div style="position: relative; overflow: hidden; -webkit-box-flex: 1; flex: 1 1 0%; height: 60px;">
                                <div style="color: rgb(238, 238, 238); font-size: 64px; position: absolute; bottom: -22px; right: -1px;">
                                    <i class="mdi-action-done-all"
                                       style="font-size: 64px; position: absolute; top: -66px; right: 0px;"></i>
                                </div>
                                <div style="position: relative; height: 60px; display: flex; flex-direction: column; justify-content: center;">
                                    <h3 style="font-size: 18px; color: rgb(101, 101, 101); margin: 0px; padding: 0px; text-align: center; font-weight: normal; align-items: center; justify-content: center;">
                                        成绩</h3>
                                    <div style="display: flex; flex-direction: row; align-items: center; justify-content: center;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="random-btn">
                        <div class="cover"></div>
                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAFBUlEQVRoQ+1ZWSh1XxRfPrMovCEyPHgxhhchyoMH86PIWEKSoSRDMqYMyZQyRh7NDx4UIS+mTA8eDJHhCUWZ+fqdOqd77rn33H2Pz73/r/+3SuKsvdb+7TXs397b5Obm5ov+YjH5B8DI0ft/RGBnZ4e2trYIv5+fn+nr64vMzc3J09OTgoKCKDIykszMzPSKxfv7Oy0vL3N2T05O6O3tjUxMTMja2poCAgI4u4GBgTptykbg6uqKhoaGOAdyYmtrS5mZmUwOYWd7e5tGRkbo8fFR1i4WKCsri5ydnbXqaQVwdHREHR0d9Pr6qnMVeIXExESKj4+X1Z+dnaXp6WlmmxYWFlRcXEze3t4ax2gEgJWvq6uTTN7NzY38/PzI1NSUzs7O6ODggD4+PkSGEYnw8HCNzlZXV2l4eFj0DbZ8fHzI3d2ds7W3t0fn5+ciHYCoqanRGAmNABoaGkRp4+LiwoXSw8NDZPjh4YHGx8dpY2ND+D9qo7m5mRwdHUW6t7e3VFFRweU6LyEhIZSamkp2dnYi3dPTUy51Ly8vhf8jnaqqqiQLIwGAQu3q6hIUMXkMtLS01Bp2rCpWl5fo6GhKSUkR6U9MTNDi4qLwP0QJ0dImLy8vhIVUBVFYWCipMwmAgYEBWl9fF+xWV1dLVl7d6efnJ5WVldH9/T33ycrKinp7e0Vq+fn5XAeD2NvbU2trK/369Uu2FhCJ+vp6QSc0NJRycnJEYyQACgoK6OnpiVNCztfW1so64T/Ozc3R1NSUoNvY2EhOTk7c39fX11RZWSl8S0pKori4OCa78M/XBFpsT0+PPIDs7Gyuz0NiY2MpOTmZydHm5qZo1VEzYWFh3Ni1tTUup3lBNIKDg5nsTk5O0vz8PKeLfWJwcFAeABzzkpCQQPhhEbTdlpYWQTUtLY2ioqK4v5eWlmhsbEz4Vl5errUtqvuamZkh/PCiuhAcKHUyl5ubK3QKf39/KioqYpk//RSAzs5O2t3d5eaADtff3y8fAawiJgMBPWhra5O0OU2IfgIA2nRpaSmBdkCwmSF6qiKJAFodWh4v6NV5eXk6o/ATAPr6+kR7DFozWrQsAKAtKSkR8RT07PT0dNm29ycBoC2Pjo6K9hbwrfb2dglp1LgTq29mQIzejaJEa1TfOfH94uJCFDm5IsZKurq6SqKKlEHLRdHzewqvpGkT01jE/AD16teZQ2oKcgD0tSXXDWXpNOgBuI4qf2F1npGRQREREZz6ysoKR5/1FXQdcCVt5FA2ArwzkLCFhQUuH8FPWARUoqmpiUs7yN3dHbcT81RClw3wLkw6JiZGQgrVx+p1pER+Hh8fy0YE9NjX15ccHBxEvgBif39fQr9VlbDiXl5eAgXRBZQpAixGjKmjVwSMOVFtvvUCwJpCOLXx+c87RlvEaUv9BPfjKcQXMRglaxF+t4gxHkz220X8V7fR/9JGJnfbYRQqoaQZMFMJQ5A5JQCYyZwh6LQSABjDRKcNcaBRCoDpQGOII6VSAExHSkMc6pUCwDidh3pDXKsoBcB0rWKIiy2lAGxsbKi7u1s03ChXi0oBMF0tGupyVwkIpstdGNZ0vY7awB2+qnz3el0fEMzX6zDK+sBxeHgoXDrxk9H3gYMFhN4PHDCq5ImJ5S5VX5Ko6ImJX5WfeuRDneFR5Ecf+VRDa8hnVhxm8Lz6R55ZWfLT2Dp6nYmNPVlN/v8BMHZUfgPZ2N+ump1I6wAAAABJRU5ErkJggg=="
                             class="img" alt="random">

                    </div>
                </div>
            </div>
            <div onclick="showQues()" class="randomButton">
                <i class="
                       mdi-content-send
                       "></i>
                <!-- react-text: 114 -->实时练习
                <!-- /react-text -->
            </div>
        </div>


    </div>
    <div class="result-overview-box"
         style="color: rgba(0, 0, 0, 0.87); background-color: rgb(255, 255, 255); box-sizing: border-box; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 6px, rgba(0, 0, 0, 0.12) 0px 1px 4px; border-radius: 0px;">
        <div id="showAted"
             style="padding: 16px 0px; display: flex; flex-direction: column; box-sizing: border-box; overflow: hidden; -webkit-box-flex: 1; flex: 1 1 0%;">
            <div id="showtext">
                <i class="mdi-social-group" aria-hidden="true"
                   style="font-size: 16px; margin-bottom: 4px;">班级学生状态</i>
            </div>

            <div style="display: flex; flex-direction: row; padding: 0px 20px; height: 25px; flex-shrink: 0; position: relative; justify-content: space-between;">

                <input type="hidden" id="courseId" value="${courseId}">

                <div style="display: flex; flex-direction: row; align-items: center; -webkit-box-flex: 1; flex: 1 1 0%;">
                    <div style="overflow: hidden; font-size: 12px; color: rgb(102, 102, 102); line-height: 17px; margin-right: 16px;">
                        <i style="float: left; width: 15px; height: 15px; background-color: rgb(72, 209, 174); margin-right: 3px;"></i><label>在线</label>
                    </div>
                    <div style="overflow: hidden; font-size: 12px; color: rgb(102, 102, 102); line-height: 17px; margin-right: 16px;">
                        <i style="float: left; width: 15px; height: 15px; background-color: rgb(216,216,216); margin-right: 3px;"></i><label>离线</label>
                    </div>
                    <a><i onclick="check()" class="mdi-hardware-keyboard-voice" aria-hidden="true"
                          style="font-size: 13px; margin-bottom: 4px;">点名</i></a>
                    &nbsp;&nbsp;&nbsp;<a><i onclick="record()" class="mdi-image-edit" aria-hidden="true"
                                            style="font-size: 13px; margin-bottom: 4px;">记录考勤</i></a>
                </div>

            </div>
            <%-- <div id="details">
                 <table id="showState">
                     <s:iterator value="%{onlineStu}" var="stu">
                         <tr>
                             <td>
                                 <i style="float: left; width: 15px; height: 15px; background-color: rgb(72, 209, 174); margin-right: 3px;"></i>
                             </td>
                             <td><s:property value="#stu.userName" /></td>
                             <td style="display: none">
                                 <s:property value="#stu.uid"/>
                             </td>
                         </tr>
                     </s:iterator>
                     <s:iterator value="%{offlineStu}" var="stu">
                         <tr>
                             <td>
                                 <i style="float: left; width: 15px; height: 15px; background-color: rgb(216,216,216); margin-right: 3px;"></i>
                             </td>
                             <td><s:property value="#stu.userName" /></td>
                             <td style="display: none">
                                 <s:property value="#stu.uid"/>
                             </td>
                         </tr>
                     </s:iterator>
                 </table>
             </div>--%>
        </div>
        <!--<div style="display: flex; flex-direction: row;">
            <div style="cursor: pointer; position: relative; overflow: visible; display: table; height: auto; width: 130px; font-size: 12px; margin-left: 16px; top: 0px;">
                &lt;!&ndash; react-empty: 249 &ndash;&gt;<input type="checkbox" value="on"
                                                style="position: absolute; cursor: inherit; pointer-events: all; opacity: 0; width: 100%; height: 100%; z-index: 2; left: 0px; box-sizing: border-box; padding: 0px; margin: 0px;">
                <div style="display: flex; width: 100%; height: 100%;">
                    <div style="transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; float: left; position: relative; display: block; flex-shrink: 0; width: 36px; margin-right: 8px; margin-left: 0px; padding: 4px 0px 6px 2px;">
                        <div style="transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; width: 100%; height: 14px; border-radius: 30px; background-color: rgb(189, 189, 189);"></div>
                        <div style="color: rgba(0, 0, 0, 0.87); background-color: rgb(245, 245, 245); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 6px, rgba(0, 0, 0, 0.12) 0px 1px 4px; border-radius: 50%; position: absolute; top: 1px; left: 0px; width: 20px; height: 20px; line-height: 24px;">
                            &lt;!&ndash; react-text: 255 &ndash;&gt; &lt;!&ndash; /react-text &ndash;&gt;
                            <div><span
                                    style="height: 200%; width: 200%; position: absolute; top: -10px; left: -10px; overflow: hidden; pointer-events: none; color: rgba(0, 0, 0, 0.87);"></span>
                            </div>
                            <div style="position: absolute; overflow: hidden; height: 100%; width: 100%; top: 0px; left: 0px;"></div>
                            &lt;!&ndash; react-text: 258 &ndash;&gt; &lt;!&ndash; /react-text &ndash;&gt;</div>
                    </div>
                    <label style="float: left; position: relative; display: block; width: calc(100% - 46px); line-height: 24px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;">仅显示已答题</label>
                </div>
            </div>
            <div style="cursor: pointer; position: relative; overflow: visible; display: table; height: auto; width: 130px; font-size: 12px; margin-left: 16px; top: 0px;">
                &lt;!&ndash; react-empty: 261 &ndash;&gt;<input type="checkbox" value="on"
                                                style="position: absolute; cursor: inherit; pointer-events: all; opacity: 0; width: 100%; height: 100%; z-index: 2; left: 0px; box-sizing: border-box; padding: 0px; margin: 0px;">
                <div style="display: flex; width: 100%; height: 100%;">
                    <div style="transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; float: left; position: relative; display: block; flex-shrink: 0; width: 36px; margin-right: 8px; margin-left: 0px; padding: 4px 0px 6px 2px;">
                        <div style="transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; width: 100%; height: 14px; border-radius: 30px; background-color: rgb(189, 189, 189);"></div>
                        <div style="color: rgba(0, 0, 0, 0.87); background-color: rgb(245, 245, 245); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 6px, rgba(0, 0, 0, 0.12) 0px 1px 4px; border-radius: 50%; position: absolute; top: 1px; left: 0px; width: 20px; height: 20px; line-height: 24px;">
                            &lt;!&ndash; react-text: 267 &ndash;&gt; &lt;!&ndash; /react-text &ndash;&gt;
                            <div><span
                                    style="height: 200%; width: 200%; position: absolute; top: -10px; left: -10px; overflow: hidden; pointer-events: none; color: rgba(0, 0, 0, 0.87);"></span>
                            </div>
                            <div style="position: absolute; overflow: hidden; height: 100%; width: 100%; top: 0px; left: 0px;"></div>
                            &lt;!&ndash; react-text: 270 &ndash;&gt; &lt;!&ndash; /react-text &ndash;&gt;</div>
                    </div>
                    <label style="float: left; position: relative; display: block; width: calc(100% - 46px); line-height: 24px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;">按成绩排序</label>
                </div>
            </div>
            <div class="more___2_hza">
                <div style="transform: scale(0.85);">
                    <button tabindex="0" type="button"
                            style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); height: 30px; line-height: 24px; min-width: 88px; color: rgba(0, 0, 0, 0.87); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; position: relative; overflow: hidden; background-color: rgba(0, 0, 0, 0); text-align: center;">
                        <div><i class="material-icons" color="rgba(0, 0, 0, 0.87)"
                                style="vertical-align: middle; margin-left: 12px; margin-right: 0px; color: rgba(0, 0, 0, 0.87); font-weight: 500;">face</i><span
                                style="position: relative; padding-left: 8px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 14px; color: rgba(0, 0, 0, 0.87);">学生管理</span>
                        </div>
                    </button>
                </div>
                <div style="transform: scale(0.85);">
                    <button tabindex="0" type="button"
                            style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); height: 30px; line-height: 24px; min-width: 88px; color: rgba(0, 0, 0, 0.87); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; position: relative; overflow: hidden; background-color: rgba(0, 0, 0, 0); text-align: center;">
                        <div><i class="material-icons" color="rgba(0, 0, 0, 0.87)"
                                style="vertical-align: middle; margin-left: 12px; margin-right: 0px; color: rgba(0, 0, 0, 0.87); font-weight: 500;">people</i><span
                                style="position: relative; padding-left: 8px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 14px; color: rgba(0, 0, 0, 0.87);">分组管理</span>
                        </div>
                    </button>
                </div>
                <div style="transform: scale(0.85);">
                    <button tabindex="0" type="button"
                            style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); height: 30px; line-height: 24px; min-width: 88px; color: rgba(0, 0, 0, 0.87); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; position: relative; overflow: hidden; background-color: rgba(0, 0, 0, 0); text-align: center;">
                        <div><i class="material-icons" color="rgba(0, 0, 0, 0.87)"
                                style="vertical-align: middle; margin-left: 12px; margin-right: 0px; color: rgba(0, 0, 0, 0.87); font-weight: 500;">local_activity</i><span
                                style="position: relative; padding-left: 8px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 14px; color: rgba(0, 0, 0, 0.87);">评分管理</span>
                        </div>
                    </button>
                </div>
                <div style="transform: scale(0.85);">
                    <button tabindex="0" type="button"
                            style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); height: 30px; line-height: 24px; min-width: 88px; color: rgba(0, 0, 0, 0.87); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; position: relative; overflow: hidden; background-color: rgba(0, 0, 0, 0); text-align: center;">
                        <div><i class="material-icons" color="rgba(0, 0, 0, 0.87)"
                                style="vertical-align: middle; margin-left: 12px; margin-right: 0px; color: rgba(0, 0, 0, 0.87); font-weight: 500;">open_in_new</i><span
                                style="position: relative; padding-left: 8px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 14px; color: rgba(0, 0, 0, 0.87);">成绩导出</span>
                        </div>
                    </button>
                    <div style="display: none;">&lt;!&ndash; react-empty: 294 &ndash;&gt;&lt;!&ndash; react-empty: 295 &ndash;&gt;</div>
                </div>
            </div>
        </div>
    </div>
    <div style="-webkit-box-flex: 1; flex: 1 1 0%; display: flex; flex-direction: column; margin-top: 12px; position: relative; overflow: hidden;">
        <div style="height: 50px; display: flex; flex-direction: row; position: absolute; top: 0px; left: 0px; right: 0px; overflow: hidden; z-index: 20; background-color: white; padding-right: 0px;">
            <div style="display: flex; flex-direction: row; width: 280px; margin-right: 5px; padding: 0px 8px 0px 12px; box-sizing: border-box;">
                <div style="width: 33.333%; font-size: 12px; color: rgb(170, 170, 170); text-align: center; border-bottom: 1px solid rgb(200, 200, 200);">
                    <label>学生</label>
                    <div style="color: rgb(102, 102, 102); font-size: 24px; line-height: 36px;">2</div>
                </div>
                <div style="width: 33.333%; font-size: 12px; color: rgb(170, 170, 170); text-align: center; border-bottom: 1px solid rgb(200, 200, 200);">
                    <label>组卷</label>
                    <div style="color: rgb(102, 102, 102); font-size: 24px; line-height: 36px;">0</div>
                </div>
                <div style="width: 33.333%; font-size: 12px; color: rgb(170, 170, 170); text-align: center; border-bottom: 1px solid rgb(200, 200, 200);">
                    <label>题目</label>
                    <div style="color: rgb(102, 102, 102); font-size: 24px; line-height: 36px;">2</div>
                </div>
                <div style="width: 33.333%; font-size: 12px; color: rgb(170, 170, 170); text-align: center; border-bottom: 1px solid rgb(200, 200, 200);">
                    <label>平均分</label>
                    <div style="color: rgb(102, 102, 102); font-size: 24px; line-height: 36px;">50.0</div>
                </div>
            </div>
            <div class="hidden-scrollbar___23dzL"
                 style="-webkit-box-flex: 1; flex: 1 1 0%; display: flex; flex-direction: row; overflow-x: auto; overflow-y: hidden;">
                <div style="width: 54px; margin-right: 5px;">
                    <div data-tip="未指定章节" currentitem="false"
                         style="border-radius: 4px 4px 0px 0px; height: 24px; line-height: 24px; background-color: rgb(102, 102, 102); text-align: center; padding: 0px 6px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; color: white; font-size: 12px;">
                        <span style="display: inline-block; width: 12px; height: 12px; border-radius: 3px; background-color: white; color: rgb(102, 102, 102); line-height: 1; margin-right: 3px;">0</span><span>未指定章节</span>
                    </div>
                    <div style="background-color: rgba(102, 102, 102, 0.07); border-top: 1px solid rgba(102, 102, 102, 0.2); border-right: 1px solid rgba(102, 102, 102, 0.2); border-bottom: none; border-left: 1px solid rgba(102, 102, 102, 0.2); border-image: initial; display: flex; flex-direction: row; height: 26px; line-height: 29px; box-sizing: border-box;">
                        <div style="font-size: 12px; width: 26px; text-align: center; color: rgb(76, 190, 161);">
                            1
                        </div>
                        <div style="font-size: 12px; width: 26px; text-align: center; color: rgb(76, 190, 161);">
                            2
                        </div>
                    </div>
                    <div class="__react_component_tooltip place-top type-dark " data-id="tooltip"></div>
                </div>
            </div>
        </div>
        <div style="-webkit-box-flex: 1; flex: 1 1 0%; overflow-x: hidden; overflow-y: auto;">
            <div style="display: flex; flex-direction: row;">
                <div style="width: 280px; margin-right: 5px; padding-right: 15px; padding-top: 52px; box-sizing: border-box;">
                    <div style="display: flex; justify-content: flex-start; flex-direction: row; margin: 0px 0px 5px;">
                        <div style="width: 5px; background-color: red;"></div>
                        <ul style="-webkit-box-flex: 1; flex: 1 1 0%; padding: 0px 0px 0px 5px; margin: 0px; box-sizing: border-box; overflow: hidden;">
                            <li style="display: flex; flex-direction: row; justify-content: space-between; height: 26px; line-height: 26px;">
                                <span style="font-size: 12px; width: 24px; color: rgb(74, 74, 74);">1</span>
                                <div title="你猜"
                                     style="width: 64px; text-align: left; color: rgb(74, 74, 74); font-size: 16px; margin-right: 6px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                    你猜
                                </div>
                                <div title="123453"
                                     style="color: rgb(74, 74, 74); font-size: 12px; overflow: hidden; text-align: left; flex: 0 0 auto; font-family: Consolas, Monaco, monospace; width: 15ch;">
                                    123453
                                </div>
                                <div style="color: rgb(74, 74, 74); font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%; text-align: right;">
                                    0.1
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div style="display: flex; justify-content: flex-start; flex-direction: row; margin: 0px 0px 5px;">
                        <div style="width: 5px; background-color: chartreuse;"></div>
                        <ul style="-webkit-box-flex: 1; flex: 1 1 0%; padding: 0px 0px 0px 5px; margin: 0px; box-sizing: border-box; overflow: hidden;">
                            <li style="display: flex; flex-direction: row; justify-content: space-between; height: 26px; line-height: 26px;">
                                <span style="font-size: 12px; width: 24px; color: rgb(74, 74, 74);">2</span>
                                <div title="吃饭"
                                     style="width: 64px; text-align: left; color: rgb(74, 74, 74); font-size: 16px; margin-right: 6px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                    吃饭
                                </div>
                                <div title="23333"
                                     style="color: rgb(74, 74, 74); font-size: 12px; overflow: hidden; text-align: left; flex: 0 0 auto; font-family: Consolas, Monaco, monospace; width: 15ch;">
                                    23333
                                </div>
                                <div style="color: rgb(74, 74, 74); font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%; text-align: right;">
                                    100
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div style="display: flex; justify-content: flex-start; flex-direction: row; margin: 0px 0px 5px;">
                        <div style="width: 5px; background-color: rgba(200, 200, 200, 0.5);"></div>
                        <ul style="-webkit-box-flex: 1; flex: 1 1 0%; padding: 0px 0px 0px 5px; margin: 0px; box-sizing: border-box; overflow: hidden;"></ul>
                    </div>
                </div>
                <div style="-webkit-box-flex: 1; flex: 1 1 0%; display: flex; flex-direction: row; overflow-x: auto; overflow-y: hidden; position: relative; padding-top: 50px;">
                    <div style="width: 54px; margin-right: 5px; background-color: rgba(102, 102, 102, 0.07); border-top: none; border-right: 1px solid rgba(102, 102, 102, 0.2); border-bottom: 1px solid rgba(102, 102, 102, 0.2); border-left: 1px solid rgba(102, 102, 102, 0.2); border-image: initial; box-sizing: border-box; display: flex; flex-direction: row; padding-top: 2px;">
                        <div style="width: 26px;">
                            <div style="margin: 0px 0px 5px;">
                                <div style="width: 26px; height: 26px; border-radius: 4px; border: 1px solid white; font-size: 12px; text-align: center; color: transparent; line-height: 24px; box-sizing: border-box; background-color: rgb(255, 176, 186);">
                                    0.1
                                </div>
                            </div>
                            <div style="margin: 0px 0px 5px;">
                                <div style="width: 26px; height: 26px; border-radius: 4px; border: 1px solid white; font-size: 12px; text-align: center; color: transparent; line-height: 24px; box-sizing: border-box; background-color: rgb(255, 176, 186);">
                                    100
                                </div>
                            </div>
                            <div style="margin: 0px 0px 5px;"></div>
                        </div>
                        <div style="width: 26px;">
                            <div style="margin: 0px 0px 5px;">
                                <div style="width: 26px; height: 26px; border-radius: 4px; border: 1px solid white; font-size: 12px; text-align: center; color: transparent; line-height: 24px; box-sizing: border-box; background-color: rgb(237, 237, 237);">
                                    0
                                </div>
                            </div>
                            <div style="margin: 0px 0px 5px;">
                                <div style="width: 26px; height: 26px; border-radius: 4px; border: 1px solid white; font-size: 12px; text-align: center; color: transparent; line-height: 24px; box-sizing: border-box; background-color: rgb(237, 237, 237);">
                                    0
                                </div>
                            </div>
                            <div style="margin: 0px 0px 5px;"></div>
                        </div>
                    </div>
                </div>
            </div>-->

    </div>
    <div style="background:url(/assert/tea/img/no-students.png) no-repeat 50% 50%; ">
        <!--   评价卡片块        -->
        <div class="col s12 m6 l3" style="width: 230px">
            <div class="card">
                <div class="card-content  white-text" style="background:#5BE7C4">
                    <p class="card-stats-title"><i class="mdi-action-description"></i>评价学生</p>
                    <h5 class="card-stats-number" id="mypoints">评价学生的表现</h5>
                    <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-up"></i> <span
                            class="green-text text-lighten-5">老师-学生</span>
                    </p>
                </div>
                <div class="card-action  darken-2" style="background:#5BE7C4">
                    <div id="clients-bar">
                        <a id="#m13" href="javascript:openQn(1)" style="color:ghostwhite">选择学生</a>
                        <a href="javascript:openQn(3)" style="color:ghostwhite">查看结果</a>
                    </div>

                </div>
            </div>

        </div>
        <div class="col s12 m6 l3" style="width: 230px">
            <div class="card">
                <div class="card-content  white-text" style="background:#7A57D1">
                    <p class="card-stats-title"><i class="mdi-social-group"></i>学生评教</p>
                    <h5 class="card-stats-number" id="onliNum">学生评教、互评</h5>
                    <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-up"></i> <span
                            class="purple-text text-lighten-5">学生-老师 学生-学生</span>
                    </p>
                </div>
                <div class="card-action  darken-2" style="background:#7A57D1">
                    <a href="javascript:openQn(2)" style="color:ghostwhite">评教选择</a>
                    <a href="javascript:openQn(4)" style="color:ghostwhite">查看结果</a>
                </div>
            </div>
        </div>


    </div>


    <!-- 选择评价-->
    <div id="modal12" class="modal modal-fixed-footer" style="height:250px">
        <div class="modal-content">
            <h4>评教选择</h4>
            <iframe id="ifm" src="../qn/index.jsp" style="border: #FFFFFF; height: 100px"></iframe>
        </div>

        <div class="modal-footer">
            <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat " id="a1">关闭</a>
            <a href="#!" class=" waves-effect waves-green btn-flat " onclick="sendM()">确定</a>
        </div>
    </div>
    <!-- 选择评价学生-->
    <div id="modal13" class="modal">
        <div class="modal-content">
            <h4>选择需要评价的学生</h4>
            <div id="md13"></div>
        </div>
        <div class="modal-footer">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">关闭</a>
        </div>
    </div>
    <!-- 查看自己对学生评价-->
    <div id="qn11" class="modal">
        <div class="modal-content" id="qn1">
            <table class="hoverable centered">
                <thead>
                <tr>
                    <th>被评价学生ID</th>
                    <th>学生姓名</th>
                    <th>评价结果</th>
                </tr>
                </thead>
                <tbody id="qn12">

                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">关闭</a>
        </div>

        <input type="hidden" id="msgflag" value="true">
    </div>
    <!-- 查看学生对教师评价-->
    <div id="qnn2" class="modal">
        <div class="modal-content" id="qn2">
            <table class="hoverable centered">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>方式</th>
                    <th>结果</th>
                </tr>
                </thead>
                <tbody id="que2">

                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">关闭</a>
        </div>
    </div>

    <div class="fixed-action-btn toolbar">
        <a onclick="selectRec()" class="btn-floating btn-large red">
            <i class="large mdi-social-people-outline">mode_edit</i>
        </a>
    </div>
</div>
</div>


<!-- jQuery Library -->
<script src="/utils/js/jquery-1.11.2.min.js"></script>
<script src="/utils/swx/sweetalert-dev.js"></script>
<!--teacher'sjs-->
<script src="/assert/tea/js/teacherh.js"></script>
<script src="/assert/tea/js/jxv4.js"></script>
<script src="../qn/js/Paper.js"></script>
<!--materialize js-->
<script type="text/javascript" src="/utils/js/materialize.min.js"></script>


<!--plugins.js - Some Specific JS codes for Plugin Settings-->
<script type="text/javascript" src="/utils/js/plugins.js"></script>
<script>
    function emptyRecInfo() {
        $("#recInfo").text("")
    }

    function selectRec() {
        arid = $("#aridValue").val();
        if (arid == "") {
            swal("请先记录考勤后再查询")
        } else {
            if ($("#recInfo").text().trim() == "") {
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/tea/selectRec",//url
                    data: {"arid": arid},
                    success: function (result) {
                        if (result.attendanceInfos != null && result.attendanceInfos != "") {
                            $.each(result.attendanceInfos, function (i, info) {
                                $("#recInfo").append("<table id='rectab'>\n" +
                                    "            <tr>\n" +
                                    "                <th>学生姓名</th>\n" +
                                    "                <th>出勤情况</th>\n" +
                                    "            </tr>\n" +
                                    "            <tr>\n" +
                                    "                <td>" + info.student.userName + "</td>\n" +
                                    "                <td>已出勤</td>\n" +
                                    "            </tr>\n" +
                                    "        </table>")
                            });
                            $.each(result.offlineStus, function (i, stu) {
                                $("#rectab").append(
                                    "            <tr>\n" +
                                    "                <td>" + stu.userName + "</td>\n" +
                                    "                <td>未出勤</td>\n" +
                                    "            </tr>")
                            });
                            $("#modal2").openModal()
                        }
                        /*setTimeout(function() {
                            $("#modal2").openModal()
                        })*/
                    }
                });
            }
        }
    }

    function showQues() {
        /*window.open('showquestion.jsp')*/
        window.open('showquestion.jsp', 'add',
            'height=600, width=800, top=60, left=200, toolbar=no,menubar=no,' +
            'scrollbars=yes,resizable=no,location=no, status=no')
    }

    function showPrac() {
        window.open('pushpractice.jsp', 'add',
            'height=600, width=800, top=60, left=200, toolbar=no,menubar=no,' +
            'scrollbars=yes,resizable=no,location=no, status=no')
    }

    function check() {
        /*window.open ('two.html','add',
            'height=600, width=800, top=60, left=200, toolbar=no,menubar=no,' +
            'scrollbars=yes,resizable=no,location=no, status=no') ;*/
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/stu/allOnlineStu",//url
            data: {},
            success: function (result) {
                a = 0;
                b = 0;
                $("#showOnline").html("");
                $("#showOffline").html("");
                $.each(result.onlineStu, function (i, stu) {
                    a++;
                    $("#showOnline").append("<div class=\"chip\">\n" +
                        "                        <img src=\"img/stu1.jpg\" alt=\"Contact Person\">\n" +
                        stu.userName +
                        "                    </div>")
                });
                $.each(result.offlineStu, function (i, stu) {
                    b++;
                    $("#showOffline").append("<div class=\"chip\">\n" +
                        "                        <img src=\"img/stu.jpg\" alt=\"Contact Person\">\n" +
                        stu.userName +
                        "                    </div>")
                });
                c = (a / (a + b)) * 100;
                cStr = c.toString();
                crate = cStr.substring(0, 5);
                $("#prog").css("width", crate + "%");
                $("#prog").html("出勤率：" + crate + "%");
                $("#modal1").openModal()
            }
        });
    }

    <!--打开问卷模态需要的各种操作 -->
    function openQn(a) {
        switch (a) {
            case 1:
                $("#modal13").openModal();
                $.ajax({
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/stu/allOnlineStu",//url
                    data: {},
                    success: function (result) {
                        $("#md13").html("");
                        $.each(result.onlineStu, function (i, stu) {

                            $("#md13").append("<div  class=\"chip\"    >\n" +
                                "                        <img src=\"img/stu1.jpg\" alt=\"Contact Person\">\n" +
                                stu.userName +
                                "                    </div>")
                        });
                        $.each(result.offlineStu, function (i, stu) {

                            $("#md13").append("<div class=\"chip\" onclick='t2sqn(" + stu.uid + ")'>\n" +
                                "                        <img src=\"img/stu.jpg\" alt=\"Contact Person\">\n" +
                                stu.userName +
                                "                    </div>")
                        })

                    },

                });

                return;
            case 2:
                $("#modal12").openModal();
                return;

            case 3:
                $("#qn11").openModal();
                $.ajax({
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/getTesRs",//url
                    data: {"type": 2},
                    success: function (data) {
                        $("#qn12").html("");
                        $.each(data.qn, function (key, val) {
                            $("#qn12").append("   <tr>\n" +
                                "                <td>" + val[1] + "</td>\n" +
                                "                <td>" + val[2] + "</td>\n" +
                                "                <td>" + val[0] + "</td>\n" +
                                "            </tr>")
                        })
                    },
                });
                return;
            case 4:
                $("#qnn2").openModal();
                $.ajax({
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/getTesRs",//url
                    data: {"type": 1},
                    success: function (data) {
                        $("#que2").html("");
                        $.each(data.qn, function (key, val) {

                            $("#que2").append("   <tr>\n" +
                                "                <td>" + key + 1 + "</td>\n" +

                                "                <td>匿名</td>\n" +
                                "                <td>" + val + "</td>\n" +
                                "            </tr>")
                        })
                    },
                });
                return;
            default:
                return
        }
    }

    function t2sqn(a) {
        window.location.href = "/qn/question.html?flag=ssqn&&rid=" + a + "&&type=2"
    }
</script>
<script>
    function record() {
        courseid = $("#courseId").val();
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/tea/recordAted",//url
            data: {"courseId": courseid},
            success: function (result) {
                $("#aridValue").val(result.arid);
                swal({
                    title: "记录成功",
                    text: "",
                    timer: 800,
                    type: "success",
                    showConfirmButton: false
                });
            }
        });

    }

</script>

<style>
    .container {
        display: flex;
        height: 100%;
        flex-direction: column;
        width: 100%;
        min-height: 600px;
        background-color: #fafafa;
    }

    .drawer > div {
        overflow: hidden !important;
    }

    .layout {
        display: flex;
        flex-direction: row;
        padding: 20px;
        width: 100%;
        box-sizing: border-box;
        flex: 1;
    }

    .left-side {
        flex: 1 0;
        overflow: hidden;
        display: flex;
        flex-direction: column;
    }

    .left-side .result-overview-box {
        flex: 1;
        overflow: hidden;
        display: flex;
        flex-direction: column;
    }

    .right-side {
        width: 300px;
        margin-left: 20px;
    }

    .right-side .class-info-show {
        width: 300px;
        height: 225px;
        background-color: #fff;
    }

    .banner {
        width: 100%;
        height: 80px;
    }

    .tool-bar {
        width: calc(100% - 98px);
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
        height: 60px;
        flex-shrink: 0;
    }

    .tool-bar .bigBtn {
        width: calc((100% - 216px) / 4 + 60px);
        height: 60px;
        display: flex;
        margin-right: 24px;
        background-color: #FFF;
        box-shadow: 0 5px 10px 0 rgba(0, 0, 0, 0.12);
        border-radius: 4px;
        overflow: hidden;
    }

    .tool-bar .smallBtn {
        width: calc((100% - 216px) / 4);
        height: 60px;
        display: flex;
        margin-right: 24px;
        background-color: #FFF;
        box-shadow: 0 5px 10px 0 rgba(0, 0, 0, 0.12);
        border-radius: 4px;
        overflow: hidden;
    }

    .random-btn {
        width: 80px;
        height: 60px;
        background-color: #eee;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        position: relative;
        font-size: 12px;
        color: #666;
        border-left: none;
        box-shadow: 0 5px 10px 0 rgba(0, 0, 0, 0.12);
    }

    .random-btn .img {
        width: 24px;
        height: 24px;
        margin-bottom: 4px;
    }

    .random-btn .cover {
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        position: absolute;
        z-index: 10;
        cursor: pointer;
    }

    .randomButton {
        flex: none;
        width: 96px;
        height: 60px;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        background-color: #FFF;
        border-radius: 4px;
        font-size: 12px;
        cursor: pointer;
        border: 1px solid #C8C8C8;
        box-shadow: 0 5px 10px 0 rgba(0, 0, 0, 0.12);
    }

    .btnBox {
        width: 100%;
        display: flex;
    }

</style>
</body>

</html>

