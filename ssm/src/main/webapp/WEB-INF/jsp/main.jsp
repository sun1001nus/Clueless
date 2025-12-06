<%--
  Created by IntelliJ IDEA.
  User: 孙国庆
  Date: 2025/11/30
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品管理系统 - 首页</title>
    <!-- 引入Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 引入Font Awesome图标 -->
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        /* 全局样式重置 */
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
            overflow-x: hidden;
        }

        /* 左侧导航栏样式 */
        .sidebar {
            width: 240px;
            height: 100vh;
            background-color: #2c3e50;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 999;
            transition: all 0.3s ease;
            overflow-y: auto;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
        }

        /* 导航栏头部 */
        .sidebar-header {
            padding: 20px;
            text-align: center;
            border-bottom: 1px solid #34495e;
            background-color: #1a2533;
        }

        .sidebar-header h3 {
            font-size: 18px;
            font-weight: 600;
            margin: 0;
        }

        /* 导航菜单 */
        .sidebar-menu {
            padding: 20px 0;
        }

        .menu-item {
            list-style: none;
            margin-bottom: 5px;
        }

        .menu-link {
            display: block;
            padding: 12px 20px;
            color: #bdc3c7;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s ease;
            border-left: 3px solid transparent;
        }

        .menu-link:hover, .menu-link.active {
            background-color: #34495e;
            color: white;
            border-left-color: #0d6efd;
            text-decoration: none;
        }

        .menu-link i {
            margin-right: 10px;
            width: 16px;
            text-align: center;
        }

        /* 右侧内容区域 */
        .content-wrapper {
            flex: 1;
            margin-left: 240px;
            padding: 20px;
            min-height: 100vh;
            transition: all 0.3s ease;
        }

        /* 内容容器（统一样式） */
        .content-container {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            border: 1px solid #eee;
            padding: 30px;
            min-height: calc(100vh - 40px);
        }

        /* 首页内容样式 */
        .home-content {
            text-align: center;
            padding: 50px 0;
        }

        .home-title {
            color: #2c3e50;
            margin-bottom: 40px;
            font-weight: 600;
            font-size: 24px;
            position: relative;
            padding-bottom: 15px;
            display: inline-block;
        }

        .home-title::after {
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

        /* 首页按钮样式 */
        .list-link {
            display: inline-block;
            padding: 12px 40px;
            background-color: #0d6efd;
            color: white !important;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            box-shadow: 0 2px 8px rgba(13, 110, 253, 0.1);
        }

        .list-link:hover {
            background-color: #0b5ed7;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(13, 110, 253, 0.2);
            text-decoration: none;
        }

        .list-link i {
            margin-right: 8px;
        }

        /* 响应式适配（移动端折叠导航） */
        .sidebar-toggle {
            display: none;
            position: fixed;
            top: 15px;
            left: 15px;
            z-index: 1000;
            width: 40px;
            height: 40px;
            background-color: #2c3e50;
            color: white;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-size: 18px;
        }

        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
                width: 200px;
            }

            .sidebar.show {
                transform: translateX(0);
            }

            .content-wrapper {
                margin-left: 0;
                padding: 15px;
            }

            .content-container {
                padding: 20px;
                min-height: calc(100vh - 30px);
            }

            .sidebar-toggle {
                display: block;
            }

            .home-title {
                font-size: 20px;
            }

            .list-link {
                padding: 10px 30px;
                font-size: 14px;
                width: 100%;
            }
        }
    </style>
</head>
<body>
<!-- 移动端导航切换按钮 -->
<button class="sidebar-toggle" id="sidebarToggle">
    <i class="fa fa-bars"></i>
</button>

<!-- 左侧导航栏 -->
<div class="sidebar" id="sidebar">
    <div class="sidebar-header">
        <h3><i class="fa fa-cubes"></i> 商品管理系统</h3>
    </div>
    <ul class="sidebar-menu">
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/Main/mainindex" class="menu-link" target="contentFrame">
                <i class="fa fa-list-alt"></i> 首页
            </a>
        </li>
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/Item/querylist" class="menu-link" target="contentFrame">
                <i class="fa fa-list-alt"></i> 商品列表
            </a>
        </li>
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/Item/add" class="menu-link" target="contentFrame">
                <i class="fa fa-plus-circle"></i> 添加商品
            </a>
        </li>
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/user/manage" class="menu-link" target="contentFrame">
                <i class="fa fa-sign-in"></i> 用户管理
            </a>
        </li>
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/user/hong" class="menu-link" target="contentFrame">
                <i class="fa fa-user-plus"></i> 用户须知
            </a>
        </li>
    </ul>
</div>

<!-- 右侧内容区域 -->
<div class="content-wrapper">
    <!-- 核心：iframe容器，所有页面跳转都在这个iframe中显示 -->
    <iframe name="contentFrame" id="contentFrame"
            class="content-container"
            frameborder="0"
            width="100%"
            height="100%">
    </iframe>
</div>

<!-- 引入Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 页面加载时，iframe默认显示首页内容
    window.onload = function() {
        const contentFrame = document.getElementById('contentFrame');
        // 设置iframe默认页面为首页内容
        contentFrame.src = "${pageContext.request.contextPath}/Main/home";

        // 移动端导航切换逻辑
        const sidebarToggle = document.getElementById('sidebarToggle');
        const sidebar = document.getElementById('sidebar');

        sidebarToggle.addEventListener('click', function() {
            sidebar.classList.toggle('show');
        });

        // 导航菜单点击高亮
        const menuLinks = document.querySelectorAll('.menu-link');
        menuLinks.forEach(link => {
            link.addEventListener('click', function() {
                // 移除所有active类
                menuLinks.forEach(item => item.classList.remove('active'));
                // 给当前点击的添加active类
                this.classList.add('active');

                // 移动端点击菜单后自动关闭导航
                if (window.innerWidth <= 768) {
                    sidebar.classList.remove('show');
                }
            });
        });
    }
</script>
</body>
</html>