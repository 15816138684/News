<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>

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
  <body style="text-align:center;">
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

                    <div class="bio mb-3">
                        ${sessionScope.sessionHead.content}<br>

                    </div>
                <hr>
                </div>
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
        </nav>
  </header>

<div class="main-wrapper">
      <section class="blog-list px-3 py-5 p-md-5">
      		<div class="container">
              <h1>注册页面</h1>
                      <div color="red">${msg}</div>
                          <form action="${pageContext.request.contextPath }/registinto"
                                        method="post">
                                        <a>用户名:</a>
                              <input type="text" name = "name" placeholder="请输入用户名"/>
                              <p>
                                <br/>
                                <a>密 码 :</a>
                              <input type="password" name = "password" placeholder="长度至少为6（数字与英文组合）" />
                              </p>
                              <p>
                                 <br/>
                              <input type="submit" value="注册"/>
                              </p>
                          </form>
                      </div>
              </div>
        </div>
</form>
</div>
</div>
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

  	<!-- Style Switcher (REMOVE ON YOUR PRODUCTION SITE) -->
  	<script src="assets/js/demo/style-switcher.js"></script>

  </body>
</html>
