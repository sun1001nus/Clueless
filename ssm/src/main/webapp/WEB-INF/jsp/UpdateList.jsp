<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改商品 - 商品管理系统</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
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

        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            border: 1px solid #eee;
        }

        .page-title {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-weight: 600;
            font-size: 22px;
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

        /* 字段行样式：一行两栏 */
        .field-row {
            display: flex;
            gap: 20px;
            margin-bottom: 25px;
            flex-wrap: wrap; /* 移动端自动换行 */
        }

        .field-col {
            flex: 1;
            min-width: 300px; /* 小屏幕最小宽度 */
        }

        .field-col label {
            display: block;
            margin-bottom: 8px;
            color: #495057;
            font-weight: 500;
            font-size: 14px;
        }

        /* 原数据只读框样式 */
        .original-value {
            width: 100%;
            padding: 12px 15px;
            font-size: 14px;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            background-color: #f8f9fa;
            color: #6c757d;
            cursor: not-allowed;
        }

        /* 修改内容输入框样式 */
        .form-control {
            width: 100%;
            padding: 12px 15px;
            font-size: 14px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: #0d6efd;
            box-shadow: 0 0 0 4px rgba(13, 110, 253, 0.1);
        }

        .form-hidden {
            position: absolute;
            opacity: 0;
            pointer-events: none;
        }

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

        .btn-secondary {
            background-color: #adb5bd;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #9ca3af;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(173, 181, 189, 0.2);
        }

        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            .page-title {
                font-size: 18px;
            }

            .btn {
                padding: 8px 20px;
                margin: 0 5px 10px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h3 class="page-title">修改商品信息</h3>

    <form action="${pageContext.request.contextPath}/Item/UpList" method="post" accept-charset="UTF-8">
        <input type="hidden" name="id" value="${item.id}" class="form-hidden">

        <!-- 商品名称：原数据 + 修改栏 -->
        <div class="field-row">
            <div class="field-col">
                <label for="original-name"><i class="fa fa-tag"></i> 原商品名称：</label>
                <input type="text" class="original-value" id="original-name" value="${item.name}" readonly>
            </div>
            <div class="field-col">
                <label for="new-name">新商品名称：</label>
                <input type="text" class="form-control" id="new-name" name="name"
                       placeholder="请输入新商品名称">
            </div>
        </div>

        <!-- 商品价格：原数据 + 修改栏 -->
        <div class="field-row">
            <div class="field-col">
                <label for="original-price"><i class="fa fa-yen"></i> 原商品价格：</label>
                <input type="text" class="original-value" id="original-price" value="${item.price}" readonly>
            </div>
            <div class="field-col">
                <label for="new-price">新商品价格：</label>
                <input type="text" class="form-control" id="new-price" name="price"
                       placeholder="请输入新商品价格">
            </div>
        </div>

        <!-- 商品详情：原数据 + 修改栏 -->
        <div class="field-row">
            <div class="field-col">
                <label for="original-details"><i class="fa fa-info-circle"></i> 原商品详情：</label>
                <input type="text" class="original-value" id="original-details" value="${item.details}" readonly>
            </div>
            <div class="field-col">
                <label for="new-details">新商品详情：</label>
                <input type="text" class="form-control" id="new-details" name="details"
                       placeholder="请输入新商品详情">
            </div>
        </div>

        <div class="btn-group">
            <button type="submit" class="btn btn-primary">
                <i class="fa fa-save"></i> 提交修改
            </button>
            <button type="reset" class="btn btn-secondary">
                <i class="fa fa-refresh"></i> 重置
            </button>
            <button type="button" onclick="history.go(-1)" class="btn btn-default">
                <i class="fa fa-arrow-left"></i> 返回
            </button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.querySelector('form').addEventListener('submit', function(e) {
        const name = document.getElementById('new-name').value.trim();
        const price = document.getElementById('new-price').value.trim();
        const details = document.getElementById('new-details').value.trim();

        if (!name) {
            alert('请输入新商品名称！');
            e.preventDefault();
            document.getElementById('new-name').focus();
            return false;
        }

        if (!price || isNaN(price) || parseFloat(price) < 0) {
            alert('请输入有效的新商品价格（非负数数字）！');
            e.preventDefault();
            document.getElementById('new-price').focus();
            return false;
        }

        if (!details) {
            alert('请输入新商品详情！');
            e.preventDefault();
            document.getElementById('new-details').focus();
            return false;
        }

        if (!confirm('确定要保存修改后的商品信息吗？')) {
            e.preventDefault();
            return false;
        }
    });
</script>
</body>
</html>