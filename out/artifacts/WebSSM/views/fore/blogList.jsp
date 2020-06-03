<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人博客</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <style>

        header {
            background-color: #fff;
        }

        html {
            height: 100%;
        }

        body {

            background-color: #E9EAED;
        }

        .navbar {
            background-color: #fff;
            margin: 0px;
        }

        li a {
            color: black;
            font-size: 18px;
        }

        div {
            display: block;
        }

        .doc {
            padding: 54px 0px;
        }

        .container {
            width: 1400px;
            min-height: 100%;
            position: relative;
        }

        .collapse {
            float: right;
            margin-right: 300px !important;
        }

        .other-list {
            width: 350px;
            float: right;
        }

        .other-item {
            margin: 20px;
            padding: 10px;
            background-color: #fff;
        }

        .blog-list {
            width: 1000px;
            float: left;
            font-size: 15px;
        }

        .blog-item {
            margin: 20px;
            height: 260px;
            padding: 10px;
            line-height: 28px;
            background-color: #fff;
        }

        .blog-category {
            margin-left: 220px;
        }

        .blog-category a {
            color: black;
        }

        .list-title {
            margin: 20px;
            padding: 10px;
            background-color: #fff;
        }

        li {
            list-style-type: none;
        }

        a {
            color: black;
        }

        a:hover {
            color: rgb(66, 130, 248);
            text-decoration: none;
        }

        footer {
            height: 60px;
            text-align: center;
            padding: 25px;
            position: absolute;
            width: 100%;

            background-color: #fff;
        }

        .blog-content {
            width: 920px;
            height: 180px;
        }

        .image {
            width: 200px;
            height: 180px;
        }

        .content {
            overflow: hidden;
            display: block;
            width: 700px;
            height: 160px;
            float: right;
        }

        .blog-image {
            display: block;
            width: 200px;
            float: left;
        }

        .read {
            color: rgb(54, 138, 138);
        }

        ul {
            padding: 0px;
            margin-top: 10px;
        }

        .blog-category li {
            /* float: left; */
            display: inline;
            margin-right: 30px;
        }

        .glyphicon {
            margin-right: 5px;
        }

        .blog-item span {
            color: cornflowerblue;
        }

        h3 {
            margin: 0px;
        }

        .other-category li {
            height: 40px;
            line-height: 30px;
        }

        .other-category li a {
            padding: 0px 20px;
            display: block;
            height: 40px;
            text-align: left;
            line-height: 30px;
            color: #969795;
            width: 100%;
        }

        .other-category li a:hover {
            color: #000;
            background-color: #e6e7e4;
        }

        .blog-page {
            margin: 20px;
        }
    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-fixed-top">
        <div class="container">
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/home">博客</a></li>
                    <li><a href="/about">关于</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="doc" style="font-family: 思源Heavy">
    <div class="container">
        <div class="blog">
            <div class="blog-list">
                <div class="list-title">
                    <c:if test="${msg == 1}"><h2>全部文章</h2></c:if>
                    <c:if test="${msg == 0}"><h2>${cname}</h2></c:if>
                </div>
                <c:forEach items="${blogs}" var="blog" begin="0" end="5">
                    <div class="blog-item">
                        <h3><span>【原创】</span><a class="blog-title" href="blog?id=${blog.id}">${blog.title}</a></h3>
                        <div class="blog-content">
                            <a class="blog-image" href="#">
                                <img class="image" src="/images/java.jpg"/>
                            </a>
                            <div class="content">
                                    ${blog.content} ... <a class="read" href="blog?id=${blog.id}">阅读全文></a>
                            </div>
                            <div class="blog-category">
                                <ul>
                                    <li><i class="glyphicon glyphicon-tags"></i>
                                        <a href="search?cid=${blog.category.id}&cname=${blog.category.categoryName}">${blog.category.categoryName}</a>
                                    </li>
                                    <li><i class="glyphicon glyphicon-calendar"></i>
                                        <fmt:formatDate value="${blog.createTime}" type="both"></fmt:formatDate></li>
                                    <li><i class="glyphicon glyphicon-eye-open"></i>${blog.times}</li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="other">
            <div class="other-list">
                <div class="other-item ">
                    <h4><i class="glyphicon glyphicon-user"></i>关于我们</h4>
                    <hr>
                    <p>团队名：java小分队</p>
                    <p>学校：成都大学</p>
                    <p>老师: 姚晋老师</p>
                    <p>性 感 美 男</p>
                </div>
                <div class="other-item other-category layui-bg-blue">
                    <p>文章分类</p>
                    <hr>
                    <ul>
                        <li><a href="/home">所有文章</a></li>
                        <c:forEach items="${categories}" var="cs">
                            <li><a href="search?cid=${cs.id}&cname=${cs.categoryName}">${cs.categoryName}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
