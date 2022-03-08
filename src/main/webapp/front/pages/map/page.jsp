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

	.recommend .box .title {
		padding: 10px 5px;
		display: flex;
		justify-content: space-between;
		align-items: center;
		box-sizing: border-box;
	}

	.recommend .box .title span {
		padding: 0 10px;
		font-size: 16px;
		line-height: 1.4;
	}

	.recommend .box .filter {
		padding: 0 10px;
		display: flex;
		align-items: center;
		box-sizing: border-box;
		width: 100%;
		flex-wrap: wrap;
	}

	.recommend .box .filter .item-list {
		display: flex;
		align-items: center;
	}

	.recommend .box .filter .item-list .lable {
		font-size: 14px;
		color: #333;
		box-sizing: border-box;
	}

	.recommend .box .list {
		display: flex;
		flex-wrap: wrap;
	}

	.recommend .box .list .list-item {
		flex: 0 0 50%;
		padding: 0 5px;
		box-sizing: border-box;
	}

	.recommend .box .list .list-item .list-item-body {
		cursor: pointer;
		border: 1px solid rgba(0, 0, 0, 3);
		padding: 5px;
		box-sizing: border-box;
	}

	.recommend .box .list .list-item-body img {
		width: 100%;
		height: 100px;
		display: block;
		margin: 0 auto;
		object-fit: cover;
		max-width: 100%;
	}

	.recommend .box .list .list-item-body .info {
		display: flex;
		flex-wrap: wrap;
	}

	.recommend .box .list .list-item-body .info .price {
		padding-top: 5px;
		color: red;
		font-size: 14px;
		text-align: center;
		box-sizing: border-box;
	}

	.recommend .box .list .list-item-body .info .name {
		padding-top: 5px;
		color: red;
		font-size: 14px;
		text-align: center;
		box-sizing: border-box;
	}

	.recommend .box .list .list-item3 {
		flex: 0 0 33.33%;
	}

	.recommend .box .list .list-item5 {
		flex: 0 0 20%;
	}

	.recommend .box .news {
		display: flex;
		flex-wrap: wrap;
		width: 100%;
	}

	.recommend .box .news .list-item {
		flex: 0 0 50%;
		padding: 0 10px;
		box-sizing: border-box;
	}

	.recommend .box .news .list-item .list-item-body {
		cursor: pointer;
		border: 1px solid rgba(0, 0, 0, 3);
		padding: 10px;
		box-sizing: border-box;
		display: flex;
	}

	.recommend .box .news .list-item .list-item-body img {
		width: 120px;
		height: 100%;
		display: block;
		margin: 0 auto;
		object-fit: cover;
		max-width: 100%;
	}

	.recommend .box .news .list-item .list-item-body .item-info {
		flex: 1;
		display: block;
		justify-content: space-between;
		flex-direction: column;
		padding-left: 10px;
		box-sizing: border-box;
	}

	.recommend .box .news .list-item .list-item-body .item-info .name {
		padding-top: 5px;
		color: red;
		font-size: 14px;
		box-sizing: border-box;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 1;
		-webkit-box-orient: vertical;
	}

	.recommend .box .news .list-item .list-item-body .item-info .time {
		padding-top: 5px;
		color: red;
		font-size: 14px;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 5;
		-webkit-box-orient: vertical;
		box-sizing: border-box;
	}

	.recommend .box .news .list-item1 {
		flex: 0 0 100%;
	}

	.recommend .box .news .list-item3 {
		flex: 0 0 33.33%;
	}

	.index-pv2 .animation-box:hover {
		transform: perspective(1000px) translate3d(0px, 0px, 0px) scale(1.1) rotate(0deg) skew(0deg, 0deg);
		transition: all 0.3s;
	}

	.index-pv2 .animation-box img:hover {
		transform: perspective(1000px) translate3d(0px, 0px, 0px) scale(1) rotate(0deg) skew(0deg, 0deg);
		transition: all 0.3s;
	}

	.layui-laypage .layui-laypage-count {
		padding: 0 10px;
	}

	.layui-laypage .layui-laypage-skip {
		padding-left: 10px;
	}

	.index-title {
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}

	.recommend .box .list3 {
		display: inline-block;
		box-sizing: border-box;
	}

	.list3 .list-item-body {
		cursor: pointer;
		box-sizing: border-box;
	}

	.list3 .list-item-body .h {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	.list3 .list-item-body .h .title {
		flex: 1;
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 1;
		overflow: hidden;
		box-sizing: border-box;
		text-align: left;
	}

	.list3 .list-item-body .h .time {
		box-sizing: border-box;
	}

	.list3 .list-item-body .desc {
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 4;
		overflow: hidden;
		box-sizing: border-box;
	}

	.list3 .list-item-body .tag {
		box-sizing: border-box;
	}

	.recommend .box .list4 {
		box-sizing: border-box;
	}

	.list4 .list-item-1 {
		display: flex;
		align-items: center;
	}

	.list4 .list-item-1 .title {
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 1;
		overflow: hidden;
		box-sizing: border-box;
		text-align: left;
	}

	.list4 .list-item-body {
		box-sizing: border-box;
		cursor: pointer;
	}

	.list4 .list-item-2 {
		display: inline-block;
	}

	.list4 .list-item-2 .title {
		text-align: left;
		flex: 1;
	}

	.list4 img {
		box-sizing: border-box;
	}

	.list4 .h {
		display: flex;
		justify-content: space-between;
	}

	.list4 .title {
		flex: 1;
		box-sizing: border-box;
	}

	.list4 .time {
		box-sizing: border-box;
	}

	.list4 .desc {
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 2;
		overflow: hidden;
		box-sizing: border-box;
	}

	.list4 .tag {
		box-sizing: border-box;
	}

	.recommend .box .list5 {
		display: flex;
		flex-wrap: wrap;
		box-sizing: border-box;
	}

	.list5 .list-item-body {
		display: flex;
		box-sizing: border-box;
		cursor: pointer;
	}

	.list5 .list-item-body img {
		box-sizing: border-box;
	}

	.list5 .list-item-body .infos {
		flex: 1;
		display: flex;
		flex-direction: column;
	}

	.list5 .list-item-body .title {
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 1;
		overflow: hidden;
		box-sizing: border-box;
		text-align: left;
	}

	.list5 .list-item-body .desc {
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 3;
		overflow: hidden;
		box-sizing: border-box;
	}

	.list5 .list-item-body .tag {
		box-sizing: border-box;
	}

	.recommend .box .list6 {
		display: inline-block;
		box-sizing: border-box;
	}

	.list6 .list-item-body {
		cursor: pointer;
		box-sizing: border-box;
		display: flex;
	}

	.list6 .list-item-body img {
		box-sizing: border-box;
	}

	.list6 .list-item-body .infos {
		flex: 1;
		display: flex;
		flex-direction: column;
	}

	.list6 .list-item-body .infos .h {
		display: flex;
		justify-content: space-between;
	}

	.list6 .list-item-body .infos .title {
		box-sizing: border-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 1;
		overflow: hidden;
		box-sizing: border-box;
		flex: 1;
		text-align: left;
	}

	.list6 .list-item-body .infos .time {
		box-sizing: border-box;
	}

	.list6 .list-item-body .infos .desc {
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 3;
		overflow: hidden;
		box-sizing: border-box;
	}

	.list6 .list-item-body .tag {
		box-sizing: border-box;
	}

	.recommend .box .list7 {
		display: inline-block;
		box-sizing: border-box;
	}

	.list7 .list-item-body {
		display: inline-block;
		box-sizing: border-box;
		cursor: pointer;
	}

	.list7 .list-item-body .h {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	.list7 .list-item-body .title {
		flex: 1;
		box-sizing: border-box;
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 1;
		overflow: hidden;
		text-align: left;
	}

	.list7 .list-item-body .desc {
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 3;
		overflow: hidden;
		box-sizing: border-box;
	}

	.list7 .list-item-body .time {
		box-sizing: border-box;
	}

	.list7 .list-item-body .tag {
		box-sizing: border-box;
	}

	.box {
		background-image: url(../../../resources/images/map.jpg);
		background-repeat: no-repeat;
		background-position: center center;
		background-size: contain;
		height: 400px;
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
			:style='{"padding":"10px 0 10px 0","boxShadow":"none","margin":"10px auto","borderColor":"#3c7236","backgroundColor":"#8fbc8f","color":"rgba(97, 73, 46, 1)","borderRadius":"0","alignItems":"center","borderWidth":"0 0 0 0px","fontSize":"30px","borderStyle":"solid"}'>
			<span>{{indexNav[4].name}}</span>
		</div>
		<!-- 标题 -->

		<!-- <div class="news-container">
        <div class="news-list">
            <div v-for="(item,index) in dataList" v-bind:key="index" href="javascript:void(0);" @click="jump('../news/detail.jsp?id='+item.id);"
             class="news-item">
                <div class="cover-container">
                    <img class="cover" :src="baseurl+item.picture">
                </div>
                <div class="detail-container">
                    <h2 class="h2">{{item.title}}</h2>
                    <div class="desc">
                        {{item.content|newsDesc}}...
                    </div>
                    <div class="create-time">
                        {{item.addtime}}
                    </div>
                </div>
            </div>
        </div>
        <div class="pager" id="pager"></div>
    </div> -->

		<div class="recommend index-pv2"
			:style='{"padding":"10px 0 10px 0","boxShadow":"none","margin":"10px 0 0 0","borderColor":"rgba(0,0,0,.3)","borderRadius":"0","borderWidth":"0","borderStyle":"solid"}'>
			<div class="box" style='width:80%'>


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
			// pageList();

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