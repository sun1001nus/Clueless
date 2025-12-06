<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <!-- 核心：0秒后自动跳转到登录请求（保留原有跳转逻辑） -->
    <meta http-equiv="refresh" content="2;url=${pageContext.request.contextPath}/user/toLogin">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>正在跳转 - 商品管理系统</title>
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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        /* 容器样式 */
        .redirect-container {
            text-align: center;
            padding: 50px 40px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            border: 1px solid #eee;
            max-width: 500px;
            width: 100%;
        }

        /* 图标样式 */
        .redirect-icon {
            font-size: 60px;
            color: #0d6efd;
            margin-bottom: 20px;
            animation: spin 1.5s linear infinite;
        }

        /* 加载动画 */
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* 标题样式 */
        .redirect-title {
            font-size: 22px;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 15px;
        }

        /* 描述文字 */
        .redirect-desc {
            color: #6c757d;
            font-size: 14px;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        /* 手动跳转链接样式 */
        .redirect-link {
            display: inline-block;
            padding: 10px 30px;
            background-color: #0d6efd;
            color: white !important;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(13, 110, 253, 0.1);
        }

        .redirect-link:hover {
            background-color: #0b5ed7;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(13, 110, 253, 0.2);
            text-decoration: none;
        }

        .redirect-link i {
            margin-right: 8px;
        }

        /* 响应式适配 */
        @media (max-width: 576px) {
            .redirect-container {
                padding: 30px 20px;
            }

            .redirect-icon {
                font-size: 40px;
            }

            .redirect-title {
                font-size: 18px;
            }

            .redirect-link {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<div class="redirect-container">
    <i class="fa fa-spinner redirect-icon"></i>
    <h3 class="redirect-title">正在跳转到登录页面...</h3>
    <p class="redirect-desc">
        若长时间未跳转，请点击下方按钮手动跳转
    </p>
    <!-- 备用手动跳转链接（保留原有路径） -->
    <a href="${pageContext.request.contextPath}/user/toLogin" class="redirect-link">
        <i class="fa fa-arrow-right"></i> 点击此处手动跳转
    </a>
</div>
</body>
</html>