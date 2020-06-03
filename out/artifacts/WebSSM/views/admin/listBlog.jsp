<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>博客列表</title>
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
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>标题</th>
                            <th>类型</th>
                            <th>创建时间</th>
                            <th>修改时间</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                        <c:forEach items="${blogs}" var="bs">
                            <tr>
                                <td>${bs.id}</td>
                                <td>${bs.title}</td>
                                <td>${bs.category.categoryName}</td>
                                <td><fmt:formatDate value="${bs.createTime}" type="both"></fmt:formatDate></td>
                                <td><fmt:formatDate value="${bs.updateTime}" type="both"></fmt:formatDate></td>
                                <td class="td-manage">
                                    <a title="编辑" onclick="xadmin.open('编辑','editBlog?id=${bs.id}',750)"
                                       href="javascript:;">
                                        <button class="layui-btn" value="编辑">编辑<i class="layui-icon">&#xe642;</i>
                                        </button>
                                    </a>
                                    <a title="删除" onclick="member_del(this,'${bs.id}')" href="javascript:;">
                                        <button class="layui-btn layui-btn-danger">删除<i class="layui-icon">&#xe640;</i>
                                        </button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="//res.layui.com/layui/dist/layui.js" charset="utf-8"></script>
</body>
<script>
    layui.use(['laydate', 'form'], function () {
        var laydate = layui.laydate;
        var form = layui.form;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });


    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $.ajax({
                url: "/admin/deleteBlog",
                data: {id: id},
                type: "post",
                success: function () {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                }
            });
            return false;
        });
    }
</script>

</html>
