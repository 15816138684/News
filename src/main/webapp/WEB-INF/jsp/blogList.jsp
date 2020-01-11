<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <meta charset="UTF-8"></meta>


    <title>新闻列表</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
    </script>
    <script type="text/javascript">
        function deleteBlog(id) {
            var config = confirm('你确定要删除吗？');
            if (config) {
                $.ajax({
                    url: "../deleteBlog/" + id,
                    dataType: 'text',//数据类型
                    type: 'GET',
                    success: function (data) {
                        console.log(data);
                        alert("sucess:" + data);
                        location.reload();
                    },
                    error: function (data) {
                        console.log(data);
                        alert(data.responseText);
                        location.reload();
                    }

                });

            } else {
                return;
            }

        }

    </script>
</head>
<style type="text/css">
    .page {
        　　text-align: center;
        margin: 0 auto;
    }
</style>
<body>
<a href="http://localhost:8080" class="btn btn-success">返回首页</a>
<a href="${pageContext.request.contextPath }/addnews" class="btn btn-info"> 添加新闻</a>

<table class="table table-hover">
    <tr class="info">
        <td>标号</td>
        <td>標題</td>
        <td>图片地址</td>
        <td>描述</td>
        <td>类型</td>
        <td>操作1</td>
        <td>操作2</td>
    </tr>
<c:forEach items="${blogList}" var="item">
    <tr >
        <td >${item.id}</td>
        <td>
        <a href="${pageContext.request.contextPath }/blog-show?id=${item.id}">${item.title }</a>

        </td>
        <td>${item.src_show}</td>
        <td>${item.content}</td>
        <td >${item.type}</td>
        <td><a href="${pageContext.request.contextPath }/editBlog/${item.id}" class="btn btn-info">编辑</a></td>

        <td><a href="#" onclick="deleteBlog(${item.id})" class="btn btn-danger">删除</a></td>

    </tr>
 </c:forEach>

</table>
<tr align="rigth" >
<c:forEach items="${page}" var="item">
    <a href="${pageContext.request.contextPath }/blogPage/${item}" class="btn btn-info" >${item}</a>
 </c:forEach>
</tr>

<a href="#" class="btn btn-default"> ${thisPage}</a>

</body>
</html>