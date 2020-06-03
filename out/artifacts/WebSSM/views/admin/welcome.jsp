<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>

</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <blockquote class="layui-elem-quote">欢迎：
                        <span class="x-red">${user.username}</span> ！当前时间:<span class="x-red">${time}</span>
                    </blockquote>
                </div>
            </div>
        </div>

        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">数据统计</div>
                <div class="layui-card-body ">
                    <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>分类数目</h3>
                                <p>
                                    <cite>${csNum}</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>文章数目</h3>
                                <p>
                                    <cite>${bsNum}</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>累计浏览数</h3>
                                <p><cite>${seeNum}</cite></p>
                            </a>
                        </li>                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>累计评论数</h3>
                                <p><cite>${commentNum}</cite></p>
                            </a>
                        </li>


                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
