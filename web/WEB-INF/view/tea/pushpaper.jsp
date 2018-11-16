<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

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


    <!-- CORE CSS-->
    <link href="/utils/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="/utils/css/style.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link rel="stylesheet" href="/utils/slzy/jquery-ui.css">
    <%-- <link rel="stylesheet" href="/resources/demos/style.css">--%>
    <style type="text/css">
        #trash {
            min-height: 18em;
            padding: 1%;
        }

        #trash h4 {
            line-height: 16px;
            margin: 0 0 0.4em;
        }

        #trash h4 .ui-icon {
            float: left;
        }

        #trash .gallery h5 {
            display: none;
        }
    </style>


</head>

<body>
<div id="importQ" class="modal">
    <div class="modal-content">
        <form action="/tea/uploadFile.do" method="post" enctype="multipart/form-data">
            <label>文件上传</label>
            <input type="file" name="file">
            <input type="submit" value="提交">
        </form>
    </div>
    <div class="modal-footer">
        <a href="#" class=" modal-action modal-close waves-effect waves-red btn-flat">取消</a>

    </div>
</div>

<div id="alertChoose" class="modal">
    <div class="modal-content">

    </div>
    <div class="modal-footer">
        <a href="#" class=" modal-action modal-close waves-effect waves-red btn-flat">取消</a>

    </div>
</div>

<div id="alertEditor" class="modal">
    <div class="modal-content">
        <div class="row">
            <form class="col s12">
                <div class="row">
                    <div class="input-field col s6">
                        <input disabled value="id" id="editorQuestionid" type="text" class="validate">
                        <label for="editorQuestionid">试题编号</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="editorRightAnswer" type="text" class="validate">
                        <label class="active" for="editorRightAnswer">正确答案</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="editorTitle" type="text" class="validate">
                        <label class="active" for="editorTitle">题目</label>
                    </div>
                </div>
                <div class="row">

                    <div class="input-field col s12">
                        <textarea id="editorAnswer" class="materialize-textarea"></textarea>
                        <label class="active" for="editorAnswer">选项</label>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="modal-footer">
        <Button class=" modal-action modal-close waves-effect waves-green btn-flat" id="editTrue">确定</Button>
        <a href="#!" class=" modal-action modal-close waves-effect waves-red btn-flat">取消</a>

    </div>
</div>
<!-- <div id="addPapers" class="modal">
       <div class="modal-content">
            <div class="row">
               <form class="col s12">
                 <div class="row">
                    <div class="input-field col s6">
                     <input id="addPaperTitle" type="text" class="validate">
                     <label for="addPaperTitle">试卷题目</label>
                   </div>
                   <div class="input-field col s6">
                     <input id="addPaperTime" type="text" class="validate">
                     <label class="active" for="addPaperTime">考试时间</label>
                   </div>
                 </div>
                 <div class="row">
                   <div class="input-field col s12">
                    <textarea id="addContext" class="materialize-textarea"></textarea>
                      <label class="active" for="addContext">试卷描述</label>
                   </div>
                 </div>
               </form>
             </div>
       </div>
       <div class="modal-footer">
         <Button class=" modal-action modal-close waves-effect waves-green btn-flat" id="addPaperTrue">确定</Button>
         <a href="#" class=" modal-action modal-close waves-effect waves-red btn-flat">取消</a>

       </div>
     </div>
-->
<!-- /////////////////////////////////////////////////////////////////////////t

<!-- START HEADER -->
<header id="header" class="page-topbar">
    <!-- start header nav-->
    <div class="navbar-fixed">
        <nav class="cyan">
            <div class="nav-wrapper">
                <h1 class="logo-wrapper"><a href="/tea/home" class="brand-logo darken-1"><img
                        src="/utils/img/materialize-logo.png" alt="materialize logo"></a> <span class="logo-text">Materialize</span>
                </h1>
                <ul class="right hide-on-med-and-down">

                    <li>
                        <a href="/tea/home" class="waves-effect waves-block waves-light">
                            <i class="mdi-maps-local-library" style="margin-top:-7px;margin-bottom:-14px"></i>
                            <label style="display: block; text-align: center; font-size: 10px; line-height: 14px; cursor: pointer; color:#FFF;">我的课堂</label>
                        </a>

                    </li>

                    <li>
                        <a href="/tea/pushpaper.jsp" class="waves-effect waves-block waves-light">
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

<div style="display: flex; justify-content: space-between; align-items: center; position: relative; width: 100%; height: 60px; background: rgba(255, 255, 255, 0.5); box-shadow: rgba(0, 0, 0, 0.24) 0px 2px 2px 0px, rgba(0, 0, 0, 0.12) 0px 0px 2px 0px;">
    <div style="margin-left: 10px; display: flex; justify-content: center; align-items: center; flex-direction: row; height: 60px; line-height: 60px;">
        <button tabindex="0" type="button"
                style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px 10px 0px 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); height: 36px; line-height: 36px; min-width: 88px; color: rgba(0, 0, 0, 0.87); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; position: relative; overflow: hidden; background-color: rgba(0, 0, 0, 0); text-align: center;">
            <div>
                <span class="fa fa-home" color="rgba(0, 0, 0, 0.87)"
                      style="color: rgba(0, 0, 0, 0.87); position: relative; font-size: 24px; display: inline-block; user-select: none; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; vertical-align: middle; margin-left: 12px; margin-right: 0px;"></span>
                <span style="position: relative; padding-left: 8px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 14px;">返回课堂</span>
            </div>
        </button>
        <button tabindex="0" type="button"
                style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px 10px 0px 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); height: 36px; line-height: 36px; min-width: 88px; color: rgba(0, 0, 0, 0.87); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; position: relative; overflow: hidden; background-color: rgba(0, 0, 0, 0); text-align: center;">
            <div>
                <span class="fa fa-child" color="rgba(0, 0, 0, 0.87)"
                      style="color: rgba(0, 0, 0, 0.87); position: relative; font-size: 24px; display: inline-block; user-select: none; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; vertical-align: middle; margin-left: 12px; margin-right: 0px;"></span>
                <span href="#" onclick="sendx()"
                      style="position: relative; padding-left: 8px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 14px;">进入答题</span>
            </div>
        </button>
        <div style="display: flex; align-items: center;">
            <button tabindex="0" type="button"
                    style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); height: 100%; line-height: 36px; min-width: 88px; color: rgba(0, 0, 0, 0.87); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; position: relative; overflow: hidden; background-color: rgba(0, 0, 0, 0); text-align: center;">
                <div>
                        <span style="position: relative; padding-left: 16px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 14px; display: flex; justify-content: center; align-items: center;">
                            <div>
                                <i class="fa fa-files-o" style="font-size: 20px; margin-right: 5px;"></i>
                                <span id="importQuestion">导入题库</span>
                                	 
                        </span>
                </div>
            </button>
            <!-- react-empty: 2410 -->
            <div style="position: fixed; left: 50%; display: flex; bottom: 0px; z-index: 2900; visibility: hidden; transform: translate(-50%, 48px); transition: transform 400ms cubic-bezier(0.23, 1, 0.32, 1) 0ms, visibility 400ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;">
                <div width="1"
                     style="font-family: Roboto, sans-serif; background-color: rgba(0, 0, 0, 0.87); padding: 0px 24px; height: 48px; line-height: 48px; border-radius: 0px; max-width: inherit; min-width: inherit; width: calc(100vw - 48px); flex-grow: 1;">
                    <div style="font-size: 14px; color: rgb(255, 255, 255); opacity: 0; transition: opacity 400ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;">
                        <span>导入题库失败</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
        <div style="display: flex; align-items: center; position: relative; z-index: 0;">
            <div style="font-size: 12px; width: 80px; height: 60px; position: relative; cursor: pointer; text-align: center; color: rgb(255, 255, 255); z-index: 2; background: rgb(233, 30, 99);">
                <div value="single"
                     style="position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; z-index: 9;"></div>
                <div style="padding-top: 8px; width: 100%; height: 32px; text-align: center;">
                    <span id="dtt" style="font-size:18px;">1</span>
                </div>
                <div style="width: 100%; height: 20px;">
                    <i class="fa fa-list-ul" style="z-index: 2; margin-left: 8px; font-size: 12px;"></i>
                    <span style="margin: 0px 8px 0px 3px; z-index: 2;">单题</span>
                </div>
            </div>
            <div style="font-size: 12px; width: 80px; height: 60px; position: relative; cursor: pointer; text-align: center; color: rgb(51, 51, 51); z-index: 2;">
                <div value="paperGroup"
                     style="position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; z-index: 9;"></div>
                <div style="padding-top: 8px; width: 100%; height: 32px; text-align: center;">
                    <span id="zjj" style="font-size: 18px;">0</span>
                </div>
                <div style="width: 100%; height: 20px;">
                    <i class="fa fa-file-text-o" style="z-index: 2; margin-left: 8px; font-size: 12px;"></i>
                    <span style="margin: 0px 8px 0px 3px; z-index: 2;">组卷</span>
                </div>
            </div>

        </div>
    </div>
</div>


<div class="main-container">
    <div class="wrapper"
         style="color: rgba(0, 0, 0, 0.87); background-color: rgb(242, 242, 242); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 6px, rgba(0, 0, 0, 0.12) 0px 1px 4px; border-radius: 2px;">
        <div class="header" style="margin: 15px">

            <center>
                <div class="panel-title">章节目录</div>
            </center>

        </div>
        <span>
                <div class="addPaper"
                     style="display: flex; flex-direction: row; justify-content: space-between; align-items: center; height: 36px; border: 1px dashed rgb(151, 151, 151); cursor: pointer; padding: 0px 0px 0px 5px; background-color: white; margin: 5px 10px 10px; box-sizing: border-box;">
                    <div style="font-size: 12px; color: rgb(102, 102, 102); margin: 0px 5px;">用章节管理题目更方便，点击添加课堂章节</div>
                    <i class="mdi-action-note-add" style="color: rgb(102, 102, 102); margin-right: 2px;"></i>
                </div>
            </span>
        <div id="thaom">

        </div>
        <hr style="margin: -1px 0px 20px 25px; height: 1px; border: none; background-color: rgb(224, 224, 224);">

        <!-- react-empty: 2482 -->
        <div id="trash" style="display:none" class="ui-widget-content ui-state-default">
            <div class="row">
                <form class="col s12">
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="addPaperTitle" type="text" class="validate">
                            <label for="addPaperTitle">试卷题目</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="addPaperTime" type="text" class="validate">
                            <label class="active" for="addPaperTime">考试时间</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <textarea id="addContext" class="materialize-textarea"></textarea>
                            <label class="active" for="addContext">试卷描述</label>
                        </div>
                    </div>
                </form>
            </div>

            <div style="margin-left: 16px;margin-bottom: 16px">题目ID</div>
            <div id="addPaperQID"></div>
            <Button class=" modal-action modal-close waves-effect waves-green btn-flat" id="addPaperTrue">确定</Button>
            <a href="/tea/pushpaper.jsp" class=" modal-action modal-close waves-effect waves-red btn-flat">取消</a>


        </div>
    </div>

    <div class="questions-wrapper"
         style="color: rgba(0, 0, 0, 0.87); background-color: rgb(255, 255, 255); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 6px, rgba(0, 0, 0, 0.12) 0px 1px 4px; border-radius: 2px;">
        <div>
            <div style="padding-bottom: 0px;"></div>
            <div class="" style="transform: translateZ(0px);">
                <div class="questions-wrapper-header">
                    <div>
                        <div style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); height: 36px; line-height: 36px; min-width: 88px; color: rgb(2, 169, 153); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; position: relative; overflow: hidden; background-color: rgba(0, 0, 0, 0); text-align: center;">
                            <input class="editorPaperContext" type="text" class="validate"
                                   style="display:none;position: relative; padding-left: 16px;margin-bottom:0px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 14px;"/>
                            <span class="PaperContext"
                                  style="position: relative; padding-left: 16px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 14px; color:red;">试卷详情</span>
                        </div>

                        <div style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); height: 36px; line-height: 36px; min-width: 88px; color: rgb(2, 169, 153); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; position: relative; overflow: hidden; background-color: rgba(0, 0, 0, 0); text-align: center;">
                            <input class="editorPaperTime" type="text" class="validate"
                                   style="display:none;position: relative; padding-left: 16px;margin-bottom:0px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 14px;"/>
                            <span class="PaperTime"
                                  style="position: relative; padding-left: 16px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 14px;color:red;">考试时间</span>
                        </div>
                    </div>
                    <div>
                        <div style="color: rgba(0, 0, 0, 0.87); background-color: rgb(255, 255, 255); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 6px, rgba(0, 0, 0, 0.12) 0px 1px 4px; border-radius: 2px; display: inline-block; min-width: 88px;">
                            <button tabindex="0" type="button" class="delPaper waves-effect waves-light btn red"
                                    style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); position: relative; height: 36px; line-height: 36px; width: 100%; border-radius: 2px; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; background-color: rgb(2, 169, 153); text-align: center;">
                                <div>
                                    <div style="height: 36px; border-radius: 2px; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; top: 0px;">
                                        <span style="position: relative; opacity: 1; font-size: 14px; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; margin: 0px; user-select: none; padding-left: 16px; padding-right: 16px; color: rgb(255, 255, 255);">删除试卷</span>

                                    </div>
                                </div>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="qbox"></div>
    </div>

</div>
<!-- END HEADER -->

<!-- //////////////////////////////////////////////////////////////////////////// -->

<!-- START MAIN -->

<!-- END MAIN -->


<!-- //////////////////////////////////////////////////////////////////////////// -->

<!-- START FOOTER -->

<!-- END FOOTER -->


<!-- ================================================
Scripts
================================================ -->

<script id="questionx" type="text/html">
    <div id="questionid-%questionid%" name="questionid-%pid%" class="shineBoxWrapper drag sss">
        <div class="question-card-wapper">
            <div class="top-wapper">
                <div class="left-wapper">
                    <div class="questions-type-wapper" style="background-color: rgb(76, 190, 161);">
                        <div>
                            <div class="num-word">
                                        <span>
                                            <span>%pid%</span>
                                            <span class="spacing">-</span>
                                        </span>
                                <span>%thx%</span>
                            </div>
                            <div class="type-word">单选</div>
                        </div>
                    </div>

                    <div class="correct-rate-wapper"></div>
                </div>
                <div class="imgWrapper content-wapper">
                    <div class="questions-wapper">
                        <div class="question-head">
                            <p class="question-content">
                            <p>%title%</p>
                            </p>
                        </div>
                        <div class="questions-body">
                            <div class="radio-btn-wapper">
                                <div class="radio-btn">
                                    <div></div>
                                </div>
                                A. %a00%
                            </div>
                            <div class="radio-btn-wapper">
                                <div class="radio-btn">
                                    <div></div>
                                </div>
                                B. %a01%
                            </div>
                            <div class="radio-btn-wapper">
                                <div class="checked-radio-btn">
                                    <div></div>
                                </div>
                                C. %a02%
                            </div>
                            <div class="radio-btn-wapper">
                                <div class="radio-btn">
                                    <div></div>
                                </div>
                                D. %a03%
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tool-bar-wapper">
                <div class="question-toolbar-wapper">
                    <p class="placeholder"></p>
                    <div class="operate-btn-wapper">
                        <div class="center-btn-wapper">
                            <div class="center-btn-wapper">
                                <button id="editor-%questionid%" tabindex="0" type="button"
                                        class="btn waves-effect waves-light editorCl"
                                        style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); height: 36px; line-height: 36px; min-width: 88px; color: rgb(0, 150, 136); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; position: relative; overflow: hidden; background-color: rgba(0, 0, 0, 0); text-align: center;">
                                    <div>
                                        <i class="mdi-editor-mode-edit" color="#009688"
                                           style="vertical-align: middle; margin-left: 12px; margin-right: 0px;"></i>
                                        <span style="position: relative; padding-left: 0px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: initial; font-weight: 500; font-size: 14px; color: rgb(0, 150, 136); text-align: center;">编辑</span>
                                    </div>
                                </button>
                                <button id="delete-%questionid%" tabindex="0" type="button"
                                        class="btn waves-effect waves-light deleteCl"
                                        style="border: 10px; box-sizing: border-box; display: inline-block; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; transform: translate(0px, 0px); height: 36px; line-height: 36px; min-width: 88px; color: rgb(0, 150, 136); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; position: relative; overflow: hidden; background-color: rgba(0, 0, 0, 0); text-align: center;">
                                    <div>
                                        <i class="mdi-action-delete" color="#009688"
                                           style="vertical-align: middle; margin-left: 12px; margin-right: 0px;"></i>
                                        <span style="position: relative;  padding-left: 0px; padding-right: 16px; vertical-align: middle; letter-spacing: 0px; text-transform: initial; font-weight: 500; font-size: 14px; color: rgb(0, 150, 136); text-align: center;">删除</span>
                                    </div>
                                </button>
                                <div>

                                </div>

                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</script>

<!-- jQuery Library -->
<script src="/utils/js/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="/utils/swx/sweetalert.css">
<script src="/utils/swx/sweetalert-dev.js"></script>
<!--materialize js-->
<script type="text/javascript" src="/utils/slzy/jquery-ui.js"></script>
<script type="text/javascript" src="/utils/js/materialize.min.js"></script>
<script type="text/javascript" src="/assert/tea/js/paper.js"></script>


<!--  &lt;!&ndash;scrollbar&ndash;&gt;
<script type="text/javascript" src="js/perfect-scrollbar.min.js"></script>


&lt;!&ndash;plugins.js - Some Specific JS codes for Plugin Settings&ndash;&gt;
<script type="text/javascript" src="js/plugins.js"></script>
&lt;!&ndash; Toast Notification &ndash;&gt;
<script type="text/javascript">
// Toast Notification
</script>-->
<style>
    .selectx {
        background-color: white;
        box-shadow: rgba(188, 188, 188, 0.5) 0px 0px 4px 0px;
    }

    .question-card-wapper {
        position: relative;
        width: 100%;
        background-color: #fff;
        border-bottom: 1px solid #bbb;
        border-top: 1px solid #bbb;
        padding-bottom: 60px;
    }

    .question-card-wapper .top-wapper {
        width: 100%;
        display: flex;
        min-height: 180px;
    }

    .question-card-wapper .top-wapper .left-wapper {
        width: 64px;
        position: absolute;
        top: 0;
        left: 0;
    }

    .question-card-wapper .top-wapper .left-wapper .questions-type-wapper {
        width: 64px;
        height: 60px;
        color: #fff;
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .question-card-wapper .top-wapper .left-wapper .questions-type-wapper .num-word {
        font-size: 16px;
        margin-bottom: 5px;
    }

    .question-card-wapper .top-wapper .left-wapper .questions-type-wapper .num-word .spacing {
        padding: 0 2px;
    }

    .question-card-wapper .top-wapper .left-wapper .questions-type-wapper .type-word {
        font-size: 12px;
        letter-spacing: 0.3px;
    }

    .question-card-wapper .top-wapper .left-wapper .difficulty-wapper {
        width: 64px;
        margin-top: 8px;
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        font-size: 12px;
        letter-spacing: 0.3px;
        color: #4a4a4a;
    }

    .question-card-wapper .top-wapper .left-wapper .difficulty-wapper .icon {
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 8px;
        margin-top: 5px;
    }

    .question-card-wapper .top-wapper .left-wapper .difficulty-wapper .icon i {
        font-size: 10px;
    }

    .question-card-wapper .top-wapper .left-wapper .correct-rate-wapper {
        width: 64px;
        height: 60px;
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 12px;
        letter-spacing: 0.3px;
        color: #4a4a4a;
    }

    .question-card-wapper .top-wapper .left-wapper .correct-rate-wapper .num-word {
        margin-top: 5px;
    }

    .question-card-wapper .top-wapper .content-wapper {
        margin: 10px 15px 0 74px;
        width: 100%;
    }

    .question-card-wapper .tool-bar-wapper {
        position: absolute;
        bottom: 0;
        height: 56px;
        width: 100%;
    }

    .file-type-icon {
        margin-bottom: 8px;
        width: 40px;
    }

    .main-container {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: flex-start;
        padding: 20px;
    }

    .questions-wrapper {
        flex: 1;

        overflow: hidden;
    }

    .questions-wrapper-header {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        height: 56px;
        background-color: #eee;
        border-bottom: 1px solid #d3d3d3;
        padding: 0 15px 0 5px;
        position: relative;
    }

    @keyframes shineBox {
        from {
            background-color: rgba(255, 244, 205, 0);
        }
        50% {
            background-color: rgba(255, 244, 205, 0.9);
        }
        to {
            background-color: rgba(255, 244, 205, 0);
        }
    }

    .question-wrapper-shine-box {
        position: absolute;
        width: 100%;
        height: 100%;
        animation-name: shineBox;
        animation-duration: 700ms;
        animation-iteration-count: 1;
        z-index: 1;
    }

    .shineBoxWrapper {
        position: relative;
    }

</style>

</body>

</html>