<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!-- 新闻资讯 -->
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>公告信息</title>
	<link rel="stylesheet" href="../../layui/css/layui.css">
	<!-- 样式 -->
	<link rel="stylesheet" href="../../css/style.css" />
	<!-- 主题（主要颜色设置） -->
	<link rel="stylesheet" href="../../css/theme.css" />
	<!-- 通用的css -->
	<link rel="stylesheet" href="../../css/common.css" />
</head>
<style>
	#swiper {
		overflow: hidden;
	}

	#swiper .layui-carousel-ind li {
		width: 16px;
		height: 10px;
		border-width: 0;
		border-style: solid;
		border-color: rgba(0, 0, 0, .3);
		border-radius: 3px;
		background-color: #f7f7f7;
		box-shadow: 0 0 6px rgba(110, 22, 64, .8);
	}

	#swiper .layui-carousel-ind li.layui-this {
		width: 24px;
		height: 10px;
		border-width: 0;
		border-style: solid;
		border-color: rgba(0, 0, 0, .3);
		border-radius: 0;
		background-color: rgba(110, 22, 64, 1);
		box-shadow: 0 0 6px rgba(110, 22, 64, .8);
	}

	.index-title {
		text-align: center;
		box-sizing: border-box;
		width: 980px;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}

	.layui-laypage .layui-laypage-count {
		padding: 0 10px;
	}

	.layui-laypage .layui-laypage-skip {
		padding-left: 10px;
	}

	.news-container .content {
		margin: 30px auto;
	}

	.news-container .btn-container {
		display: flex;
		align-items: center;
		box-sizing: border-box;
		width: 100%;
		flex-wrap: wrap;
		width: 980px !important;
		margin: 0 auto !important;
		justify-content: space-between !important;
	}

	.news-container .btn-container button i {
		margin-right: 4px;
	}
</style>

<body>

	<div id="app">

		<!-- 轮播图 -->
		<div class="layui-carousel" id="swiper"
			:style='{"boxShadow":"none","margin":"0 auto","borderColor":"rgba(0,0,0,.3)","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid"}'>
			<div carousel-item id="swiper-item">
				<div v-for="(item,index) in swiperList" :key="index">
					<img style="width: 100%;height: 100%;object-fit:cover;" :src="item.img" />
				</div>
			</div>
		</div>
		<!-- 轮播图 -->

		<!-- 标题 -->
		<div class="index-title"
			:style='{"padding":"10px 0 10px 0","boxShadow":"none","margin":"10px auto","borderColor":"#3c7236","backgroundColor":"#8fbc8f","color":"rgba(97, 73, 46, 1)","borderRadius":"0","alignItems":"center","borderWidth":"0 0 0 0px","fontSize":"30px","borderStyle":"solid"}'>
			<span>{{titleList[showIndex]}}</span>
		</div>
		<!-- 标题 -->

		<div class="news-container">
			<h1 class="title">{{detail.title}}</h1>
			<div class="auth-container">
				时间：{{detail.addtime}}
			</div>
			<div class="content" v-html="detail.content">
			</div>

			<div v-if="showIndex != 2" class="btn-container"
				:style='{"padding":"0 10px","boxShadow":"none","margin":"10px 0 10px 0","borderColor":"#3c7236","backgroundColor":"#8fbc8f","color":"rgba(97, 73, 46, 1)","borderRadius":"4px","borderWidth":"1px","borderStyle":"solid","justifyContent":"flex-end","height":"64px"}'>
				<div class="title" style="font-size: 18px;color:#999;">
					本篇文章：{{detail.title}}
				</div>
				<button
					:style='{"padding":"0 15px","boxShadow":"0 0 8px rgba(0,0,0,0)","margin":"0 0 0 10px","borderColor":"#3a825e","backgroundColor":"#3a825e","color":"#fff","borderRadius":"4px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"40px"}'
					onclick="back()" type="button" class="layui-btn layui-btn-lg btn-theme">
					<i v-if="true" class="layui-icon">&#xe65c;</i> 返回
				</button>
			</div>
		</div>
	</div>

	<!-- layui -->
	<script src="../../layui/layui.js"></script>
	<!-- vue -->
	<script src="../../js/vue.js"></script>
	<!-- 组件配置信息 -->
	<script src="../../js/config.js"></script>
	<!-- 扩展插件配置信息 -->
	<script src="../../modules/config.js"></script>
	<!-- 工具方法 -->
	<script src="../../js/utils.js"></script>

	<script>
		var vue = new Vue({
			el: '#app',
			data: {
				// 轮播图
				swiperList: [{
					img: '../../img/banner.jpg'
				}],
				showIndex: 0, //展示内容的栏目索引
				titleList: ['政策法规', '健康园地', '联系方式'],
				contactInformation: {
					"id": 1,
					"title": "联系方式",
					"introduction": "",
					"picture": "",
					"content": `<p><span style="font-family: 宋体, SimSun; font-size: 14px;">&nbsp; &nbsp; &nbsp;&nbsp;</span></p><p style="text-align: start; "><span style="font-size: 14px; font-family: 宋体; color: rgb(51, 51, 51); background: white;">联系电话：</span><span style="font-size: 14px; font-family: Arial, sans-serif; color: rgb(51, 51, 51); background: white;">14752252390、</span><span style="background-color: white; color: rgb(51, 51, 51); font-family: Arial, sans-serif; font-size: 14px;">17305200397、</span></p><p style="text-align: start; "><span style="text-align: center; font-family: 宋体, SimSun; font-size: 14px;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br></span></p><p style="text-align: start; "><span style="color: rgb(51, 51, 51); text-align: center; font-family: 宋体, SimSun; font-size: 14px;">邮箱地址：</span>2909748711@qq.com<span style="color: rgb(51, 51, 51); font-family: Arial, sans-serif; font-size: 32px; text-align: center;"></span></p><p><br></p>`,
					"addtime": "2018-01-25 10:35:21"
				},
				gardenList: [{
					"id": 0,
					"title": "春季养生小常识",
					"introduction": "",
					"picture": "",
					"content": `<p align="center" style="text-align:center;text-indent:18.0pt;">&nbsp;</p>

<p align="left" style="text-indent:28pt;"><span style="font-family:宋体;"><span style="font-size:16px;"><strong><span style="color:#333333;">1</span></strong><strong><span style="color:#333333;">、每天坚持多喝水</span></strong></span></span></p>

<p align="left" style="text-indent:28pt;"><span style="font-family:宋体;"><span style="font-size:16px;"><span style="color:#333333;">每天坚持多喝水，能够增强身体系统的循环速度，缓解紧张的身体机能，提升预警能力和能量消耗。其实喝水还有另外一个好处减肥。如果你每天摄入16盎司的水，一年就能瘦掉5磅。</span></span></span></p>

<p align="left" style="text-indent:28pt;"><span style="font-family:宋体;"><span style="font-size:16px;"><strong><span style="color:#333333;">2</span></strong><strong><span style="color:#333333;">、不要急于减穿衣服</span></strong></span></span></p>

<p align="left" style="text-indent:28pt;"><span style="font-family:宋体;"><span style="font-size:16px;"><span style="color:#333333;">春天因气候变化大，加上阳光普照，常让人忽略初春的善变与寒冷。因此衣着最好慢慢减少，不要一下子换上夏季的短袖短裤，寒邪伤肺，容易导致鼻塞、咳嗽、感冒等，尤其中老年人不要急于减穿衣服。大家都知道“春捂秋冻”，捂的度就是不能过汗，如果天气很热了还里三层外三层的捂着，出很多汗就不好了。</span></span></span></p>

<p align="left" style="text-indent:28pt;"><span style="font-family:宋体;"><span style="font-size:16px;"><strong><span style="color:#333333;">3</span></strong><strong><span style="color:#333333;">、彻底大扫除，远离过敏</span></strong></span></span></p>

<p align="left" style="text-indent:28pt;"><span style="font-family:宋体;"><span style="font-size:16px;"><span style="color:#333333;">春天是过敏、呼吸系统疾病以及传染性疾病的高发季节，所以很有必要进行一次春季大扫除。大扫除尽量选择天气好、空气清洁时进行，扫除前先开窗通风，尽量用湿扫代替干扫，防止室内扬尘，有条件的家庭可以用吸尘器，尤其要彻底清洁床下、沙发下、衣柜等卫生死角，被褥也最好拿到室外晾晒，地毯、窗帘每次换季时都应该清洗。</span></span></span></p>

<p align="left" style="text-indent:35pt;"><span style="font-family:宋体;"><span style="font-size:16px;"><strong><span style="color:#333333;">4</span></strong><strong><span style="color:#333333;">、早上梳头、晚上泡脚</span></strong></span></span></p>

<p align="left" style="text-indent:28pt;"><span style="font-family:宋体;"><span style="font-size:16px;"><span style="color:#333333;">《养生论》说：“春三月，每朝梳头一二百下，至夜卧时，用热汤下盐一撮，洗膝下至足方卧，以泄风毒脚气，勿令壅滞。”就是说，春天早上梳头、晚上用淡盐水泡脚，能促进人体气血运行，保健防病。</span></span></span></p>

<p align="left" style="text-indent:35pt;"><span style="font-family:宋体;"><span style="font-size:16px;"><strong><span style="color:#333333;">5</span></strong><strong><span style="color:#333333;">、晚睡早起，不可恋床</span></strong></span></span></p>

<p align="left" style="text-indent:31.8pt;"><span style="font-family:宋体;"><span style="font-size:16px;"><span style="color:#333333;">春季养生在睡眠上要保持“晚睡早起”的习惯。晚点睡觉指晚上9点以后入睡。早起是指太阳刚刚升起的时候起床，有利于气机的生发，晚点睡不是越晚越好，最好在晚11点前入睡，否则第二天容易双目赤红，容易肝火上升。</span></span></span></p>

<p align="left" style="text-indent:31.8pt;line-height:150%;">&nbsp;</p>`,
					"addtime": "2022-02-16 13:05:18"
				}, {
					"id": 1,
					"title": "《如何去除甲醇》",
					"introduction": "",
					"picture": "",
					"content": `<h2 align="center">如何去除甲醇</h2>   <p>&nbsp;</p>   <p>&nbsp;</p>   <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: medium;">甲醛是让所有人都恐惧的东西，因为会存在于无形，尤其是对孕妇儿童老年人的影响会非常的大，想要去到甲醛不是没有方法，而是在于要选对的方法，去除甲醛不是开窗通风就足够的，可以养一些植物，这样会让空气当中得到很好的净化，同时再配合好用竹炭，桔子皮，洋葱片等，这些方法都是能很好去掉甲醛的。<br> </span><br> </p>         <p><span style="font-size: medium;"><strong>&nbsp;&nbsp;&nbsp;&nbsp; 1、通风法</strong> </span><br> &nbsp; &nbsp; &nbsp; &nbsp;<span style="font-size: medium;"> 最好的办法就是通风。<br> &nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-size: medium;"><strong>2、植物吸收法</strong> </span><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: medium;">植物有极强的吸收甲醛的能力，如仙人掌、吊兰、芦苇、常春藤、铁树、菊花等。。一般来说，大叶面和香草类的植物吸收甲醛的效果较好，如吊兰、虎尾兰等。 </span><br> &nbsp; &nbsp; &nbsp;<span style="font-size: medium;"><strong> 3、民间流传土方法</strong> </span><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: medium;">把茶叶渣、柚子皮、洋葱片、菠萝块等放在刚装修完的房间内或者用白醋熏蒸整个房间。 <br> &nbsp;&nbsp;</span><span style="font-size: medium;"><strong>&nbsp;&nbsp; 4、活性炭吸附法</strong> </span><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: medium;">固体活性炭具有孔隙多的特点，对甲醛等有害物质具有很强的吸附和分解作用，活性炭的颗粒越小吸附效果越好。 </span><br> &nbsp; &nbsp; &nbsp;&nbsp;<span style="font-size: medium;"><strong> 5、光触媒分解法</strong> </span><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: medium;">光触媒中的催化剂在光的刺激下，与空气中的氧气与水分生成负离子和氢氧自由基，能氧化并分解各种有机污染物和无机污染物，并最终降解为二氧化碳、水和相应的酸的等无害物质，从而达到分解污染物、净化空气的作用。 <br> &nbsp;&nbsp;&nbsp;</span><span style="font-size: medium;"><strong>&nbsp;&nbsp; 6、化学制剂净化法</strong><br> &nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-size: medium;">目前，市场上的甲醛捕捉剂分为两种，一种是通过中和甲醛，生成无害物质的方式来净化空气；另外一种是通过封闭甲醛，阻止甲醛的挥发来净化空气。 </span></p>   <br>   <br>   <br>   <br>   <p></p> `,
					"addtime": "2022-01-25 10:35:21"
				}, {
					"id": 2,
					"title": "维生素C一天的正常摄入量",
					"introduction": "",
					"picture": "",
					"content": `<p>&nbsp;&nbsp;&nbsp;<span style="font-size: medium;"> &nbsp; 人们身体当中每天都需要摄取到相应的维生素C，这点十分的关键，才可以避免自己身体当中的营养不良，但是维生素C摄取量也是会有一定的讲究，千万不要摄入过量的维生素C，否则也是会导致适得其反的效果，让自己的身体受到不好的影响，尤其是儿童不要摄入那么多的维生素C，会引起宝宝出现坏血症。 </span><span style="font-size: medium;"><br> <br> </span></p>   <div style="text-align: center;">                <p style="text-indent: 2em; text-align: left;"><span style="font-size: medium;">摄入缺乏<br> </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: medium;">长期维生素C缺乏引起的营养缺乏病称坏血病（scurvy），临床上典型的表现为牙龈肿胀、出血，皮肤淤点、淤斑，以及全身广泛出血为特征。早在16世纪前后，已观察到这种缺乏病的流行。大规模的维生素C缺乏病已少见，但在婴幼儿和老年人中仍有发生。成年人中坏血病较少见，但限制饮食或长期又不吃果蔬者，常会导致维生素C缺乏病。<br> <br> </span></p>        <p style="text-indent: 2em; text-align: left;"><span style="font-size: medium;"><strong>1．摄入不足</strong><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 食物中缺乏新鲜蔬菜、水果，或在食物加工过程中处理不当使维生素C破坏等情况导致维生素C供应不足；乳母膳食长期缺乏维生素C，或以牛乳或单纯谷类食物长期人工喂养，．而未添加富含维生素C辅食的婴儿，也容易发生维生素C缺乏。<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>2．需要量增加</strong><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 新陈代谢率增高时，维生素C的需要量增加。婴儿和早产儿生长发育快，需要量增加；感染等慢性消耗性疾病、严重创伤等维生素C需要量增加，若食物所供应的维生素C不能满足机体的特殊需求，则可导致维生素C缺乏。<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>3．吸收障碍</strong><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 慢性消化功能紊乱，长期腹泻等可致吸收减少。<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>4．药物影晌</strong><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 某些药物对维生素C的代谢有一定的影响，如雌激素、肾上腺皮质激素、四环素、降钙素、阿司匹林等可影响机体维生素C的代谢，从而导致维生素C缺乏。<br> </span></p>    <p style="text-indent: 2em; text-align: center;">&nbsp;</p>        <p style="text-indent: 2em; text-align: left;"><span style="font-size: medium;">&nbsp;另外，酗酒、偏食者也容易发生维生素C缺乏。人体虽不能合成维生素C，但机体摄取外源性维生素C后，在体内能保持一定量的储存，故即使完全缺乏维生素C供应，亦需经历一段时间才出现维生素C缺乏的症状。</span></p>    <p style="text-indent: 2em; text-align: center;">&nbsp;</p>    <p style="text-indent: 2em; text-align: center;"><br> <br> &nbsp;</p>   </div>   <br>   <p></p>`,
					"addtime": "2022-01-22 11:25:58"
				}, {
					"id": 3,
					"title": "高血压患者当心危及生命的8个动作",
					"introduction": "",
					"picture": "",
					"content": ` <p></p>   <p class="MsoNormal" style="text-indent: 35pt; margin: 0cm 0cm 0pt; mso-char-indent-count: 2.5"><span style="font-family: 仿宋_GB2312; font-size: 14pt">有些高血压病人会无缘无故地突然死亡，这除了是病情发展的原因外，有的是由于一些不引人注意的“危险动作”造成的。<span lang="EN-US">      <o:p></o:p></span></span></p>   <p class="MsoNormal" style="text-indent: 34.45pt; margin: 0cm 0cm 0pt; mso-char-indent-count: 2.45"><b style="mso-bidi-font-weight: normal"><span style="font-family: 仿宋_GB2312; font-size: 14pt">趴着看书。</span></b><span style="font-family: 仿宋_GB2312; font-size: 14pt">趴在床上看书、看电视。由于长时间处于趴伏状态，压迫腹部肌肉，影响人的深呼吸，再加上腹部受压和腹肌收缩，容易导致血压骤升而发生意外。<span lang="EN-US">      <o:p></o:p></span></span></p>   <p class="MsoNormal" style="text-indent: 34.45pt; margin: 0cm 0cm 0pt; mso-char-indent-count: 2.45"><b style="mso-bidi-font-weight: normal"><span style="font-family: 仿宋_GB2312; font-size: 14pt">下蹲及摇头动作。</span></b><span style="font-family: 仿宋_GB2312; font-size: 14pt">高血压病人除不宜进行高强度的剧烈运动外，还不宜做下蹲起立快速摇头或跳跃等动作，这类动作有引起高血压病人脑血管意外的危险。<span lang="EN-US">      <o:p></o:p></span></span></p>   <p class="MsoNormal" style="text-indent: 34.45pt; margin: 0cm 0cm 0pt; mso-char-indent-count: 2.45"><b style="mso-bidi-font-weight: normal"><span style="font-family: 仿宋_GB2312; font-size: 14pt">领带过紧。</span></b><span style="font-family: 仿宋_GB2312; font-size: 14pt">穿高领衣衫和领带过紧，可长时间压迫动脉，造成脑部供血不足，使脑细胞缺血、缺氧易引起高血压脑动脉硬化病人发生意外。<span lang="EN-US">      <o:p></o:p></span></span></p>   <p class="MsoNormal" style="text-indent: 34.45pt; margin: 0cm 0cm 0pt; mso-char-indent-count: 2.45"><b style="mso-bidi-font-weight: normal"><span style="font-family: 仿宋_GB2312; font-size: 14pt">听快节奏音乐。</span></b><span style="font-family: 仿宋_GB2312; font-size: 14pt">如果音乐节奏过快、音响强烈会强烈的刺激人体的感官，引起精神紧张、内分泌功能失调，从而引起血压骤升，有导致心脑血管病突发的危险。<span lang="EN-US">      <o:p></o:p></span></span></p>   <p class="MsoNormal" style="text-indent: 34.45pt; margin: 0cm 0cm 0pt; mso-char-indent-count: 2.45"><b style="mso-bidi-font-weight: normal"><span style="font-family: 仿宋_GB2312; font-size: 14pt">快速进餐。</span></b><span style="font-family: 仿宋_GB2312; font-size: 14pt">快速进餐与暴饮暴食对健康是极为不利的。高血压病人进餐宜定时定量，细嚼慢咽，千万不可狼吞虎咽或暴饮暴食，还要戒烟限酒，尤其要限制饮烈性酒。<span lang="EN-US">      <o:p></o:p></span></span></p>   <p class="MsoNormal" style="text-indent: 34.45pt; margin: 0cm 0cm 0pt; mso-char-indent-count: 2.45"><b style="mso-bidi-font-weight: normal"><span style="font-family: 仿宋_GB2312; font-size: 14pt">屏气排便。</span></b><span style="font-family: 仿宋_GB2312; font-size: 14pt">一时性的用力屏气排便，会因腹部压力增大、血压骤升而引发危险。<span lang="EN-US">      <o:p></o:p></span></span></p>   <p class="MsoNormal" style="text-indent: 34.45pt; margin: 0cm 0cm 0pt; mso-char-indent-count: 2.45"><b style="mso-bidi-font-weight: normal"><span style="font-family: 仿宋_GB2312; font-size: 14pt">大发脾气。</span></b><span style="font-family: 仿宋_GB2312; font-size: 14pt">可使内分泌功能紊乱，导致血管收缩，血压骤升，从而有引起心脑血管疾病突发的危险。<span lang="EN-US">      <o:p></o:p></span></span></p>   <b style="mso-bidi-font-weight: normal"><span style="font-family: 仿宋_GB2312; font-size: 14pt; mso-font-kerning: 1.0pt; mso-hansi-font-family: 'Times New Roman'; mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">&nbsp;&nbsp;&nbsp; 突然用力。</span></b>   <span style="font-family: 仿宋_GB2312; font-size: 14pt; mso-font-kerning: 1.0pt; mso-hansi-font-family: 'Times New Roman'; mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">患有高血压的病人突然用力，即使是不大的用力或是在健康人承受能力之内的用力，也有可能引起血压骤升，导致心脑血管病的突发而危及生命。</span>   <br>   <p></p> `,
					"addtime": "2022-02-12 16:05:18"
				}, {
					"id": 4,
					"title": "如何预防老年疾病:脑血栓",
					"introduction": "",
					"picture": "",
					"content": `<p>&nbsp;</p>   <p><span style="font-size: medium;"><span style="font-family: 宋体;">&nbsp; 脑血栓是一种常见多发的老年疾病，心脑血管方面的疾病对于老年人来说都是很危险的，稍有不当就会对老年人有着致命的影响，那么，脑血栓有什么预防的方法呢?<br> &nbsp; </span><span style="font-size: medium;"><span style="font-family: 宋体;">老年人的血粘度越高，越容易发生脑血栓。</span></span><span style="font-size: medium;"><span style="font-family: 宋体;">血液在人体血管内流动，就像是河水，流速越快，沉淀越少;反之，流速越慢，沉淀越多。</span></span><span style="font-size: medium;"><span style="font-family: 宋体;">血粘度增高势必导致血液流速减慢，血液中的血小板、胆固醇、纤维蛋白等物质便会在血管壁上沉淀下来，久而久之，沉淀物越积越多，若再合并有高血压、动脉硬化等疾病，就会导致脑血栓形成。</span></span><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: medium;"><span style="font-family: 宋体;">研究证实，人的血液粘度在一天之中不停地变化着，并有一定的规律：在早晨4点至8点血粘度最高，随后逐渐降低，在凌晨达到最低点，以后再逐渐回升，至早晨再次达到峰值。</span></span><span style="font-size: medium;"><span style="font-family: 宋体;">这种规律性的波动在老年人身上表现得更为突出。此外，脑血栓的发病时间多在早晨至上午期间，说明血粘度增高和脑血栓的发生有一定关系。  </span></span></span> </p>      <p><span style="font-size: medium;"><span style="font-family: 宋体;">&nbsp;</span>&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp; 专家建议：养成睡前饮水的习惯可以降低血粘度，维持血流通畅，在一定程度上防止脑血栓的形成。可见脑血栓的发生跟体内的血粘度有很大的关系，降低血粘度的方法也并不复杂，老年朋友们只要养成良好的习惯，便可以轻松让自己远离脑血栓这种老年疾病了。</span></p>   <span style="font-size: xx-small;"> <p>&nbsp;</p> </span>   <span style="font-family: 宋体;"><span style="font-size: medium;">     <div style="text-align: center;">      <p style="text-align: left;"><span style="font-size: medium;">&nbsp;&nbsp; </span></p>     </div> </span></span>   <span style="font-size: medium;">    <div style="text-align: center;">     <p style="text-align: left;">&nbsp;</p>    </div> </span>   <br>   <p></p>`,
					"addtime": "2021-12-22 16:05:18"
				}, ],
				detailList: [{
						"id": 31,
						"title": "《中华人民共和国民法典》 （摘选）",
						"introduction": "",
						"picture": "",
						"content": `<p><span style="font-size:16px;"><strong>&nbsp; &nbsp; <span style="font-size:18px;">&nbsp;<span style="font-family:宋体;">1、见义勇为可免责</span></span></strong></span></p>

<p style="text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;">第一百八十三条&ensp;&ensp;因保护他人民事权益使自己受到损害的，由侵权人承担民事责任，受益人可以给予适当补偿。没有侵权人、侵权人逃逸或者无力承担民事责任，受害人请求补偿的，受益人应当给予适当补偿。</span></p>

<p><span style="font-size:16px;"><strong>&nbsp; &nbsp; &nbsp;<span style="font-family:宋体;"><span style="font-size:18px;">2、小区共有场所收入归业主</span></span></strong></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">第二百八十二条&ensp;&ensp;建设单位、物业服务企业或者其他管理人等利用业主的共有部分产生的收入，在扣除合理成本之后，属于业主共有。</span></span></p>

<p><span style="font-size:16px;"><strong>&nbsp; &nbsp; &nbsp;<span style="font-size:18px;"><span style="font-family:宋体;">3、禁止高利放贷</span></span></strong></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">第六百八十条&ensp;&ensp;禁止高利放贷，借款的利率不得违反国家有关规定。</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">借款合同对支付利息没有约定的，视为没有利息。</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">借款合同对支付利息约定不明确，当事人不能达成补充协议的，按照当地或者当事人的交易方式、交易习惯、市场利率等因素确定利息；自然人之间借款的，视为没有利息。</span></span></p>

<p><span style="font-size:16px;"><strong>&nbsp; &nbsp;<span style="font-size:18px;"><span style="font-family:宋体;">&nbsp;4、保护个人信息</span></span></strong></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">第一百一十一条&ensp;&ensp;自然人的个人信息受法律保护。任何组织或者个人需要获取他人个人信息的，应当依法取得并确保信息安全，不得非法收集、使用、加工、传输他人个人信息，不得非法买卖、提供或者公开他人个人信息。</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">第一千零三十五条&ensp;&ensp;处理个人信息的，应当遵循合法、正当、必要原则，不得过度处理，并符合下列条件：</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">（一）征得该自然人或者其监护人同意，但是法律、行政法规另有规定的除外；</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">（二）公开处理信息的规则；</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">（三）明示处理信息的目的、方式和范围；</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">（四）不违反法律、行政法规的规定和双方的约定。</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">个人信息的处理包括个人信息的收集、存储、使用、加工、传输、提供、公开等。</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">第一千零三十六条&ensp;&ensp;处理个人信息，有下列情形之一的，行为人不承担民事责任：</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">（一）在该自然人或者其监护人同意的范围内合理实施的行为；</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">（二）合理处理该自然人自行公开的或者其他已经合法公开的信息，但是该自然人明确拒绝或者处理该信息侵害其重大利益的除外；</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">（三）为维护公共利益或者该自然人合法权益，合理实施的其他行为。</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">第一千零三十七条&ensp;&ensp;自然人可以依法向信息处理者查阅或者复制其个人信息；发现信息有错误的，有权提出异议并请求及时采取更正等必要措施。</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">自然人发现信息处理者违反法律、行政法规的规定或者双方的约定处理其个人信息的，有权请求信息处理者及时删除。</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">第一千零三十八条&ensp;&ensp;信息处理者不得泄露或者篡改其收集、存储的个人信息；未经自然人同意，不得向他人非法提供其个人信息，但是经过加工无法识别特定个人且不能复原的除外。</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">信息处理者应当采取技术措施和其他必要措施，确保其收集、存储的个人信息安全，防止信息泄露、篡改、丢失；发生或者可能发生个人信息泄露、篡改、丢失的，应当及时采取补救措施，按照规定告知自然人并向有关主管部门报告。</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">第一千零三十九条&ensp;&ensp;国家机关、承担行政职能的法定机构及其工作人员对于履行职责过程中知悉的自然人的隐私和个人信息，应当予以保密，不得泄露或者向他人非法提供。</span></span></p>

<p><span style="font-size:16px;"><strong>&nbsp; &nbsp; &nbsp;&nbsp;<span style="font-size:18px;"><span style="font-family:宋体;">5、界定夫妻共同债务</span></span></strong></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">第一千零六十四条&ensp;&ensp;夫妻双方共同签名或者夫妻一方事后追认等共同意思表示所负的债务，以及夫妻一方在婚姻关系存续期间以个人名义为家庭日常生活需要所负的债务，属于夫妻共同债务。</span></span></p>

<p style="margin-bottom:.0001pt;text-indent:24.0pt;line-height:26.0pt;"><span style="font-size:16px;"><span style="background-image:initial;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;">夫妻一方在婚姻关系存续期间以个人名义超出家庭日常生活需要所负的债务，不属于夫妻共同债务；但是，债权人能够证明该债务用于夫妻共同生活、共同生产经营或者基于夫妻双方共同意思表示的除外。</span></span></p>

<p style="text-indent:24.0pt;line-height:26.0pt;">&nbsp;</p>

<p style="text-indent:24.0pt;line-height:26.0pt;">&nbsp;</p>

<p style="text-indent:24.0pt;line-height:26.0pt;">&nbsp;</p>`,
						"addtime": "2022-02-23 10:35:43"
					},
					{
						"id": 33,
						"title": "《中华人民共和国民法总则》（摘选）",
						"introduction": "",
						"picture": "",
						"content": `<p style="text-align: center;">　　<span style="font-size:16px;">第二章 自然人</span></p>

<p style="text-align: center;">　　<span style="font-size:16px;">第二节 监护</span></p>

<p>　　<span style="font-size:16px;">第三十三条 具有完全民事行为能力的成年人，可以与其近亲属、其他愿意担任监护人的个人或者组织事 先协商，以书面形式确定自己的监护人。协商确定的监护人在该成年人丧失或者部分丧失民事行为能力时，履行监护职责。 </span></p>

<p>　　<span style="font-size:16px;">第三十四条 监护人的职责是代理被监护人实施民事法律行为，保护被监护人的人身权利、财产权利以及其他合法权益等。 监护人依法履行监护职责产生的权利，受法律保护。监护人不履行监护职责或者侵害被监护人合法权益的，应当承担法律责任。</span></p>

<p>　　<span style="font-size:16px;">第三十五条 监护人应当按照最有利于被监护人的原则履行监护职责。监护人除为维护被监护人利益外，不得处分被监护人的财产。未成年人的监护人履行监护职责，在作出与被监护人利益有关的决定时，应当根据 被监护人的年龄和智力状况， 尊重被监护人的真实意愿。成年人的监护人履行监护职责，应当最大程度地尊 重被监护人的真实意愿，保障并协助被监护人实施与其 智力、精神健康状况相适应的民事法律行为。对被监护人有能力独立处理的事务，监护人不得干涉。</span></p>

<p>　　<span style="font-size:16px;">温馨提示：《中华人民共 和国民法总则》自 2017年10月1日起施行，涉及内容广泛，与民众生活息息相关，请大家关注并认真学习。</span></p>

<p>　　</p>`,
						"addtime": "2022-02-12 16:05:18"
					},
					{
						"id": 34,
						"title": "《中华人民共和国城市居民委员会组织法》（节选）",
						"introduction": "",
						"picture": "",
						"content": `<p class="p0" style="margin-bottom: 5pt; margin-top: 5pt; line-height: 200%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="color: rgb(0, 0, 0); font-weight: bold; font-size: 12pt; font-family: 宋体; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">&nbsp; &nbsp;第八条</span><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 宋体; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">&nbsp;&nbsp;</span><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">居民委员会主任、副主任和委员，由本居住地区全体有选举权的居民或者由每户派代表选举产生；根据居民意见，也可以由每个居民小组选举代表二至三人选举产生。居民委员会每届任期五年，其成员可以连选连任。</span><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><o:p></o:p></span></p>

<p class="p0" style="margin-bottom: 5pt; margin-top: 5pt; line-height: 200%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">年满十八周岁的本居住地区居民，不分民族、种族、性别、职业、家庭出身、宗教信仰、教育程度、财产状况、居住期限，都有选举权和被选举权；但是，依照法律被剥夺政治权利的人除外。</span><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><o:p></o:p></span></p>

<p class="p0" style="margin-bottom: 5pt; margin-top: 5pt; line-height: 200%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="color: rgb(0, 0, 0); font-weight: bold; font-size: 12pt; font-family: 宋体; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">&nbsp; &nbsp;第九条</span><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 宋体; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">&nbsp;&nbsp;</span><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">居民会议由十八周岁以上的居民组成。</span><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><o:p></o:p></span></p>

<p class="p0" style="margin-bottom: 5pt; margin-top: 5pt; line-height: 200%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">居民会议可以由全体十八周岁以上的居民或者每户派代表参加，也可以由每个居民小组选举代表二至三人参加。</span><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><o:p></o:p></span></p>

<p class="p0" style="margin-bottom: 0pt; margin-top: 0pt; line-height: 200%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">居民会议必须有全体十八周岁以上的居民、户的代表或者居民小组选举的代表的过半数出席，才能举行。会议的决定，由出席人的过半数通过。</span><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><o:p></o:p></span></p>

<p class="p0" style="margin-bottom: 0pt; margin-top: 0pt; line-height: 200%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="color: rgb(0, 0, 0); font-weight: bold; font-size: 12pt; font-family: 宋体; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><o:p></o:p></span></p>

<p class="p0" style="margin-bottom: 0pt; margin-top: 0pt; line-height: 200%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="color: rgb(0, 0, 0); font-weight: bold; font-size: 12pt; font-family: 宋体; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">&nbsp; &nbsp;第十条</span><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 宋体; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">&nbsp;&nbsp;</span><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">居民委员会向居民会议负责并报告工作。</span><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><o:p></o:p></span></p>

<p class="p0" style="margin-bottom: 0pt; margin-top: 0pt; line-height: 200%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">居民会议由居民委员会召集和主持。有五分之一以上的十八周岁以上的居民、五分之一以上的户或者三分之一以上的居民小组提议，应当召集居民会议。涉及全体居民利益的重要问题，居民委员会必须提请居民会议讨论决定。</span><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><o:p></o:p></span></p>

<p class="p0" style="margin-bottom: 0pt; margin-top: 0pt; line-height: 200%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">居民会议有权撤换和补选居民委员会成员。</span><span style="color: rgb(0, 0, 0); font-size: 12pt; font-family: 瀹嬩綋; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><o:p></o:p></span></p>

<p class="p0" style="margin-left: 23.6pt; text-indent: -23.52pt; margin-bottom: 5pt; margin-top: 5pt; text-align: center; line-height: 200%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="font-weight: bold; font-size: 16pt; font-family: 宋体;"><o:p></o:p></span></p>`,
						"addtime": "2022-02-09 11:55:56"
					}
				],
				detail: {}
			},
			methods: {
				jump(url) {
					jump(url)
				}
			}
		})

		layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery'], function () {
			var layer = layui.layer;
			var element = layui.element;
			var carousel = layui.carousel;
			var laypage = layui.laypage;
			var http = layui.http;
			var jquery = layui.jquery;

			var id = http.getParam('index');
			var type = http.getParam('type');
			if (type == 'garden') {
				vue.detail = vue.gardenList[id];
				vue.showIndex = 1;
			} else if (type == 'contactInformation') {
				vue.detail = vue.contactInformation;
				vue.showIndex = 2;
			} else {
				vue.detail = vue.detailList[id];
				vue.showIndex = 0;
			}

			vue.baseurl = http.baseurl;
			// 获取轮播图 数据
			http.request('config/list', 'get', {
				page: 1,
				limit: 5
			}, function (res) {
				if (res.data.list.length > 0) {
					var swiperItemHtml = '';
					for (let item of res.data.list) {
						if (item.name.indexOf('picture') >= 0 && item.value && item.value != "" && item
							.value != null) {
							swiperItemHtml +=
								'<div>' +
								'<img style="width: 100%;height: 100%;object-fit:cover;" class="swiper-item" src="' +
								http.baseurl + item.value + '">' +
								'</div>';
						}
					}
					jquery('#swiper-item').html(swiperItemHtml);
					// 轮播图
					vue.$nextTick(() => {
						carousel.render({
							elem: '#swiper',
							width: '100%',
							height: '350px',
							arrow: 'always',
							anim: 'default',
							autoplay: 'true',
							interval: '3000',
							indicator: 'none'
						});

					})
				}
			});

			// 详情信息
			// http.request('news/detail/' + id, 'get', {}, function(res) {
			// 	vue.detail = res.data
			// });

		});
	</script>
</body>

</html>