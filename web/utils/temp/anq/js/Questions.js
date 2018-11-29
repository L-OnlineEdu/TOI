/**
 * Created by Administrator on 2016/11/15.
 */
if (GetRequest(0) == "tsqn") {
    var QuestionJosn = [
        {"questionId": "1", "questionTitle": " 教师教态自然，仪表端庄，遵守教学规范，无不当言论。", "questionItems": "很好;好;一般;差"},
        {"questionId": "2", "questionTitle": " 教师每堂课都能将知识、能力达成目标和教学要求清晰地告知学生。", "questionItems": "很好;好;一般;差"},
        {"questionId": "3", "questionTitle": "教师关怀和尊重我们，乐于解答我们的疑惑，答疑认真，师生关系融洽。", "questionItems": "很好;好;一般;差"},
        {"questionId": "4", "questionTitle": "教师授课内容充实，能够根据需要补充新的材料，对我们学习课程很有帮助。", "questionItems": "很好;好;一般;差"},
        {"questionId": "5", "questionTitle": "教师授课重点难点突出，能根据我们的学习基础，适时调整教学进度，进行有针对性的教学。", "questionItems": "很好;好;一般;差"},
        {
            "questionId": "6",
            "questionTitle": "教师能布置适量作业，认真检查与指导作业完成，及时讲评和反馈作业问题，并就学习难点加强辅导。",
            "questionItems": "很好;好;一般;差"
        },
        {"questionId": "7", "questionTitle": "教师知识点和例题讲解思路清晰，科学严谨有逻辑，语言规范生动，易于我们理解和接受。", "questionItems": "很好;好;一般;差"},
        {"questionId": "8", "questionTitle": "教师能做到因材施教，注重对我们创新意识和能力培养。", "questionItems": "很好;好;一般;差"},
        {"questionId": "9", "questionTitle": "教师教学方法灵活，教学手段恰当，能随时关注我们的反应，互动效果良好，课堂气氛活跃。", "questionItems": "很好;好;一般;差"},
        {"questionId": "10", "questionTitle": "教师有较强的课堂组织能力，对学生出勤和课堂纪律予以关注并加以有效管理。", "questionItems": "很好;好;一般;差"}
    ];

} else {
    if (GetRequest(0) == "ssqn") {
        var QuestionJosn = [
            {"questionId": "1", "questionTitle": " 该生思想素质如何？", "questionItems": "很好;好;一般;差"},
            {"questionId": "2", "questionTitle": " 该生学习目的是否明确？", "questionItems": "明确;不够明确;缺乏明确;没有学习目的"},
            {"questionId": "3", "questionTitle": "该生是否制定学习计划？", "questionItems": "有学习计划;有些内容有学习计划;没有系统的计划;完全没有学习计划"},
            {"questionId": "4", "questionTitle": "你认为该生是否重视学习方法？", "questionItems": "重视学习方法;较为重视;不太重视;无学习方法"},
            {"questionId": "5", "questionTitle": "该生的学习竞争意识如何？", "questionItems": "竞争意识强;较强;不太强;缺乏竞争意识"},
            {
                "questionId": "6",
                "questionTitle": "该生的听课状态如何？",
                "questionItems": "认真听课;较为认真;基本能听课;完全不听课"
            },
            {"questionId": "7", "questionTitle": "该生课后与老师交流情况如何？", "questionItems": "非常积极;较为积极;一般;不交流"},
            {"questionId": "8", "questionTitle": "该生对考证态度如何？", "questionItems": "非常重视;较为重视;一般;无所谓"},
            {"questionId": "9", "questionTitle": "该生是否迟到旷课？", "questionItems": "从不迟到旷课;偶尔迟到旷课;经常迟到旷课;不来上课"},
            {"questionId": "10", "questionTitle": ".该生的学习态度如何？", "questionItems": "学习态度端正;学习态度较好;基本完成学习任务;学风差"}
        ]

    } else {
        var QuestionJosn = [
            {"questionId": "1", "questionTitle": " 你喜欢有竞争性的活动吗？", "questionItems": "喜欢;不会刻意争取，也不会刻意逃避;无感;不喜欢"},
            {"questionId": "2", "questionTitle": " 你觉得你在工作或学习方面比别人有更多的自信和优势吗？", "questionItems": "有;与别人差不多;没有优势;比较自卑"},
            {
                "questionId": "3",
                "questionTitle": "你能正确客观的进行自我评价吗？",
                "questionItems": "能，并且会努力改进不足;能，但是改进效果不好;不能客观评价;很少对自己进行评价"
            },
            {
                "questionId": "4",
                "questionTitle": "你在人际交往中是否是领导地位？",
                "questionItems": "是的，我能掌控全局;不是，一般我是听从的一方; 没有在意过;不擅长人际交往"
            },
            {"questionId": "5", "questionTitle": "你觉得你的学习竞争意识如何？", "questionItems": "竞争意识强;较强;不太强;缺乏竞争意识"},
            {
                "questionId": "6",
                "questionTitle": "你的听课状态如何？",
                "questionItems": "认真听课;较为认真;基本能听课;完全不听课"
            },
            {"questionId": "7", "questionTitle": "你课后与老师交流情况如何？", "questionItems": "非常积极;较为积极;一般;不交流"},
            {"questionId": "8", "questionTitle": "你对考证态度如何？", "questionItems": "非常重视;较为重视;一般;无所谓"},
            {"questionId": "9", "questionTitle": "你是否迟到旷课？", "questionItems": "从不迟到旷课;偶尔迟到旷课;经常迟到旷课;不来上课"},
            {"questionId": "10", "questionTitle": ".你的学习态度如何？", "questionItems": "学习态度端正;学习态度较好;基本完成学习任务;学风差"}
        ]


    }
}

//获取url参数
function GetRequest(a) {
    var url = location.search; //获取url中"?"符后的字串
    if (url.indexOf("?") != -1) {  //判断是否有参数
        var str = url.substr(1); //从第一个字符开始 因为第0个是?号 获取所有除问号的所有符串
        strs = str.split("&&");  //用等号进行分隔 （因为知道只有一个参数 所以直接用等号进分隔 如果有多个参数 要用&号分隔 再用等号进行分隔）
        //直接弹出第一个参数 （如果有多个参数 还要进行循环的）
        var aa = [];
        $(strs).each(function (i, element) {
            aa[i] = element.split("=")[1]
        })

    }
    return aa[a]

}
