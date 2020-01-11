<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <meta charset="UTF-8"></meta>


    <title>新闻修改</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

</head>
<style type="text/css">
    .page {
        　　text-align: center;
        margin: 0 auto;
    }
</style>
<body>
<hr>
<a href="http://localhost:8080/" class="btn btn-success">返回首页</a>
<a href="${pageContext.request.contextPath }/addnews" class="btn btn-info"> 添加新闻</a>
<a href="${pageContext.request.contextPath }/blogPage/0" class="btn btn-info"> 新闻列表</a>
<hr>
${msg}
<form action="${pageContext.request.contextPath }/edit/updateNews" method="post" class="form-horizontal">
    <input type="text" class="form-control" name="id" value="${blog.id}"  style="display:none;">

    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">标题</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="title" placeholder="请输入标题" value="${blog.title}">
        </div>
    </div>
    　
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">图片地址</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="src_show" value="assets/images/blog/0.PNG"
                   value="${blog.src_show}">

        </div>
    </div>
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">简短描述</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="content" placeholder="请输入描述" value="${blog.content}">
        </div>
    </div>
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">类型</label>
        <div class="col-sm-10">
            <select name="type" class="btn btn-info" value="${blog.type}">
                <option value="校园动态">校园动态</option>
                <option value="通知公告">通知公告</option>
                <option value="媒体相关">媒体相关</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">HTML代码<br><a href="http://kindeditor.net/demo.php"
                                                                             target="_blank"
                                                                             class="btn btn-info">富文本编辑器</a></label>
        <div class="col-sm-10">
            <textarea class="form-control" rows="10" name="datail" >${blog.datail}</textarea>
        </div>
    </div>
    　
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <input type="submit" value="提交" class="btn btn-info"/>
        </div>
    </div>
    　
</form>
</body>
</html>