<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>编辑博客</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/markdown/css/editormd.min.css">
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/markdown/editormd.min.js"></script>
    <script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>

</head>
<body>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form method="post" action="" enctype="multipart/form-data">
                        <div>
                            <label for="blog_title" class="x-red">博客标题：</label>
                            <input class="layui-input" type="text" id="blog_title" name="title" style="width:400px;"
                                   value="${blog.title}">
                            <label for="category_id" class="x-red">博客分类：</label><br>
                            <select class="layui-select" id="category_id" name="category.catetoryName"
                                    style="width:200px;">
                                <c:forEach items="${categories}" var="cs">
                                    <option value="${cs.id}">${cs.categoryName}</option>
                                </c:forEach>
                            </select>
                            <br> <br>
                            <div id="m-markdown">
                                <textarea id="content" name="content" style="display:none;">${blog.content}</textarea>
                            </div>
                        </div>
                        <div class="layui-card-body">
                            <button class="layui-btn" lay-filter="edit" lay-submit>确认修改</button>
                        </div>
                    </form>
                </div>


            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    layui.use(['form', 'layer', 'jquery'],
        function () {
            var $ = jQuery = layui.$;
            var form = layui.form,
                layer = layui.layer;

            var testEditor;

            $(function () {
                testEditor = editormd("m-markdown", {
                    width: "100%",
                    height: 300,
                    syncScrolling: "single",
                    path: "/markdown/lib/"
                });

            });

            //监听提交
            form.on('submit(edit)',
                function (data) {
                    var title = $("#blog_title").val();
                    var category_id = $("#category_id").val();
                    var content = $("#content").val();


                    console.log(category_id);
                    if (title == null || title == '') {
                        layer.alert("标题不能为空");
                        return false;
                    }
                    if (category_id == null || category_id == '') {
                        layer.alert("分类不能为空");
                        return false;
                    }
                    if (content == null || content == '') {
                        layer.alert("内容不能为空");
                        return false;
                    }
                    $.ajax({
                        url: "/admin/updateBlog",
                        type: "post",
                        data: {id:${blog.id}, title: title, categoryId: category_id, content: content},
                        success: function (data) {
                            layer.alert("修改成功！", {icon: 6}, function () {
                                xadmin.close();
                                xadmin.father_reload();
                            });
                        }

                    });
                    return false;
                });

        });
</script>

</body>

</html>
