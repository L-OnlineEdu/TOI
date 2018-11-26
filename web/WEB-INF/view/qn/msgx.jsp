<%--
  Created by IntelliJ IDEA.
  User: kwinter
  Date: 2018/3/14
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>home</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet"/>
    <!--CUSTOM BASIC STYLES-->
    <link href="assets/css/basic.css" rel="stylesheet"/>
    <!--CUSTOM MAIN STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet"/>
    <!-- GOOGLE FONTS-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
</head>
<body>


<div id="page-wrapper">


    <!-- <div class="row"> -->
    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">

                Recent Chat History <input style="width:100px" type="text" class="form-control" placeholder="RID"
                                           id="receId" value="2"/>
            </div>
            <div class="panel-body" style="padding: 0px;">
                <div class="chat-widget-main" id="msgbox">


                </div>
            </div>
            <div class="panel-footer">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Enter Message" id="sendMsg"/>

                    <span class="input-group-btn">

                                        <button class="btn btn-success" onclick="send()" type="button">SEND</button>
                                    </span>

                </div>
            </div>
        </div>
    </div>


    <!-- </div> -->

    <!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER  -->

<!-- /. WRAPPER  -->
<textarea id="sendx" style="display:none">
        <div class="chat-widget-right">
                 %msg%
        </div>
        <div class="chat-widget-name-right">
            <h4>%sender%</h4>
        </div>
    </textarea>

<textarea id="recex" style="display:none">
        <div class="chat-widget-left">
              %message%
        </div>
        <div class="chat-widget-name-left">
            <h4>%sender.userName%</h4>
        </div>
    </textarea>
<!-- /. FOOTER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="assets/js/bootstrap.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="assets/js/custom.js"></script>
<script src="ss/jxv1.js"></script>


</body>
</html>

