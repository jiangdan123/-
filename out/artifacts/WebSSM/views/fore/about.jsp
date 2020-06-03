<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>不多说了，舍不得</title>
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
            width: 100%;
            height: 100%;
            background-color: #E9EAED;
        }

        .navbar {
            margin: 0px;
            background-color: #fff;
        }

        div {
            display: block;
        }

        li a {
            color: #000;
            font-size: 18px;
        }

        .container {
            width: 1400px;
            position: relative;
            padding-left: 5px;
        }

        .collapse {
            float: right;
            margin-right: 300px !important;
        }

        .doc {
            height: 92%;
            padding: 54px 0px;
        }

        .footer {
            /* height: 61px; */
            text-align: center;
            padding: 2.2rem;
            width: 100%;

            background-color: #fff;
        }

        .footer p {
            margin-bottom: 0px;
        }

        .about {
            height: 500px;
            margin: 20px;

            padding: 10px;
            background-color: #fff;
        }

        h3 {
            padding-left: 1rem;
            margin-bottom: 1rem;
            line-height: 1.5rem;
            font-size: 2rem;
            font-weight: 700;
            border-left: .25rem solid #6bc30d;
        }

        section {
            padding: 20px;
        }

        section p {
            margin: 1.5rem 0;
            padding-left: 15px;
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
<div class="doc" style="font-family: 思源Heavy">
    <div class="container">
        <div style="float: right;position: absolute;right: 100px;top:50px;height:400px ">
            <img src="/images/gg.jpg" width="400px"/>
        </div>
        <div class="about">
            <article>
                <section>
                    <h2>大 师 强 哥</h2>
                    <p>我怎么感觉</p>
                    <b>这名字不行啊</b>
                </section>

                <section style="position: relative;left:500px  ">

                    <h1>姚老师</h1>
                    <p><b>姚老师永远滴神</b></p>
                </section>

            </article>

        </div>

    </div>
</div>




<script src="/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
