<%--
  Created by IntelliJ IDEA.
  User: kwinter
  Date: 2018/3/17
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>远程教育考试平台_在线考试</title>

    <link href="utils/main.css" rel="stylesheet" type="text/css"/>
    <link href="utils/iconfont.css" rel="stylesheet" type="text/css"/>
    <link href="utils/test.css" rel="stylesheet" type="text/css"/>

    <style>
        .hasBeenAnswer {
            background: #5d9cec;
            color: #fff;
        }

        #modal1 {
            background: #0e93d7;
            width: 320px;
        }

    </style>
</head>

<body>

<div class="main">
    <!--nr start-->
    <form action="correctpaper" id="submitForm" method="post">
        <input type="hidden" name="paperid" value="<s:property value="paperid"/>">
        <input type="hidden" name="examid" value="<s:property value="examid"/>">
        <input type="hidden" name="answers" id="answers">
    </form>

    <div class="test_main">
        <div class="nr_left">
            <div class="test">
                <form action="" method="post">
                    <div class="test_title">
                        <input type="hidden" name="paperid" value="<s:property value="paperid"/>" id="th">
                        <p class="test_time">
                            <i class="icon iconfont">&#xe6fb;</i><b class="alt-1"><s:property value="examTimeStr"/></b>
                        </p>
                        <font><input type="button" name="test_jiaojuan" onclick="answers()" value="交卷"></font>
                    </div>

                    <div class="test_content">
                        <div class="test_content_title">
                            <h2>单选题</h2>
                            <p>
                                <span>共</span><i class="content_lit">60</i><span>题，</span><span>合计</span><i
                                    class="content_fs">60</i><span>分</span>
                            </p>
                        </div>
                    </div>
                    <div class="test_content_nr">
                        <ul id="tbbox">

                        </ul>
                    </div>
                    <textarea style="display: none" id="tb">
                    <li id="qu_0_%keyx%">
                                <div class="test_content_nr_tt">
                                    <i>%key1%</i><font>%title%</font><span>(1分)</span><b
                                        class="icon iconfont">&#xe881;</b>
                                </div>

                                <div class="test_content_nr_main">
                                    <ul>

                                        <li class="option">

                                            <input type="radio" class="radioOrCheck" name="xx%questionId%"
                                                   value="%questionId%A"
                                                   id="0_answer_%keyx%_option_1" onclick="checkx(this,'%rightAnswer%')"
                                            />
                                            <label for="0_answer_%keyx%_option_1">
                                                A.
                                                <p class="ue" style="display: inline;">%a00%</p>
                                            </label>
                                        </li>
                                        <li class="option">
                                            <input type="radio" class="radioOrCheck" name="xx%questionId%"
                                                   value="%questionId%B"
                                                   id="0_answer_%keyx%_option_2" onclick="checkx(this,'%rightAnswer%')"
                                            />


                                            <label for="0_answer_%keyx%_option_2">
                                                B.
                                                <p class="ue" style="display: inline;">%a01%</p>
                                            </label>
                                        </li>

                                        <li class="option">

                                            <input type="radio" class="radioOrCheck" name="xx%questionId%"
                                                   value="%questionId%C"
                                                   id="0_answer_%keyx%_option_3" onclick="checkx(this,'%rightAnswer%')"
                                            />


                                            <label for="0_answer_%keyx%_option_3">
                                                C.
                                                <p class="ue" style="display: inline;">%a02%</p>
                                            </label>
                                        </li>

                                        <li class="option">

                                            <input type="radio" class="radioOrCheck" name="xx%questionId%"
                                                   value="%questionId%D"
                                                   id="0_answer_%keyx%_option_4" onclick="checkx(this,'%rightAnswer%')"
                                            />


                                            <label for="0_answer_%keyx%_option_4">
                                                D.
                                                <p class="ue" style="display: inline;">%a03%</p>
                                            </label>
                                             <p class="ue" style="display:none;color: red;" id="ans%questionId%">答案: %rightAnswer%</p>
                                        </li>

                                    </ul>
                                </div>
                            </li>
                    </textarea>
                    <%--   <div class="test_content">
                           <div class="test_content_title">
                               <h2>多选题</h2>
                               <p>
                                   <span>共</span><i class="content_lit">30</i><span>题，</span><span>合计</span><i class="content_fs">30</i><span>分</span>
                               </p>
                           </div>
                       </div>--%>
                    <!-- <div class="test_content_nr">
                        <ul>

                                <li id="qu_1_0">
                                    <div class="test_content_nr_tt">
                                        <i>1</i><span>(1分)</span><font>以下属于南方电网员工职业操守中明文规定的有()</font><b class="icon iconfont">&#xe881;</b>
                                    </div>

                                    <div class="test_content_nr_main">
                                        <ul>

                                                <li class="option">


                                                        <input type="checkbox" class="radioOrCheck" name="answer1"
                                                            id="1_answer_1_option_1"
                                                        />

                                                    <label for="1_answer_1_option_1">
                                                        A.
                                                        <p class="ue" style="display: inline;">热爱祖国、热爱南网、热爱岗位</p>
                                                    </label>
                                                </li>

                                                <li class="option">


                                                        <input type="checkbox" class="radioOrCheck" name="answer1"
                                                            id="1_answer_1_option_2"
                                                        />

                                                    <label for="1_answer_1_option_2">
                                                        B.
                                                        <p class="ue" style="display: inline;">遵纪守法、忠于职守、令行禁止</p>
                                                    </label>
                                                </li>

                                                <li class="option">


                                                        <input type="checkbox" class="radioOrCheck" name="answer1"
                                                            id="1_answer_1_option_3"
                                                        />

                                                    <label for="1_answer_1_option_3">
                                                        C.
                                                        <p class="ue" style="display: inline;">客户至上、诚实守信、优质服务</p>
                                                    </label>
                                                </li>

                                                <li class="option">


                                                        <input type="checkbox" class="radioOrCheck" name="answer1"
                                                            id="1_answer_1_option_4"
                                                        />

                                                    <label for="1_answer_1_option_4">
                                                        D.
                                                        <p class="ue" style="display: inline;">公平竞争、互相监督、服从监管</p>
                                                    </label>
                                                </li>

                                        </ul>
                                    </div>
                                </li>

                        </ul>
                    </div> -->

                </form>
            </div>

        </div>
        <div class="nr_right">
            <div class="nr_rt_main">
                <div class="rt_nr1">
                    <div class="rt_nr1_title">
                        <h1>
                            <i class="icon iconfont">&#xe692;</i>答题卡
                        </h1>
                        <p class="test_time">
                            <i class="icon iconfont">&#xe6fb;</i><b class="alt-1"><s:property value="examTimeStr"/></b>
                        </p>
                    </div>

                    <div class="rt_content">
                        <div class="rt_content_tt">
                            <h2>单选题</h2>

                            <p>
                                <span>共</span><i class="content_lit">60</i><span>题</span>
                            </p>
                        </div>
                        <div class="rt_content_nr answerSheet">
                            <ul id="dtk">

                            </ul>
                            <textarea style="display: none" id="dtkt">
                                    <li id="dtk%questionId%"><a href="#qu_0_%keyx%">%key1%</a></li>
                            </textarea>
                            <hr>
                            <span>答对</span><i class="qright">0</i><span>题</span>
                            <span>答错</span><i class="qwrong">0</i><span>题</span>
                            <span>目前得分</span><i id="prescores">0</i><span>分</span>
                        </div>
                    </div>

                    <!-- <div class="rt_content">
                        <div class="rt_content_tt">
                            <h2>多选题</h2>
                            <p>
                                <span>共</span><i class="content_lit">30</i><span>题</span>
                            </p>
                        </div>
                        <div class="rt_content_nr answerSheet">
                            <ul>

                                    <li><a href="#qu_1_0">1</a></li>

                            </ul>
                        </div>
                    </div> -->

                </div>

            </div>
        </div>
    </div>
    <!--nr end-->
    <div class="foot"></div>
</div>

<script src="utils/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="/utils/swx/sweetalert.css">
<script src="/utils/swx/sweetalert-dev.js"></script>
<script type="text/javascript" src="/utils/js/materialize.min.js"></script>


<!--时间js-->
<script src="/utils/time/jquery.countdown.js"></script>
<script>
    window.jQuery(function ($) {
        "use strict";

        $('time').countDown({
            with_separators: false
        });
        $('.alt-1').countDown({
            css_class: 'countdown-alt-1'
        });
        $('.alt-2').countDown({
            css_class: 'countdown-alt-2'
        });

    });


    $(function () {
        $('li.option label').click(function () {
            debugger;
            var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
            var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
            // 设置已答题
            if (!cardLi.hasClass('hasBeenAnswer')) {
                cardLi.addClass('hasBeenAnswer');
            }

        });
    });
</script>

<script src="stu.js"></script>


</body>

</html>
