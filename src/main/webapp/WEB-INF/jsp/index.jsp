<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>

<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Blog Template">
<meta name="author" content="Xiaoying Riley at 3rd Wave Media">
<link rel="shortcut icon" href="favicon.ico">

<!-- FontAwesome JS-->
<script defer
	src="https://use.fontawesome.com/releases/v5.7.1/js/all.js"
	integrity="sha384-eVEQC9zshBn0rFj4+TU78eNA19HMNigMviK/PU/FFjLXqa/GKPgX58rvt5Z8PLs7"
	crossorigin="anonymous"></script>

<!-- Theme CSS -->
<link id="theme-style" rel="stylesheet" href="assets/css/theme-6.css">

</head>
<body>
	<header class="header text-center">
	<h1 class="blog-name pt-lg-4 mb-0">
		<a>校园新闻管理系统</a>
	</h1>

	<nav class="navbar navbar-expand-lg navbar-dark">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navigation" aria-controls="navigation"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div id="navigation" class="collapse navbar-collapse flex-column">
		<div class="profile-section pt-3 pt-lg-0">
			<img class="profile-image mb-3 rounded-circle mx-auto"
				src="assets/images/profile.png" alt="image">

			<div class="bio mb-3">
               <c:choose>
                <c:when test="${sessionScope.user==null}">
                <p>
                   ${sessionScope.sessionHead.content}
                </p>
			   <a href="${pageContext.request.contextPath }/login"> 登陆</a>
			   <a href="${pageContext.request.contextPath }/regist"> 注册</a>
                </c:when>
                <c:when test="${sessionScope.user.name!='admin'}">
                    <a href="#"> ${sessionScope.user.name}</a>
                    <a href="${pageContext.request.contextPath }/addnews">添加新闻</a>
                    <a href="${pageContext.request.contextPath }/loginout">退出登录</a>
                 </c:when>
                 <c:when test="${sessionScope.user.name=='admin'}">
                    <a href="#"> ${sessionScope.user.name}</a>
                    <a href="${pageContext.request.contextPath }/blogPage/0">后台管理</a>
                    <a href="${pageContext.request.contextPath }/loginout">退出登录</a>
                 </c:when>
                </c:choose>
			</div>
			<!--//bio-->
			<hr>
		</div>
		<!--//profile-section-->

		<ul class="navbar-nav flex-column text-left">
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.request.contextPath }/"><i
					class="fas fa-home fa-fw mr-2"></i>首 　　页 <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath }/type?type=校园动态&&indexPage=0"><i
					class="fas fa-bookmark fa-fw mr-2"></i>校园动态</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath }/type?type=通知公告&&indexPage=0"><i
					class=" fas fa-film fa-fw mr-2"></i>通知公告</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath }/type?type=媒体相关&&indexPage=0"><i
					class="fas fa-download fa-fw mr-2"></i>媒体相关</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/about"><i
					class="fas fa-user fa-fw mr-2"></i>已评论新闻</a></li>

			<div class="my-2 my-md-3">
				<div id="show" style="display: none">
					<div class="signup-form form-inline justify-content-center pt-2">

						<div class="form-group">
							<textarea style="resize: none;" id="postContent"
								name="postContent" class="form-control mr-md-3 text"></textarea>
							<button type="button" class="btn btn-primary" onclick="post()">提交</button>
						</div>
					</div>
				</div>
			</div>
		</ul>
		</div>
	</nav> </header>

	<div class="main-wrapper">
		<!--显示右边全部-->
		<section class="cta-section theme-bg-light py-5"> <!--显示收缩部分-->
		<div class="container text-center">
		<embed src="assets/MP3/a1.mp3" hidden="false" autostart="true"  width="123" height="100"></embed>
			
			<h2 class="heading">校园新闻管理系统</h2>
			<div class="intro">欢迎来到校园新闻管理系统</div>
			<form action="${pageContext.request.contextPath }/search"
				method="post">
				<div class="signup-form form-inline justify-content-center pt-3">

					<div class="form-group">
						<label class="sr-only" for="semail"></label> <input type="text"
							id="search" name="search" class="form-control mr-md-1 semail"
							placeholder="Enter search content">
					</div>
					<button type="submit" class="btn btn-primary" onclick="search()">搜索</button>

				</div>
			</form>
		</div>
		<!--//container--> </section>

		<section class="blog-list px-3 py-5 p-md-5">
		<div class="container">
			<c:forEach items="${listBlog}" var="item">
				<!--显示列表-->
				<div class="item mb-5">
					<div class="media">
						<img class="mr-3 img-fluid post-thumb d-none d-md-flex" height="60px" width="80px"
							src="${item.src_show}" alt="image">
						<div class="media-body">
							<h3 class="title mb-1">
								<a
									href="${pageContext.request.contextPath}/blog-show?id=${item.id}">${item.title }</a>
							</h3>
							<div class="meta mb-1">
								<span class="date">${item.data }</span>
							</div>
							<div class="intro">${item.content }...</div>
							<a class="more-link"
								href="${pageContext.request.contextPath }/blog-show?id=${item.id}" >Read
								more &rarr;</a>
						</div>
						<!--//media-body-->
					</div>
					<!--//media-->
				</div>
				<!--//item-->
			</c:forEach>


			<nav class="blog-nav nav nav-justified my-5"> 
			
			<c:choose>
				<c:when test="${countPage<2}">
				
			<a	class="nav-link-prev nav-item nav-link  rounded-left" href="#">这是最后一页</a> 
				</c:when>
				<c:otherwise>
				<a	class="nav-link-next nav-item nav-link rounded"
				href="${pageContext.request.contextPath }/next-list?indexPage=${indexPage+6}">下一页<i
				class="arrow-next fas fa-long-arrow-alt-right"></i></a> 
				</c:otherwise>
				</c:choose>
			</nav>

		</div>
		</section>
		<footer class="footer text-center py-2 theme-bg-dark"> <small
			class="copyright">目前收录新闻一共为：${sessionScope.sessionNum}
			${sessionScope.sessionEnd.content} </small> </footer>

	</div>
	<!--//main-wrapper-->

	<!-- *****CONFIGURE STYLE (REMOVE ON YOUR PRODUCTION SITE)****** -->
	<div id="config-panel" class="config-panel d-none d-lg-block">
		<div class="panel-inner">
			<a id="config-trigger"
				class="config-trigger config-panel-hide text-center" href="#"><i
				class="fas fa-cog fa-spin mx-auto" data-fa-transform="down-6"></i></a>
			<h5 class="panel-title">Choose Colour</h5>
			<ul id="color-options" class="list-inline mb-0">
				<li class="theme-1 active list-inline-item"><a
					data-style="assets/css/theme-1.css" href="#"></a></li>
				<li class="theme-2  list-inline-item"><a
					data-style="assets/css/theme-2.css" href="#"></a></li>
				<li class="theme-3  list-inline-item"><a
					data-style="assets/css/theme-3.css" href="#"></a></li>
				<li class="theme-4  list-inline-item"><a
					data-style="assets/css/theme-4.css" href="#"></a></li>
				<li class="theme-5  list-inline-item"><a
					data-style="assets/css/theme-5.css" href="#"></a></li>
				<li class="theme-6  list-inline-item"><a
					data-style="assets/css/theme-6.css" href="#"></a></li>
				<li class="theme-7  list-inline-item"><a
					data-style="assets/css/theme-7.css" href="#"></a></li>
				<li class="theme-8  list-inline-item"><a
					data-style="assets/css/theme-8.css" href="#"></a></li>
			</ul>
		</div>
		<!--//panel-inner-->
	</div>
	<!--//configure-panel-->



	<!-- Javascript -->
	<script src="assets/plugins/jquery-3.3.1.min.js"></script>
	<script src="assets/plugins/popper.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	
<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.min.js"></script>
	<!-- Style Switcher (REMOVE ON YOUR PRODUCTION SITE) -->
	<script src="assets/js/demo/style-switcher.js"></script>
	<script>
		function post() {
			var textarea = $('#postContent').val();

			if (textarea == "" || textarea == null) {
				alert("输入要提交的内容");
				return false;
			} else {

				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath }/email',
					data : {
						"content" : textarea
					},
					dataType : 'text',

					success : function(data) {
						if (data != null) {
							alert("提示：发送成功 " + data)
							location.reload();
						}
					},
					error : function(data) {
						alert("错误");
						location.reload();
					},

				});
			}
		}
	</script>
</body>
</html>