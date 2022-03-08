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
	#test1 {
		overflow: hidden;
	}

	#test1 .layui-carousel-ind li {
		width: 16px;
		height: 10px;
		border-width: 0;
		border-style: solid;
		border-color: rgba(0, 0, 0, .3);
		border-radius: 3px;
		background-color: #f7f7f7;
		box-shadow: 0 0 6px rgba(110, 22, 64, .8);
	}

	#test1 .layui-carousel-ind li.layui-this {
		width: 24px;
		height: 10px;
		border-width: 0;
		border-style: solid;
		border-color: rgba(0, 0, 0, .3);
		border-radius: 0;
		background-color: rgba(110, 22, 64, 1);
		box-shadow: 0 0 6px rgba(110, 22, 64, .8);
	}

	/*列表*/
	.recommend {
		padding: 10px 0;
		display: flex;
		justify-content: center;
		background-repeat: no-repeat;
		background-position: center center;
		background-size: cover;
	}

	.recommend .box {
		width: 1002px;
		margin: 0 auto;
	}

	.list-title {
		padding: 14px;
		color: #776440;
		font-size: 24px;
	}

	.list-ul {
		margin: 0 22px;
	}

	.li-nav {
		display: inline-block;
		width: 100px;
		line-height: 64px;
		padding: 0 10px;
		margin: 0 5px;
		color: rgba(255, 255, 255, 1);
		font-size: 20px;
		border-radius: 0;
		border-width: 0;
		border-style: solid;
		border-color: rgba(0, 0, 0, .3);
		background-color: #669933;
		box-shadow: none;
		text-align: center;
		box-sizing: border-box;
		cursor: pointer;
		border-radius: 8px;
	}

	.li-seleted {
		box-sizing: border-box;
		border: 3px solid #fff;
		border-width: 0 0 3px 0;
	}

	.li-nav:hover {
		background-color: #3a825e;
	}

	.shop-box {
		display: flex;
		width: 100%;
		margin: 22px;
		flex-wrap: wrap;
	}

	.shop-item {
		display: flex;
		flex-direction: column;
		width: 23.5%;
		background: #d1e3dc;
		border-radius: 8px;
		overflow: hidden;
		margin: 6px;
	}

	.shop-img {
		width: 100%;
		height: 220px;
	}

	.shop-item:hover {
		transform: perspective(1000px) translate3d(0px, 0px, 0px) scale(1.1) rotate(0deg) skew(0deg, 0deg);
		transition: all 0.3s;
		z-index: 2;
		position: relative;
		box-shadow: 0px 2px 5px 1px rgba(3, 68, 32, 0.2);
	}

	.text-box {
		display: flex;
		flex-direction: column;
		justify-content: center;
		margin: 6px;
		margin-top: 10px;
	}

	.stop-text {
		display: flex;
		width: 100%;
		flex-direction: column;
		justify-content: center;
	}

	.shop-price-text {
		display: flex;
	}

	.shop-price {
		color: #936c0e;
	}
</style>

<body>

	<div id="app">
		<!-- 轮播图 -->
		<div class="layui-carousel" id="test1"
			:style='{"boxShadow":"none","margin":"0 auto","borderColor":"rgba(0,0,0,.3)","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid"}'>
			<div carousel-item>
				<div v-for="(item,index) in swiperList" :key="index">
					<img style="width: 100%;height: 100%;object-fit:cover;" :src="item.img" />
				</div>
			</div>
		</div>
		<!-- 轮播图 -->

		<!-- 标题 -->
		<div class="index-title"
			:style='{"padding":"10px 0 10px 0","boxShadow":"none","margin":"10px auto","borderColor":"#3c7236","backgroundColor":"#8fbc8f","color":"rgba(97, 73, 46, 1)","borderRadius":"0","alignItems":"center","borderWidth":"0 0 0 0px","fontSize":"30px","borderStyle":"solid",}'>
			<span>{{indexNav[6].name}}</span>
		</div>
		<!-- 标题 -->

		<div class="recommend index-pv2"
			:style='{"padding":"10px 0 10px 0","boxShadow":"none","margin":"10px 0 0 0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(203, 183, 159, 1)","borderRadius":"0","borderWidth":"0","background":"#8fbc8f","borderStyle":"solid"}'>
			<div class="box" style='width:80%'>
				<h2 class="list-title">丨器具服务</h2>
				<ul class="list-ul">
					<li v-for="item,index in shopData.appliances" :key="index" class="li-nav"
						:class="item.selected && 'li-seleted'" @click="selectedNav(item)">{{item.title}}</li>
				</ul>
				<div class="shop-box">
					<div class="shop-item" v-for="item,index in appliancesSeletedList.list" :key="index">
						<img class="shop-img"
							:src="'../../../resources/images/shop/器具/' + appliancesSeletedList.title +'/'+item.img+'.jpg'"
							alt="">
						<div class="text-box">
							<div class="stop-text">{{item.name}}</div>
							<div class="shop-price-text">价格：<span class="shop-price">{{item.price}}元</span></div>
						</div>
					</div>
				</div>
				<h2 class="list-title">丨人工服务</h2>
				<div class="shop-box">
					<div class="shop-item" v-for="item,index in shopData.artificial" :key="index">
						<img class="shop-img" :src="'../../../resources/images/shop/artificial/'+item.img+'.jpeg'"
							alt="">
						<div class="text-box">
							<div class="stop-text">{{item.name}}</div>
							<div class="shop-price-text">价格：<span class="shop-price">{{item.price}}元</span></div>
						</div>
					</div>
				</div>
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
				baseurl: '',
				dataList: [],
				indexNav,
				appliancesSeletedList: [],
				shopData: {
					//器具
					appliances: [{
							title: '视力',
							selected: false,
							list: [{
									name: '骨听骨传导助听器耳机 780R',
									img: '骨听骨传导助听器耳机',
									price: 780,
								},
								{
									name: '人工耳蜗电池助听器电池锌空气1.4V电子耳蜗电池',
									img: '人工耳蜗电池助听器电池锌空气1.4V电子耳蜗电池 24R',
									price: 24,
								}
							]
						},
						{
							title: '听力',
							selected: false,
							list: [{
								name: '低视力弱视中距离眼镜式助视器',
								img: '低视力弱视中距离眼镜式助视器. 77R',
								price: 77,
							}, {
								name: '盲人手杖拐杖生活用品盲杖折叠伸缩智能多功能导盲杆',
								img: '盲人手杖拐杖生活用品盲杖折叠伸缩智能多功能导盲杆 188R',
								price: 188,
							}, {
								name: '盲文写字板盲人学习用品',
								img: '盲文写字板盲人学习用品 49R',
								price: 49,
							}, {
								name: '语音报时表盲人表语音讲话表电子表便携式',
								img: '语音报时表盲人表语音讲话表电子表便携式 66R',
								price: 66,
							}, ]
						},
						{
							title: '言语',
							selected: false,
							list: [{
									name: '中国手语日常会话速成',
									img: '中国手语日常会话速成 50R',
									price: 50,
								},
								{
									name: '拉舌器吸舌器舌肌康复器吞咽语言口肌训练器材',
									img: '人拉舌器吸舌器舌肌康复器吞咽语言口肌训练器材 188R',
									price: 188,
								}
							]
						},
						{
							title: '肢体',
							selected: false,
							list: [{
									name: '硅胶接尿器卧床袋导尿裤残疾人用品',
									img: '硅胶接尿器卧床袋导尿裤残疾人用品  27R ',
									price: 27,
								},
								{
									name: '伸缩手杖老年人扶手杖轻便多功能防滑拐棍拐扙',
									img: '伸缩手杖老年人扶手杖轻便多功能防滑拐棍拐扙 45R',
									price: 45,
								},
								{
									name: '残疾人助行器康复老人拐杖助步器走路助力辅助行走器车扶手架',
									img: '残疾人助行器康复老人拐杖助步器走路助力辅助行走器车扶手架 173R',
									price: 173,
								},
								{
									name: '电动轮椅智能全自动折叠多功能老人瘫痪老年残疾人代步车',
									img: '电动轮椅智能全自动折叠多功能老人瘫痪老年残疾人代步车  2299R',
									price: 2299,
								},
								{
									name: '蹲厕改坐便椅孕妇老人加固大便器农村用偏瘫残疾人坐便器',
									img: '蹲厕改坐便椅孕妇老人加固大便器农村用偏瘫残疾人坐便器 198R',
									price: 198,
								},
								{
									name: '可折叠轮椅带坐便轻 便残疾人老人代步坐卧多功能',
									img: '可折叠轮椅带坐便轻 便残疾人老人代步坐卧多功能 1099R',
									price: 1099,
								},
								{
									name: '医用气垫圈加厚褥疮垫老人卧床带便防褥疮残疾人防久卧褥疮',
									img: '医用气垫圈加厚褥疮垫老人卧床带便防褥疮残疾人防久卧褥疮 298R',
									price: 298,
								},
							]
						},
						{
							title: '智力',
							selected: false,
							list: [{
									name: '认知图片女孩男孩abc儿童大号拼图积木拼装玩具凹凸拼字木板立体',
									img: '认知图片女孩男孩abc儿童大号拼图积木拼装玩具凹凸拼字木板立体 29R',
									price: 29,
								},
								{
									name: '益智拼装积木大颗粒防吞咽玩具启蒙积木模型',
									img: '益智拼装积木大颗粒防吞咽玩具启蒙积木模型 129R',
									price: 129,
								},
								{
									name: '智能早教启智问答奥贝宝宝益智幼儿童玩具',
									img: '智能早教启智问答奥贝宝宝益智幼儿童玩具 88R',
									price: 88,
								}
							]
						},
					],
					//人工
					artificial: [{
							name: '就业信息人工介绍',
							img: '就业信息人工介绍300',
							price: 300,
						},
						{
							name: '居家托养',
							img: '居家托养200',
							price: 200,
						},
						{
							name: '日间照料',
							img: '日间照料150',
							price: 150,
						},
						{
							name: '志愿者服务',
							img: '志愿者服务',
							price: 0,
						}, {
							name: '出行辅助',
							img: 'cxfz',
							price: 100,
						},
						{
							name: '厨师职业技能培训',
							img: 'csjn',
							price: 200,
						},
						{
							name: '创业指导',
							img: 'cyzd',
							price: 500,
						},
						{
							name: '法律援助',
							img: 'flyz',
							price: 250,
						},
						{
							name: '护理实用技术培训',
							img: '护理实用技术培训300',
							price: 300,
						},
						{
							name: '寄宿托养',
							img: '寄宿托养150',
							price: 150,
						},
						{
							name: '家庭无障碍改造',
							img: '家庭无障碍改造1000',
							price: 1000,
						},
						{
							name: '就业岗位分析推荐',
							img: '就业岗位分析推荐800',
							price: 800,
						},
					]
				}
			},
			filters: {
				newsDesc: function (val) {
					if (val) {
						if (val.length > 200) {
							return val.substring(0, 200).replace(/<[^>]*>/g).replace(/undefined/g, '');
						} else {
							return val.replace(/<[^>]*>/g).replace(/undefined/g, '');
						}
					}
					return '';
				}
			},
			mounted() {
				this.shopData.appliances[0].selected = true;
				this.appliancesSeletedList = this.shopData.appliances[0];
			},
			computed: {
				shopList() {

				}
			},
			methods: {
				jump(url) {
					jump(url)
				},
				selectedNav(item) {
					this.shopData.appliances.map((items) => {
						items.selected = false;
					})
					item.selected = true;
					this.appliancesSeletedList = item;
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

			var limit = 5;
			vue.baseurl = http.baseurl;

			// 获取轮播图 数据
			http.request('config/list', 'get', {
				page: 1,
				limit: 5
			}, function (res) {
				if (res.data.list.length > 0) {
					let swiperList = [];
					res.data.list.forEach(element => {
						if (element.value != null) {
							swiperList.push({
								img: http.baseurl + element.value
							});
						}
					});
					vue.swiperList = swiperList;

					vue.$nextTick(() => {
						carousel.render({
							elem: '#test1',
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

			// 分页列表
			pageList();

			// 搜索按钮
			jquery('#btn-search').click(function (e) {
				pageList();
			});

			function pageList() {
				// 获取列表数据
				http.request('news/list', 'get', {
					page: 1,
					sort: 'addtime',
					order: 'desc',
					limit: 2 * 1,
					title: '%' + jquery('#title').val() + '%',
				}, function (res) {
					vue.dataList = res.data.list
					// 分页
					laypage.render({
						elem: 'pager',
						count: res.data.total,
						limit: 2 * 1,
						groups: 5,
						layout: ["prev", "page", "next"],
						theme: '#006633',
						jump: function (obj, first) {
							//首次不执行
							if (!first) {
								http.request('news/list', 'get', {
									page: obj.curr,
									limit: obj.limit
								}, function (res) {
									vue.dataList = res.data.list
								})
							}
						}
					});
				})
			}
		});
	</script>
</body>

</html>