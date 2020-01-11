<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bootstrap 4 Blog Template For Developers</title>

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
		<a href="#">校园新闻管理系统</a>
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

			<!--//bio-->
			<div class="bio mb-3">
                 <c:choose>
                                <c:when test="${sessionScope.user==null}">
                                <p>
                                                   ${sessionScope.sessionHead.content}
                                                </p>
                			   <a href="${pageContext.request.contextPath }/login"> 登陆</a>
                                </c:when>
                                <c:when test="${sessionScope.user!=null}">
                                    <a href="#"> ${sessionScope.user.name}</a>
                                    <a href="${pageContext.request.contextPath }/loginout">退出登录</a>
                                 </c:when>
                                </c:choose>
                </div>
			<hr>
		</div>
		<!--//profile-section-->

		<ul class="navbar-nav flex-column text-left">
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.request.contextPath }/"><i
					class="fas fa-home fa-fw mr-2"></i>首页 <span class="sr-only">(current)</span></a>
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
		</ul>
	</div>
	</nav> </header>
	<div class="main-wrapper">
		<article class="blog-post px-3 py-5 p-md-5">
		<c:choose>
		<c:when test="${aboutBlog!=null}">
 		
		  ${aboutBlog.datail} 
		  </c:when>
		  <c:otherwise>
		<div class="container">
			<header class="blog-post-header">
			<h3 class="title mb-2">${blog.title}</h3>
			<div class="meta mb-3">
				<span class="date">Published ${blog.data}</span><span class="comment">${numComment}</span>
			</div>
			</header>

				<div class="blog-post-body">${blog.datail}</div>
				<nav class="blog-nav nav nav-justified my-5"> 
				<c:choose>
				<c:when test="${blog.id==min }">
				<a	class="nav-link-prev nav-item nav-link  rounded-left" href="#">这是第一条新闻！！！</a>
				<a class="nav-link-next nav-item nav-link rounded-right"
				href="${pageContext.request.contextPath }/blog-show?id=${NextBlog.id}">下一篇<p>${NextBlog.title}</p><i
				class="arrow-next fas fa-long-arrow-alt-right"></i></a> 
				</c:when>
				<c:when test="${blog.id==max }">
				<a
				class="nav-link-prev nav-item nav-link rounded-left"
				href="${pageContext.request.contextPath }/blog-show?id=${PreBlog.id}">上一篇<p>${PreBlog.title}</p><i
				class="arrow-prev fas fa-long-arrow-alt-left"></i></a> 
				
				<a	class="nav-link-prev nav-item nav-link  rounded-left" href="#">这是最后一条新闻了！！！</a>
				</c:when>
				<c:otherwise>
				<a
				class="nav-link-prev nav-item nav-link rounded-left"
				href="${pageContext.request.contextPath }/blog-show?id=${PreBlog.id}">上一篇<p>${PreBlog.title}</p><i
				class="arrow-prev fas fa-long-arrow-alt-left"></i></a> 
				<a class="nav-link-next nav-item nav-link rounded-right"
				href="${pageContext.request.contextPath }/blog-show?id=${NextBlog.id}">下一篇<p>${NextBlog.title}</p><i
				class="arrow-next fas fa-long-arrow-alt-right"></i></a> 
				</c:otherwise>
				</c:choose>
				</nav>
				</div>
				</c:otherwise>
				</c:choose>
				</article>
					<section class="promo-section theme-bg-light py-2 text-left">
		    	<div class="container">
			    <h5 class="title"> 添加新评论</h5>

				<textarea style="resize: none;" id="comment"
								name="comment" class="form-control mr-md-3 text"></textarea>
					<nav class="blog-nav nav nav-justified my-2">
					  <c:choose>
                                    <c:when test="${sessionScope.user==null}">
							 <a class="nav-link-prev nav-item nav-link rounded-left" href="javascript:void(0);" >请登录后，再使用评论操作！！！</a>
						            </c:when>
						           <c:when test="${sessionScope.user!=null}">
                                  							 <a class="nav-link-prev nav-item nav-link rounded-left" href="javascript:void(0);" onclick="comment()">提交评论</a>
                                  						            </c:when>
                            </c:choose>
						</nav>
                        			<hr>
			<h6 class="title">目前评论一共有${numComtent}条</h6>
			<br>

			<c:forEach items="${listComment}" var="item">
			<c:if test="${item.p_id  == 0}">
			<img height="30px" width="30px" src="assets/images/profile.png" alt="image" ><a href="javascript:void(0);" style='text-decoration:none;' ><strong >用户:　${item.username }</strong></a>
			 <div class="meta mb-1">${item.date}</div>
			<textarea style="resize: none "  class="form-control mr-md-3 text" readonly>${item.comment}</textarea>
			<br>

<c:if test="${item.nextComment  != null}">
<button>回复：</button><div>
<c:forEach items="${item.nextComment}" var="item">

                        <img height="30px" width="30px" src="assets/images/profile.png" alt="image" ><a href="javascript:void(0);" style='text-decoration:none;' ><strong >用户:　${item.username }</strong></a>
            			<div class="meta mb-1">${item.date}</div>
            			<div >${item.comment}</div>
            			<hr>
            			    </c:forEach>
            			 </div>
</c:if>
            	</c:if>
            </c:forEach>
		    </div><!--//container-->
	    </section><!--//conment-section-->
				<footer class="footer text-center py-2 theme-bg-dark"> <small
			class="copyright">目前收录新闻一共为：${sessionScope.sessionNum}
			${sessionScope.sessionEnd.content} </small> </footer>
				</div>
				
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

			<!-- Style Switcher (REMOVE ON YOUR PRODUCTION SITE) -->
			<script src="assets/js/demo/style-switcher.js"></script>
			<script>
		function comment() {
			var textarea = $('#comment').val();
			
			
			if (textarea == "" || textarea == null) {
				alert("输入要提交的内容");
				return false;
			} else {

				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath }/comment?id=${blog.id}',
					data : {
						"comment" : textarea
					},
					dataType : 'text',

					success : function(data) {
						if (data != null) {
							alert("提示：发送 " + data)
							location.reload();
						}
					},
					error : function(data) {
						alert("错误");
						location.reload();
					},

				});
			}
		};
		
	</script>

</body>
</html>