<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户注册 - 商品管理系统</title>
    <%-- 保留原有自动跳转逻辑：注册成功1秒后跳登录页 --%>
    <% if (request.getAttribute("successMsg") != null) { %>
    <meta http-equiv="refresh" content="1;url=${pageContext.request.contextPath}/user/toLogin">
    <% } %>
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
            justify-content: center;
            align-items: center;
            padding: 20px 0;
        }

        /* 注册容器样式 */
        .register-container {
            max-width: 450px;
            width: 90%;
            padding: 40px 30px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            border: 1px solid #eee;
        }

        /* 标题样式 */
        .register-title {
            text-align: center;
            color: #2c3e50;
            font-weight: 600;
            font-size: 24px;
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 15px;
        }

        .register-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 70px;
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
            padding: 12px 15px 12px 40px;
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

        /* 输入框图标 */
        .input-icon {
            position: absolute;
            left: 15px;
            top: 38px;
            color: #adb5bd;
            font-size: 16px;
        }

        /* 提示信息样式 */
        .msg-box {
            font-size: 13px;
            margin-top: 8px;
            padding: 8px 12px;
            border-radius: 6px;
            display: none;
        }

        /* 错误提示 */
        .error-msg {
            color: #dc3545;
            background-color: #f8d7da;
            border-left: 3px solid #dc3545;
            display: ${empty msg ? 'none' : 'block'};
        }

        /* 成功提示 */
        .success-msg {
            color: #198754;
            background-color: #d1e7dd;
            border-left: 3px solid #198754;
            display: ${empty successMsg ? 'none' : 'block'};
            text-align: center;
            margin-bottom: 15px;
            font-weight: 500;
        }

        /* 按钮样式 */
        .btn {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            margin-bottom: 15px;
        }

        .btn-register {
            background-color: #0d6efd;
            color: white;
        }

        .btn-register:hover {
            background-color: #0b5ed7;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(13, 110, 253, 0.2);
        }

        /* 登录链接按钮 */
        .login-link {
            background-color: #6c757d;
            color: white !important;
            text-decoration: none;
            display: block;
            text-align: center;
            padding: 12px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .login-link:hover {
            background-color: #5c636a;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(108, 117, 125, 0.2);
            color: white;
            text-decoration: none;
        }

        /* 响应式适配 */
        @media (max-width: 576px) {
            .register-container {
                padding: 30px 20px;
            }

            .register-title {
                font-size: 20px;
            }

            .form-control {
                padding: 10px 15px 10px 35px;
            }

            .input-icon {
                font-size: 14px;
                top: 36px;
            }
        }
    </style>
</head>
<body>
<div class="register-container">
    <h3 class="register-title">用户注册</h3>

    <!-- 注册成功提示（优先显示） -->
    <div class="msg-box success-msg">
        <i class="fa fa-check-circle"></i> ${successMsg}
    </div>

    <form action="${pageContext.request.contextPath}/user/register" method="post" accept-charset="UTF-8">
        <!-- 用户名输入框 -->
        <div class="form-group">
            <label for="username"><i class="fa fa-user"></i> 用户名</label>
            <i class="fa fa-user input-icon"></i>
            <input type="text" class="form-control" id="username" name="username" required
                   placeholder="请输入用户名（3-16位字母/数字）">
        </div>

        <!-- 密码输入框 -->
        <div class="form-group">
            <label for="password"><i class="fa fa-lock"></i> 密码</label>
            <i class="fa fa-lock input-icon"></i>
            <input type="password" class="form-control" id="password" name="password" required
                   placeholder="请输入密码（6-18位）">
        </div>

        <!-- 邮箱输入框 -->
        <div class="form-group">
            <label for="email"><i class="fa fa-envelope"></i> 邮箱</label>
            <i class="fa fa-envelope input-icon"></i>
            <input type="email" class="form-control" id="email" name="email"
                   placeholder="请输入邮箱（选填）">
        </div>

        <!-- 错误提示 -->
        <div class="msg-box error-msg">
            <i class="fa fa-exclamation-circle"></i> ${msg}
        </div>

        <!-- 注册按钮 -->
        <button type="submit" class="btn btn-register">
            <i class="fa fa-user-plus"></i> 注册
        </button>
    </form>

    <!-- 登录链接 -->
    <a href="${pageContext.request.contextPath}/user/toLogin" class="login-link">
        <i class="fa fa-sign-in"></i> 已有账号？去登录
    </a>
</div>
</body>
</html>