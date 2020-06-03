<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>添加分类</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<%--    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />--%>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>

</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="category" class="layui-form-label">
                    <span class="x-red">*</span>分类名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="category" name="category" required="" autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                </div></div>

            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" lay-submit="">添加</button></div>
        </form>
    </div>
</div>

<script>
    layui.use(['form', 'layer','jquery'],
    function() {

        var form = layui.form,
            layer = layui.layer;

        //监听提交
        form.on('submit(add)',
            function(data) {
                var name = $("#category").val();
                if(null == name || "" == name){
                    layer.alert("请输入分类名称！");
                    return false;
                }
                $.ajax({
                   url:"isExit",
                   type:"post",
                   data:{category:name},
                   success:function (data) {
                       if(data == "success") {
                           $.ajax({
                               url: "/admin/addCategory",
                               type: "post",
                               data: {category: name},
                               success: function () {
                                   layer.alert("添加成功", {icon: 6}, function () {
                                       xadmin.close();
                                       xadmin.father_reload();
                                   });
                               }

                           });
                       }else{
                           layer.alert("分类已存在!");
                       }
                   }

                });

            return false;
            });

    });
</script>

</body>

</html>
