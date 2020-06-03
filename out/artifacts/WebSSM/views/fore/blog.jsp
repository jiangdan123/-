<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>博客内容</title>
    <!-- Bootstrap -->

    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/lib/layui/css/layui.css">
    <style>

        header {
            background-color: #fff;
        }

        html {
            height: 100%;
        }

        body {
            width: 100%;
            height: 100%;
            background-color: #E9EAED;
        }

        .navbar {
            margin: 0px;
            background-color: #fff;
        }

        li a {
            color: black;
            font-size: 18px;
        }

        div {
            display: block;
        }

        .container {
            width: 1400px;
        }

        .collapse {
            float: right;
            margin-right: 300px !important;
        }

        .doc {

            padding: 54px 0px;
        }

        .other-list {
            width: 350px;
            float: right;
        }

        .other-item {
            margin-top: 20px;
            padding: 10px;
            background-color: #fff;
        }

        hr {
            /*margin-bottom: 0px;*/
            /*border: 1px solid;*/
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

        .footer {
            /* height: 61px; */
            text-align: center;
            padding: 25px;
            width: 100%;

            background-color: #fff;
        }

        .footer p {
            margin-bottom: 0px;
        }

        .blog-list {
            width: 1000px;
            float: left;
            font-size: 15px;
        }

        .blog-message {
            margin: 20px;
            padding: 30px;
            line-height: 20px;
            background-color: #fff;
        }

        .blog-info {
            margin: 20px;
            padding: 30px;
            font-size: 17px;
            line-height: 30px;
            background-color: #fff;
        }

        textarea {
            width: 100%;
        }

        .btn {
            margin-left: 800px;
            padding: 6px 20px;
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

    </style>
</head>
<body>

<header>
    <nav class="navbar navbar-fixed-top">
        <div class="container">
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav ">
                    <li><a href="/home?currentPage=1">博客</a></li>
                    <li><a href="/about">关于</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="doc">
    <div class="container">
        <div class="blog">
            <div class="blog-list">
                <div class="blog-info">
                    <div class="page-header">
                        <h3 style="color:#01AAED;">标题：</h3>
                        <h1>${blog.title}</h1></div>
                    <br>
                    <div class="blog-content">
                        <div class="content">
                            <p>${blog.content}
                            </p>
                        </div>
                    </div>
                </div>
                <div class="blog-message">
                    <div class="message">

                        <blockquote class="layui-elem-quote">
                            <h4>文章评论</h4>
                            <br>
                            <span>评论数：${counts}</span>
                        </blockquote>

                        <hr>
                        <h3>发表评论：</h3><br>
                        <form action="/addComment?id=${blog.id}" method="post" class="layui-form">
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">昵称：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="who" required lay-verify="required" placeholder="请输入你的昵称："
                                           autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-form-mid layui-word-aux">没关系，随便输</div>
                                <input type="submit" class="layui-btn layui-btn-normal" value="发表">
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">评论：</label>
                                <div class="layui-input-block">
                                    <textarea name="comment" style="margin-left: -30px" required lay-verify="required"
                                              placeholder="请输入内容"
                                              class="layui-textarea"></textarea>
                                </div>
                            </div>
                        </form>
                        <br>
                        <br>

                        <c:forEach items="${comments}" var="comment">
                            <div class="layui-card">
                                <div class="layui-card-header layui-bg-black">
                                    评论者：${comment.who}&nbsp;&nbsp;&nbsp;<span
                                        style="float: right">发布时间：${comment.publication}</span></div>
                                <div class="layui-card-body layui-bg-gray">
                                        ${comment.comment}
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>

        </div>
        <div class="other">
            <div class="other-list">
                <div class="other-item ">
                    <h4><i class="glyphicon glyphicon-user"></i>关于我们</h4>
                    <hr>
                    <p>团队名：java小分队</p>
                    <p>学校：成都大学</p>
                    <p>老师:姚晋老师</p>
                    <p>性感美男</p>
                </div>
                <div class="other-item other-category">
                    <p layui-bg-cyan>文章分类</p>
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
<script src="/lib/layui/layui.js" charset="utf-8"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
