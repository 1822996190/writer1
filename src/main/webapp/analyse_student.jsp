<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/1/22
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@include file="templates/header.jsp" %>
<html>
<head>
    <title>写作-Acawriter</title>
    <script src="js/analyse.all_s.js"></script>
</head>


<body style="background-color: #F2F2F2">
<div style="padding-left: 160px">
    <div style="padding: 20px; background-color: #F2F2F2">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-header">
                        Demo Acawriter
                    </div>
                    <div class="layui-card-body">
                        <div>请保持文字简短（不超过500字）以获得最佳效果。点击
                            <a style="color: #009688">Score Commit</a>
                          保存写作版本
                        </div>

                        <div class="layui-form">
                            <div class="layui-form-item">
                                <div class="layui-input-block" style="margin-left: 0;display:block">选择一种类型（清空文本编辑器内容，然后更改类型将预先填充首选文本到文本编辑器。）
                                </div>
                                <div class="layui-input-block" style="margin-left: 0;width: 50%" id="test_select">
                                    <select id="genre" lay-filter="genre">
                                        <option value="0">请选择写作类型</option>
                                        <optgroup label="Analytical">
                                            <!--第一个是 -->
                                            <option value="6">Civil Law Essay</option>
                                            <option value="5">Research Abstract/Intro</option>
                                            <option value="7">Analytical Accounting</option>
                                        </optgroup>
                                        <optgroup label="Reflective">
                                            <option value="8">Pharmacy</option>
                                        </optgroup>
                                    </select>
                                </div>
                            </div>
                        <div style="margin: 20px 0"><textarea id="txt" style="display: none"></textarea></div>

                            <div class="layui-form-item">
                                <div class="layui-input-block" style="margin-left: 0">
                                    <button class="layui-btn" id="score" style="display:inline-block">Score Commit
                                    </button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div id="tips" class="layui-card" style="display: none">
                    <div class="layui-card-header" id="to-tips">
                        Tips
                    </div>
                    <div class="layui-card-body">
                        <div class="span-tips">Here are certain rhetorical moves you can look for in your report and
                            example sentences for your reference.<br/><br/><u>Organisational analysis</u><br/> Where
                            does your report provide contextual information about the organisation’s objectives,
                            strategy, structure and activities?<br/><u>Defining performance</u><br/>Where does your
                            report provide your perspective <span class="badge badge-pill badge-analytic">P</span>
                            about how to define performance or success for the organisation? Where does your report
                            provide emphasis
                            <span class="badge badge-pill badge-analytic">E</span> to highlight the most important
                            aspects of performance for the organisation?<br/><u>Justification of your definition of
                                performance</u><br/>Where does your report provide convincing, persuasive
                            justifications for your definition of performance by proposing novel <span
                                    class="badge badge-pill badge-analytic">N</span> or critical insights,
                            contrasting ideas or tension <span class="badge badge-pill badge-analytic">C</span>?
                            Where does your report justify your definition of performance with reference to prior
                            work or background <span class="badge badge-pill badge-analytic">B</span>?<br/><u>Written
                                communication</u><br/>Where in your report do you use appropriate summary statements
                            <span
                                    class="badge badge-pill badge-analytic-green">S</span> to signal the content,
                            sequence
                            and goals of the report?<br/>
                            <table class="table table-bordered">
                                <thead>
                                <tr class="table-secondary">
                                    <th scope="col">Acawriter Move</th>
                                    <th scope="col">Sample Sentences</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td scope="row">Summary</td>
                                    <td><span class="badge badge-pill badge-analytic-green">S</span> This report
                                        defines performance for Nike Inc as a whole from the three main perspectives
                                        of economic, social and environmental performance. <br/> <span
                                                class="badge badge-pill badge-analytic-green">S</span>This section
                                        will explain how sustainability can result in the achievement of
                                        organisational objectives and contribute to company success.
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row">Perspective, Emphasis</td>
                                    <td><span class="badge badge-pill badge-analytic">P</span> Importantly, research
                                        has suggested a link between stronger brand perception and customer
                                        loyalty.<br/><span
                                                class="badge badge-pill badge-analytic">E</span> Therefore, to
                                        effectively measure performance for the Canadian Head Office of Lululemon it
                                        is essential to consider how the transformational self-improvement ethos of
                                        the company is achieved by analysing non-traditional metrics.
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row">Background</td>
                                    <td><span class="badge badge-pill badge-analytic">B</span> Previous market
                                        analysis shows that Nike is the world’s largest supplier of athletic shoes,
                                        equipment, and apparel. <br/><span
                                                class="badge badge-pill badge-analytic">B</span> Such an evaluation
                                        by a global organization has been observed previously.
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row">Contrasting ideas and Issues</td>
                                    <td><span class="badge badge-pill badge-analytic">C</span> These requirements
                                        maintain product quality as unethically produced garments could be of lower
                                        quality, damage its reputation and ultimately contradict the companys
                                        objective.<br/><span class="badge badge-pill badge-analytic">C</span> While
                                        the companys corporate mission is to maintain its market position as a
                                        leading brand for an active and mindful lifestyle, a holistic approach to
                                        defining performance is necessary given that Lululemons strength lies in its
                                        premium image
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row">Novelty</td>
                                    <td><span class="badge badge-pill badge-analytic">N</span> This closer
                                        connection with their customers allows Nike to create new ideas and convert
                                        them into products quicker while also being in touch with their demands.
                                        <br/><span class="badge badge-pill badge-analytic">N</span>Nike believes
                                        that through investing in employees and communities, they can inspire while
                                        also creating a new method of growth (Nike 2018c).
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="examples" class="layui-card" style="display: none">
                    <div class="layui-card-header" id="to-examples">
                        Examples
                    </div>
                    <div class="layui-card-body">
                        <p>A list of sample sentences with rhetorical moves, mapped to your essay assessment rubric
                            is provided below:</p>
                        <table class="table table-bordered ">
                            <thead>
                            <tr class="table-secondary">
                                <th scope="col">Sample Sentence</th>
                                <th scope="col">Essay Assessment Rubric Element</th>
                                <th scope="col">AcaWriter Move</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td scope="row">The concept of good faith <strong>has previously been
                                    thought</strong>to be a work in progress in Australia.
                                </td>
                                <td>Engagement with the law and scholarly literature</td>
                                <td>Background</td>
                            </tr>
                            <tr>
                                <td scope="row"><strong>This article will trace</strong> the origins of good faith
                                    and its development in the common law. <strong>This essay contains three parts.
                                        The first part will talk about</strong> the origins of good faith.
                                </td>
                                <td>Statement of thesis, Essay plan</td>
                                <td>Summary</td>
                            </tr>
                            <tr>
                                <td scope="row"><strong>However</strong>, where the obligations are found in statute
                                    and they conflict with contractual obligations, <strong>it is important to note
                                        that</strong> the former must prevail.
                                </td>
                                <td>Identification of relevant issues, Critical analysis and original insight</td>
                                <td>Contrast,Emphasis</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
                <div id="resources" class="layui-card" style="display:none">
                    <div class="layui-card-header" id="to-resources">
                        Resources
                    </div>
                    <div class="layui-card-body">
                        <div class="alert alert-dark" role="alert">An effective way to introduce your research is by
                            using the Creating a Research Space (C.A.R.S) framework developed by linguist John
                            Swales (1990). Swales (1990) analysed journal articles from a variety of disciplines and
                            found that researchers follow a particular organisational pattern of moves when writing
                            the introduction. The <strong>CARS</strong>moves are as follows:<br/><br/><i
                                    class="fa fa-angle-double-right"></i><strong>Establish a research
                                territory</strong> to show how the research area is important and worth
                            investigating, by introducing and reviewing previous research <br/><i
                                    class="fa fa-angle-double-right"></i>
                            <strong>Establish a niche</strong> by indicating a gap in previous research or raising
                            questions about it<br/><i class="fa fa-angle-double-right"></i><strong>Occupy the
                                niche </strong>by stating how one’s own research seeks to close/fill the gap.
                            <br/><br/>Following CARS will help set the scene of your research and will make it
                            easier for others to understand your research.<br/>For more information on how to apply
                            CARS in your research writing please
                            <a target="_blank"
                               href="http://heta.io/resources/wawa-improving-research-abstracts-intros/?target=resources"
                               style="color: white">click</a>
                            here.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="display: none" id="temporary-storage"></div>
    </div>
</body>
</html>

<%@include file="templates/footer.jsp" %>