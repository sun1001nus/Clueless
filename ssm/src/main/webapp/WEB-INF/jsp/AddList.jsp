<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加商品 - 商品管理系统</title>
    <!-- 引入Bootstrap 5（现代UI框架） -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 引入Font Awesome图标 -->
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        /* 全局样式重置与基础设置 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', 'Microsoft YaHei', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }

        /* 容器样式 */
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            border: 1px solid #eee;
        }

        /* 标题样式 */
        .page-title {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-weight: 600;
            position: relative;
            padding-bottom: 15px;
        }

        .page-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: #0d6efd;
            border-radius: 3px;
        }

        /* 表单组样式 */
        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #495057;
            font-weight: 500;
            font-size: 14px;
        }

        /* 输入框样式 */
        .form-control {
            width: 100%;
            padding: 12px 15px;
            font-size: 14px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            transition: all 0.3s ease;
            background-color: #fff;
        }

        .form-control:focus {
            outline: none;
            border-color: #0d6efd;
            box-shadow: 0 0 0 4px rgba(13, 110, 253, 0.1);
        }

        .form-control::placeholder {
            color: #adb5bd;
            font-size: 13px;
        }

        /* 按钮组样式 */
        .btn-group {
            text-align: center;
            margin-top: 30px;
        }

        .btn {
            padding: 10px 25px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            margin: 0 8px;
        }

        .btn-primary {
            background-color: #0d6efd;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0b5ed7;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(13, 110, 253, 0.2);
        }

        .btn-default {
            background-color: #6c757d;
            color: white;
        }

        .btn-default:hover {
            background-color: #5c636a;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(108, 117, 125, 0.2);
        }

        /* 响应式适配 */
        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            .btn {
                padding: 8px 20px;
                margin: 0 5px 10px;
                display: inline-block;
            }

            .page-title {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h3 class="page-title">添加商品</h3>
    <!-- 解决中文乱码：form添加accept-charset，action路径保持不变 -->
    <form action="${pageContext.request.contextPath}/Item/AddList" method="post" accept-charset="UTF-8">
        <div class="form-group">
            <label for="name"><i class="fa fa-tag"></i> 商品名称：</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="请输入商品名称">
        </div>

        <div class="form-group">
            <label for="price"><i class="fa fa-yen"></i> 商品价格：</label>
            <input type="text" class="form-control" id="price" name="price" placeholder="请输入商品价格">
        </div>

        <div class="form-group">
            <label for="details"><i class="fa fa-info-circle"></i> 商品详情：</label>
            <input type="text" class="form-control" id="details" name="details" placeholder="请输入商品详情">
        </div>

        <div class="btn-group">
            <button type="submit" class="btn btn-primary">
                <i class="fa fa-check"></i> 提交
            </button>
            <button type="reset" class="btn btn-default">
                <i class="fa fa-refresh"></i> 重置
            </button>
            <button type="button" onclick="history.go(-1)" class="btn btn-default">
                <i class="fa fa-arrow-left"></i> 返回
            </button>
        </div>
    </form>
</div>

<!-- 引入Bootstrap JS（增强交互） -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 可选：添加表单验证
    document.querySelector('form').addEventListener('submit', function(e) {
        const name = document.getElementById('name').value.trim();
        const price = document.getElementById('price').value.trim();
        const details = document.getElementById('details').value.trim();

        if (!name) {
            alert('请输入商品名称！');
            e.preventDefault();
            return false;
        }

        if (!price || isNaN(price)) {
            alert('请输入有效的商品价格！');
            e.preventDefault();
            return false;
        }

        if (!details) {
            alert('请输入商品详情！');
            e.preventDefault();
            return false;
        }
    });
</script>
</body>
</html>