$(function () {
    //加载上次保存写作内容
    $.ajax({
        type: 'get'
        , url: 'report'
        , data: {}
        , success: function (rst) {
            if (rst != 'null')
                $('#txt').html(rst);
        }
    });
});
layui.use(['layedit', 'util', 'layer', 'form'], function () {
    var util = layui.util;
    var layer = layui.layer;
    var layedit = layui.layedit;
    var form = layui.form;
    //构建一个默认的编辑器
    var index = layedit.build('txt');
    //固定块
    util.fixbar({
        bar1: '&#xe611;'
        , css: {right: 30, bottom: 50}
        , bgcolor: '#393D49;width:36px;height:36px;font-size:32px;line-height:36px'
        , click: function (type) {
            if (type === 'bar1') {
                layer.open({
                    type: 2,
                    offset: '200px',
                    title: '发布帖子到社区',
                    area: ['600px', '550px'],
                    content: 'editPosts.jsp'
                });
            }
        }
    });

    //每隔5S监听文本域内容变化保存到数据库
    setInterval(function () {
        var content_last = layedit.getContent(index);

        setTimeout(function () {
            var content = layedit.getContent(index);

            if (content_last == content) ;
            else {
                var data = {'content': content};
                $.ajax({
                    type: 'put'
                    , url: 'report'
                    , data: JSON.stringify(data)
                    , contentType: 'application/json;charset=utf-8'
                    , success: function (rst) {
                        if (rst == 1) ;
                        layer.msg('content saved', {icon: 1});
                    }
                });
            }

        }, 4999);
    }, 5000);

    //监听select选择,预填充文本
    form.on('select(genre)', function (data) {
        var content = layedit.getText(index);

        if (content == '') {
            if (data.value == 6) {
                var test = ("Technology is an enabler in providing greater access to justice through its ability to connect people with legal needs to legal assistance, information, and advice. With the increasing popularity of internet-enabled hand held devices and laptop computers, there is a tendency to assume that even the socio-economically vulnerable in our society have access to technology and the skills to use online services with confidence. This is not necessarily the case. \n" +
                    "\n" +
                    "Examples of the application of technology to provide legal information and assistance include case studies, guides and virtual legal advice clinics. The 2012 Review does not address the role of courts in serving the legal needs of the community. The court system is not regarded as a part of the wider legal assistance services. This omission questions the role of the court in facilitating access to its services, including dispute resolution and trials. It also identified uses of technology to expand the delivery of services, many of which are transferable to an online court. These services include e-access for remote communities, availability outside of business hours, interactive processes and virtual appearances. This essay will discuss uses of technology to expand the delivery of services, many of which are transferable to an online court.")
                layedit.setContent(index, test, false);
            } else if (data.value == 5) {
                var test = ("It is now widely accepted that timely, actionable feedback is essential for effective learning. In response to this, data science is now impacting the education sector, with a growing number of commercial products and research prototypes providing “learning dashboards”, aiming to provide real time progress indicators. From a human-centred computing perspective, the end-user’s interpretation of these visualisations is a critical challenge to design for, with empirical evidence already showing that ‘usable’ visualisations are not necessarily effective from a learning perspective. Since an educator’s interpretation of visualised data is essentially the construction of a narrative about student progress, we draw on the growing body of work on Data Storytelling (DS) as the inspiration for a set of enhancements that could be applied to data visualisations to improve their communicative power. We present a pilot study that explores the effectiveness of these DS elements based on educators’ responses to paper prototypes.");
                layedit.setContent(index, test, false);
            } else if (data.value == 7) {
                var test = ("What does ‘performance’ mean for Lululemon?\n" +
                    "EXECUTIVE SUMMARY\n" +
                    "Lululemon Athletica (‘Lululemon’) is an athletic apparel brand that produces high-end products and has expanded globally since its establishment in 1998. Commercial performance is important for the company however Lululemon’s success relies on providing a “consistent, high quality product and guest experience” (Lululemon Athletica 2017 p.5). Therefore, performance for Lululemon can be defined by two factors: \n" +
                    "\n" +
                    "1. producing high quality merchandise \n" +
                    "\n" +
                    "2. continuous innovation \n" +
                    "I INTRODUCTION \n" +
                    "Lululemon is a premium fitness brand that designs and retails ‘healthy lifestyle inspired’ athletic apparel for women, men and children (Lululemon Athletica 2017). Lululemon is a commercial success as attested to in its current operation of 406 stories in over 12 countries. This global expansion has resulted in the continuous increase of net revenue in recent years, with FY17 seeing a 15% rise to $2.3bn from FY16 (Lululemon Athletica 2017). However, academic theory holds that while financial measures are important, organisational performance can be defined through a range of methods as organisations will have different objectives (Rasula, Vuksic & Stemberger 2012). Therefore, to effectively measure ‘performance’ for the Canadian Head Office of Lululemon it is essential to consider how the transformational self-improvement ethos of the company is achieved by analysing non-traditional metrics. The report will first examine Lululemon’s overall objectives and how the company achieves these through business strategies and activities. Drawing from the company’s objective, the report will then define performance for Lululemon using non-traditional metrics. Ultimately, the report will comment on why the aforementioned definition of performance is appropriate for Lululemon.\n" +
                    "\n" +
                    "II ORGANISATIONAL ANALYSIS \n" +
                    "Lululemon’s organisational objective is to “produce products which create transformational experiences for people to live happy, healthy, fun lives” (Lululemon Athletica 2017 p.2). This aim is achieved by a threefold competitive strategy of differentiation through quality, innovation and supply chain sustainability. These strategies are achieved through the company’s corporate strategy of a single business with a vertical retail and distribution structure. Additionally, the decentralised leadership model allows store managers to connect with the brand and increase autonomy over individual stores to best implement the company’s objective (Lululemon Athletica 2017; Lululemon Athletica 2018a). Here, retail staff (‘educators’) are under control of store managers, who themselves report to the Retail Executive Vice President. Figure 1 details the organisational structure [Figure removed for AcaWriter].\n" +
                    "Lululemon’s first strategy is the creation of high-quality products. To achieve this strategy it is essential that the fabric, performance and craftsmanship of each product meets a certain standard. Lululemon can meet its quality expectations by increasing internal controls to ensure each product is of a high standard. Further, Lululemon conducts routine quality control inspections to assess if the manufactured product adheres to its quality standards (WWD Staff 2014). The second strategy is Lululemon’s continuous product innovation through a ‘design-led’ vision. Lululemon’s design is a point of differentiation as all fashion-forward products contain ‘innovative functional features’ (Lululemon Athletica 2017). Lululemon’s design team continually conducts market research and seeks inspiration from customers to ensure the products address the needs of users (Lululemon Athletica 2017). This ensures product lines are improved and appealing to customers who value the ‘technical rigor and premium quality’ of the products (Lululemon Athletica 2017).\n" +
                    "Lululemon’s final strategy focuses on improving its supply chain sustainability to retain its position as a market leader with a favourable reputation as this allows the company to create ‘transformational experiences’. Lululemon requires that manufacturers adhere to a code of ethics to ensure practices are environmentally and socially sustainable (Lululemon Athletica 2017). These requirements maintain product quality as unethically produced garments could be of lower quality, damage its reputation and ultimately contradict the company’s objective.");
                layedit.setContent(index, test, false);
            } else if (data.value == 8) {
                var test = ("Prior to starting my clinical placement, I honestly had no idea what sort of challenges I would have to face in a Community Pharmacy setting. It has essentially provided me with a perspective of the expectations of a pharmacist as a health care professional. I personally saw it as a journey which exposed my strengths and weaknesses. I saw my preceptor as someone who guided me to help address my weaknesses. However, I began to realise that this was only to a certain extent. The most important thing I learnt from these experiences is that I can only develop my skills if I actively contribute to the pharmacy by demonstrating initiative. This initiative was a product of my inner passion and motivation to practise as a pharmacist in future. Various encounters along my journey proved to me that every day presents with a new challenge. I initially could not comprehend just how diverse the members of the community were, particularly in regards to their health issues and understanding of their condition.");
                layedit.setContent(index, test, false);
            }
        }
    });

    //评分存档
    $('#score').click(function () {
        $('#temporary-storage').html(layedit.getContent(index));
        layer.open({
            type: 2,
            offset: '200px',
            shade: 0.5,
            title: '给写作过程评分并保存此次写作版本',
            area: ['400px', '350px'],
            content: 'editScore.jsp'
        });
    });
});

