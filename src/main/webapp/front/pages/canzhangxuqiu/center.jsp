<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!-- 个人中心 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>个人中心</title>
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<style>
		html::after {
			position: fixed;
			top: 0;
			right: 0;
			left: 0;
			bottom: 0;
			content: '';
			display: block;
			background-attachment: fixed;
			background-size: cover;
			background-position: center;
			z-index: -1;
		}
		#swiper {
			overflow: hidden;
		}
		#swiper .layui-carousel-ind li {
			width: 16px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 3px;
			background-color: #f7f7f7;
			box-shadow: 0 0 6px rgba(110,22,64,.8);
		}
		#swiper .layui-carousel-ind li.layui-this {
			width: 24px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 0;
			background-color: rgba(110,22,64,1);
			box-shadow: 0 0 6px rgba(110,22,64,.8);
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
		.index-title span {
			padding: 0 10px;
			line-height: 1.4;
		}
		.center-container .layui-nav-tree {
			width: 100%;
		}
		.center-container .layui-nav {
			position: inherit;
		}
		.center-container .layui-nav-tree .layui-nav-item {
			height: 44px;
			line-height: 44px;
			font-size: 18px;
			color: rgba(97, 73, 46, 1);
			border-width: 0;
			border-style: solid;
			border-color: rgba(110,22,64,.3);
			border-radius: 0;
			background-color: #fff;
			box-shadow: none;
			text-align: center;
		}
		.center-container .layui-nav-tree .layui-nav-bar {
			height: 44px !important;
			opacity: 0 !important;
		}
		.center-container .layui-nav-tree .layui-nav-item.layui-this {
			font-size: 18px;
			color: #fff;
			border-width: 0;
			border-style: solid;
			border-color: rgba(110,22,64,.3);
			border-radius: 0;
			background-color: rgba(97, 73, 46, 1);
			box-shadow: none;
		}
		.center-container .layui-nav-tree .layui-nav-item:hover {
			font-size: 18px;
			color: #fff;
			border-width: 0;
			border-style: solid;
			border-color: rgba(110,22,64,.3);
			border-radius: 0;
			background-color: rgba(97, 73, 46, 1);
			box-shadow: 0 0 6px rgba(255,0,0,0);
		}
		.center-container .layui-nav-tree .layui-nav-item a {
			line-height: inherit;
			height: auto;
			background-color: inherit;
			color: inherit;
			text-decoration: none;
		}
		.right-container {
			position: relative;
		}
	
		.right-container .layui-form-item {
			display: flex;
			align-items: center;
		}
		.right-container .layui-input-block {
			margin: 0;
			flex: 1;
		}
		.right-container .input .layui-input {
			padding: 0 12px;
			height: 40px;
			font-size: 14px;
			color: #333;
			border-radius: 4px;
			border-width: 1px;
			border-style: solid;
			border-color: rgba(97, 73, 46, 1);
			background-color: #fff;
			box-shadow: none;
			text-align: left;
		}
		.right-container .select .layui-input {
			padding: 0 12px;
			height: 40px;
			font-size: 14px;
			color: #333;
			border-radius: 4px;
			border-width: 1px;
			border-style: solid;
			border-color: rgba(97, 73, 46, 1);
			background-color: #fff;
			box-shadow: none;
			text-align: left;
		}
		.right-container .date .layui-input {
			padding: 0 12px;
			height: 40px;
			font-size: 14px;
			color: #333;
			border-radius: 4px;
			border-width: 1px;
			border-style: solid;
			border-color: rgba(97, 73, 46, 1);
			background-color: #fff;
			box-shadow: none;
			text-align: left;
		}
	</style>
	<body>

		<div id="app">
			<!-- 轮播图 -->
			<!-- <div class="layui-carousel" id="swiper">
				<div carousel-item id="swiper-item">
					<div v-for="(item,index) in swiperList" v-bind:key="index">
						<img class="swiper-item" :src="item.img">
					</div>
				</div>
			</div> -->
			<div class="layui-carousel" id="swiper" :style='{"boxShadow":"none","margin":"0 auto","borderColor":"rgba(0,0,0,.3)","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid"}'>
			  <div carousel-item>
				<div v-for="(item,index) in swiperList" :key="index">
					<img style="width: 100%;height: 100%;object-fit:cover;" :src="item.img" />
				</div>
			  </div>
			</div>
			<!-- 轮播图 -->

			<!-- 标题 -->
			<!-- <h2 style="margin-top: 20px;" class="index-title">USER / CENTER</h2>
			<div class="line-container">
				<p class="line" style="background: #EEEEEE;"> 个人中心 </p>
			</div> -->
			<div class="index-title" :style='{"padding":"10px","boxShadow":"none","margin":"10px auto","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#8fbc8f","color":"rgba(97, 73, 46, 1)","borderRadius":"0","borderWidth":"0 0 0 10px","fontSize":"30px","borderStyle":"solid","height":"auto"}'>
			  <span>USER / CENTER</span><span>个人中心</span>
			</div>
			<!-- 标题 -->

			<div class="center-container">
				<!-- 个人中心菜单 config.js-->
				<div class="left-container" :style='{"padding":"0","boxShadow":"none","margin":"0","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"1px 0 1px 1px","width":"160px","borderStyle":"solid"}'>
					<ul class="layui-nav layui-nav-tree">
						<li v-for="(item,index) in centerMenu" v-bind:key="index" class="layui-nav-item" :class="index==0?'layui-this':''">
							<a :href="'javascript:jump(\''+item.url+'\')'">{{item.name}}</a>
						</li>
					</ul>
				</div>
				<!-- 个人中心菜单 -->
				<!-- 个人中心 -->
				<div class="right-container" :style='{"padding":"20px","boxShadow":"none","margin":"0","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"1px","borderStyle":"solid"}'>
					<form class="layui-form" lay-filter="myForm">
						<!-- 主键 -->
						<input type="hidden" name="id" id="id" />
						<div class="layui-form-item"  :style='{"padding":"10px","boxShadow":"none","margin":"0 0 10px 0","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
							<label  :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"18px","color":"#333","textAlign":"right"}' class="layui-form-label">用户账号</label>
							<div class="layui-input-block input">
								<input type="text"  name="yonghuzhanghao" name="yonghuzhanghao" id="yonghuzhanghao" placeholder="用户账号" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item"  :style='{"padding":"10px","boxShadow":"none","margin":"0 0 10px 0","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
							<label  :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"18px","color":"#333","textAlign":"right"}' class="layui-form-label">姓名</label>
							<div class="layui-input-block input">
								<input type="text"  name="xingming" name="xingming" id="xingming" placeholder="姓名" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item"  :style='{"padding":"10px","boxShadow":"none","margin":"0 0 10px 0","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
							<label  :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"18px","color":"#333","textAlign":"right"}' class="layui-form-label">手机号码</label>
							<div class="layui-input-block input">
								<input type="text"  name="shoujihaoma" name="shoujihaoma" id="shoujihaoma" placeholder="手机号码" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item"  :style='{"padding":"10px","boxShadow":"none","margin":"0 0 10px 0","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
							<label  :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"18px","color":"#333","textAlign":"right"}' class="layui-form-label">身份证号</label>
							<div class="layui-input-block input">
								<input type="text"  name="shenfenzhenghao" name="shenfenzhenghao" id="shenfenzhenghao" placeholder="身份证号" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item"  :style='{"padding":"10px","boxShadow":"none","margin":"0 0 10px 0","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
							<label  :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"18px","color":"#333","textAlign":"right"}' class="layui-form-label">地址</label>
							<div class="layui-input-block input">
								<input type="text"  name="dizhi" name="dizhi" id="dizhi" placeholder="地址" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item"  :style='{"padding":"10px","boxShadow":"none","margin":"0 0 10px 0","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
							<label  :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"18px","color":"#333","textAlign":"right"}' style="opacity: 0;" class="layui-form-label">头像</label>
							<div class="layui-input-block">
								<img id="canzhangpingzhengImg" style="width: 100px;height: 100px;border-radius: 50%;border: 2px solid #EEEEEE;" :style='{"boxShadow":"none","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#fff","borderRadius":"10px","borderWidth":"1px","width":"80px","borderStyle":"solid","height":"80px"}' src="../../img/avator.png">
								<input type="hidden" id="canzhangpingzheng" name="canzhangpingzheng" />
							</div>
						</div>
						<div class="layui-form-item"  :style='{"padding":"10px","boxShadow":"none","margin":"0 0 10px 0","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
							<label  :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"18px","color":"#333","textAlign":"right"}' style="opacity: 0;" class="layui-form-label">图片</label>
							<div class="layui-input-block">
								<button :style='{"padding":"0 10px","boxShadow":"none","margin":"0 10px 0 0","borderColor":"#ccc","backgroundColor":"rgba(97, 73, 46, 1)","color":"#fff","borderRadius":"8px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"44px"}' type="button" class="layui-btn btn-theme" id="canzhangpingzhengUpload">
									<i v-if="true" :style='{"color":"#fff","show":true,"fontSize":"14px"}' class="layui-icon">&#xe67c;</i>上传图片
								</button>
							</div>
						</div>
						<div class="layui-form-item"  :style='{"padding":"10px","boxShadow":"none","margin":"0 0 10px 0","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
							<label  :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"18px","color":"#333","textAlign":"right"}' class="layui-form-label">需求内容</label>
							<div class="layui-input-block input">
								<input type="text"  name="xuqiuneirong" name="xuqiuneirong" id="xuqiuneirong" placeholder="需求内容" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item"  :style='{"padding":"10px","boxShadow":"none","margin":"0 0 10px 0","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
							<label  :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"18px","color":"#333","textAlign":"right"}' class="layui-form-label">申请时间</label>
							<div class="layui-input-block date">
								<input type="text" name="shenqingshijian" id="shenqingshijian" placeholder="申请时间" autocomplete="off" class="layui-input">
							</div>
						</div>

						<div class="layui-form-item">
							<div class="layui-input-block" style="display: flex;flex-wrap:wrap;">
								<button :style='{"padding":"0 10px","boxShadow":"none","margin":"10px auto 0","borderColor":"#ccc","backgroundColor":"rgba(97, 73, 46, 1)","color":"#fff","borderRadius":"8px","borderWidth":"0","width":"60%","fontSize":"14px","borderStyle":"solid","height":"44px"}' class="layui-btn btn-submit btn-theme" lay-submit lay-filter="*">更新信息</button>
				<button :style='{"padding":"0 10px","boxShadow":"none","margin":"10px auto","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#fff","color":"rgba(97, 73, 46, 1)","borderRadius":"8px","borderWidth":"1px","width":"60%","fontSize":"14px","borderStyle":"solid","height":"44px"}' @click="logout" class="layui-btn btn-submit">退出登录</button>
							</div>
						</div>
						<!-- <div class="layui-form-item">
							<div class="layui-input-block">
								<button :style='{"padding":"0 10px","boxShadow":"none","margin":"10px auto","borderColor":"rgba(97, 73, 46, 1)","backgroundColor":"#fff","color":"rgba(97, 73, 46, 1)","borderRadius":"8px","borderWidth":"1px","width":"60%","fontSize":"14px","borderStyle":"solid","height":"44px"}' @click="logout" class="layui-btn btn-submit">退出登录</button>
							</div>
						</div> -->
					</form>
				</div>
				<!-- 个人中心 -->
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
		<!-- 校验格式工具类 -->
		<script src="../../js/validate.js"></script>

		<script>
			var vue = new Vue({
				el: '#app',
				data: {
					// 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					centerMenu: centerMenu
				},
                updated: function() {
					layui.form.render(null, 'myForm');
				},
				methods: {
					jump(url) {
						jump(url)
					},
					logout(){
						localStorage.removeItem('Token');
						localStorage.removeItem('role');
						localStorage.removeItem('sessionTable');
						localStorage.removeItem('adminName');
						localStorage.removeItem('userid');
						localStorage.removeItem('vip');
						localStorage.removeItem('userTable');
						window.parent.location.href = '../login/login.jsp';
					}
				}
			})

			layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'upload', 'laydate'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var http = layui.http;
				var jquery = layui.jquery;
				var form = layui.form;
				var upload = layui.upload;
				var laydate = layui.laydate;

				// 充值
				jquery('#btn-recharge').click(function(e) {
					layer.open({
						type: 2,
						title: '用户充值',
						area: ['900px', '600px'],
						content: '../shop-recharge/recharge.jsp'
					});
				});
				// 会员购买
				jquery('#btn-buyvip').click(function(e) {
					layer.open({
						type: 2,
						title: '会员购买',
						area: ['900px', '600px'],
						content: '../shop-recharge/buyvip.jsp'
					});
				});

				// 获取轮播图 数据
				http.request('config/list', 'get', {
					page: 1,
					limit: 5
				}, function(res) {
					if (res.data.list.length > 0) {
						let swiperList = [];
						res.data.list.forEach(element => {
											if (element.value != null) {
											  swiperList.push({
												img: http.baseurl+element.value
											  });
											}
						});
						vue.swiperList = swiperList;
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

				// 上传图片
				var canzhangpingzhengUpload = upload.render({
					//绑定元素
					elem: '#canzhangpingzhengUpload',
					//上传接口
					url: http.baseurl + 'file/upload',
					// 请求头
					headers: {
						Token: localStorage.getItem('Token')
					},
					// 允许上传时校验的文件类型
					accept: 'images',
					before: function() {
						//loading层
						var index = layer.load(1, {
							shade: [0.1, '#fff'] //0.1透明度的白色背景
						});
					},
					// 上传成功
					done: function(res) {
						console.log(res);
						layer.closeAll();
						if (res.code == 0) {
							layer.msg("上传成功", {
								time: 2000,
								icon: 6
							})
							var url = 'upload/' + res.file;
							jquery('#canzhangpingzheng').val(url);
							jquery('#canzhangpingzhengImg').attr('src', http.baseurl+url)
						} else {
							layer.msg(res.msg, {
								time: 2000,
								icon: 5
							})
						}
					},
					//请求异常回调
					error: function() {
						layer.closeAll();
						layer.msg("请求接口异常", {
							time: 2000,
							icon: 5
						})
					}
				});
                                laydate.render({
                                        elem: '#shenqingshijian',
                                        type: 'datetime'
                                });
				
				// 查询用户信息
				let table = localStorage.getItem("userTable");

				if(!table){
					layer.msg('请先登录', {
						time: 2000,
						icon: 5
					}, function() {
						window.parent.location.href = '../login/login.jsp';
					});
				}

				
				http.request(`${table}/session`, 'get', {}, function(data) {
					// 表单赋值
					form.val("myForm", data.data);
					// 图片赋值
					jquery("#canzhangpingzhengImg").attr("src", http.baseurl+data.data.canzhangpingzheng);
				});

				// 提交表单
				form.on('submit(*)', function(data) {
					data = data.field;
					http.requestJson(table + '/update', 'post', data, function(res) {
						layer.msg('修改成功', {
							time: 2000,
							icon: 6
						}, function() {
							window.location.reload();
						});
					});
					return false
				});

			});
		</script>
	</body>
</html>