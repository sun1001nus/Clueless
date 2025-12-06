<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品信息列表 - 商品管理系统</title>
    <!-- 引入Bootstrap 5 -->
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
            padding: 20px 0;
        }

        /* 容器样式 */
        .container {
            max-width: 1200px;
            margin: 0 auto;
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
            width: 100px;
            height: 3px;
            background: #0d6efd;
            border-radius: 3px;
        }

        /* 搜索框样式 - 修复版 */
        .search-form {
            display: flex;
            gap: 12px;
            margin-bottom: 30px;
            flex-wrap: wrap;
            align-items: center;
            padding: 15px 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
            border: 1px solid #e9ecef;
        }

        .search-input-wrapper {
            position: relative;
            flex: 0 1 300px; /* 限制最大宽度，确保按钮能放下 */
            min-width: 200px; /* 小屏幕最小宽度 */
        }

        .search-input {
            width: 100%;
            padding: 10px 15px 10px 40px;
            font-size: 14px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            transition: all 0.3s ease;
            background-color: #fff;
        }

        .search-input:focus {
            outline: none;
            border-color: #0d6efd;
            box-shadow: 0 0 0 4px rgba(13, 110, 253, 0.1);
        }

        .search-input::placeholder {
            color: #adb5bd;
            font-size: 13px;
        }

        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%); /* 修复图标垂直居中 */
            color: #adb5bd;
            font-size: 16px;
            z-index: 1;
        }

        /* 按钮容器 */
        .search-btn-group {
            display: flex;
            gap: 12px;
            flex-wrap: nowrap; /* 按钮不换行 */
        }

        .search-btn, .back-btn {
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            white-space: nowrap; /* 按钮文字不换行 */
        }

        .search-btn {
            background-color: #0d6efd;
            color: white;
        }

        .search-btn:hover {
            background-color: #0b5ed7;
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(13, 110, 253, 0.2);
        }

        .back-btn {
            background-color: #6c757d;
            color: white;
            text-decoration: none;
        }

        .back-btn:hover {
            background-color: #5c636a;
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(108, 117, 125, 0.2);
            color: white;
            text-decoration: none;
        }

        /* 表格样式 */
        .table-container {
            overflow-x: auto; /* 适配小屏幕横向滚动 */
            margin-bottom: 20px;
        }

        .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
            background: #fff;
        }

        .table thead {
            background-color: #0d6efd;
            color: white;
        }

        .table th {
            padding: 15px 12px;
            text-align: center;
            font-weight: 500;
            font-size: 14px;
            border: none;
        }

        .table td {
            padding: 12px 15px;
            text-align: center;
            font-size: 14px;
            border-color: #e9ecef;
            vertical-align: middle;
        }

        .table tbody tr {
            transition: background-color 0.3s ease;
        }

        .table tbody tr:hover {
            background-color: #f8f9fa;
        }

        /* 空数据提示 */
        .empty-tip {
            text-align: center;
            padding: 60px 20px;
            color: #6c757d;
            font-size: 16px;
        }

        .empty-tip i {
            font-size: 40px;
            margin-bottom: 15px;
            color: #adb5bd;
            display: block;
        }

        /* 分页样式 - 优化版 */
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
            margin: 20px 0;
            padding: 15px 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
            border: 1px solid #e9ecef;
        }

        .pagination-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 8px 14px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 500;
            color: #495057;
            background-color: #fff;
            border: 1px solid #e9ecef;
            text-decoration: none;
            transition: all 0.3s ease;
            gap: 4px;
        }

        .pagination-btn:hover:not(.disabled):not(.active) {
            border-color: #0d6efd;
            color: #0d6efd;
            transform: translateY(-1px);
        }

        .pagination-btn.active {
            background-color: #0d6efd;
            color: white;
            border-color: #0d6efd;
            box-shadow: 0 2px 6px rgba(13, 110, 253, 0.2);
        }

        .pagination-btn.disabled {
            color: #adb5bd;
            border-color: #e9ecef;
            cursor: not-allowed;
            background-color: #f8f9fa;
            transform: none !important;
        }

        .pagination-info {
            margin-left: 15px;
            font-size: 13px;
            color: #6c757d;
            white-space: nowrap;
        }

        /* 按钮样式 */
        .btn {
            padding: 6px 16px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .btn-sm {
            padding: 4px 12px;
            font-size: 12px;
        }

        .btn-primary {
            background-color: #0d6efd;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0b5ed7;
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(13, 110, 253, 0.2);
        }

        .btn-default {
            background-color: #6c757d;
            color: white;
        }

        .btn-default:hover {
            background-color: #5c636a;
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(108, 117, 125, 0.2);
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn-danger:hover {
            background-color: #bb2d3b;
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(220, 53, 69, 0.2);
        }

        /* 添加商品按钮行 */
        .add-row {
            background-color: #f8f9fa !important;
        }

        .add-row td {
            padding: 20px !important;
            border: none !important;
        }

        /* 提示弹窗样式优化 */
        .alert-modal {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 12px 20px;
            background-color: #d1e7dd;
            color: #157347;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(21, 115, 71, 0.15);
            z-index: 9999;
            display: none;
            align-items: center;
            gap: 8px;
            animation: slideIn 0.3s ease;
        }

        @keyframes slideIn {
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        @keyframes slideOut {
            from { transform: translateX(0); opacity: 1; }
            to { transform: translateX(100%); opacity: 0; }
        }

        /* 响应式适配 */
        @media (max-width: 768px) {
            .container {
                margin: 0 15px;
                padding: 20px;
            }

            .page-title {
                font-size: 18px;
            }

            .search-form {
                padding: 12px 15px;
            }

            .search-input-wrapper {
                flex: 1 1 100%; /* 小屏幕搜索框占满宽度 */
                margin-bottom: 8px;
            }

            .search-btn-group {
                flex: 1 1 100%;
                gap: 8px;
            }

            .search-btn, .back-btn {
                flex: 1; /* 小屏幕按钮平分宽度 */
                padding: 10px;
                justify-content: center;
            }

            .table td, .table th {
                padding: 10px 8px;
                font-size: 13px;
            }

            .btn {
                margin-bottom: 5px;
            }

            .pagination {
                gap: 5px;
                padding: 10px 15px;
            }

            .pagination-btn {
                padding: 6px 10px;
                font-size: 12px;
            }

            .pagination-info {
                margin-left: 0;
                margin-top: 10px;
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h3 class="page-title">商品信息列表</h3>

    <!-- 模糊查询表单 - 修复版（解决长度+图标+按钮问题） -->
    <div class="search-form">
        <!-- 搜索输入框 -->
        <div class="search-input-wrapper">
            <i class="fa fa-search search-icon"></i>
            <input type="text"
                   id="searchKeyword"
                   class="search-input"
                   placeholder="输入商品名/描述搜索"
                   value="${keyword}">
        </div>

        <!-- 按钮组（单独拆分，确保并排显示） -->
        <div class="search-btn-group">
            <button type="button" class="search-btn" onclick="submitSearch()">
                <i class="fa fa-search"></i> 搜索
            </button>

            <!-- 仅关键词非空时显示“返回全部商品”按钮 -->
            <c:if test="${not empty keyword}">
                <a href="${pageContext.request.contextPath}/Item/querylist" class="back-btn">
                    <i class="fa fa-refresh"></i> 返回全部商品
                </a>
            </c:if>
        </div>

        <!-- 隐藏的搜索表单（用于提交） -->
        <form id="searchForm" action="${pageContext.request.contextPath}/Item/search" method="get">
            <input type="hidden" name="keyword" id="hiddenKeyword" value="${keyword}">
            <input type="hidden" name="pageNum" value="1">
            <input type="hidden" name="pageSize" value="${pageInfo.pageSize != null ? pageInfo.pageSize : 10}">
        </form>
    </div>

    <!-- 商品列表展示区域 -->
    <div class="table-container">
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>序号</th>
                <th>商品名称</th>
                <th>商品价格</th>
                <th>商品详情</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <!-- 分页数据渲染 -->
            <c:choose>
                <c:when test="${not empty pageInfo and not empty pageInfo.list}">
                    <c:forEach items="${pageInfo.list}" var="item" varStatus="status">
                        <tr>
                            <!-- 序号：计算分页后的真实序号 -->
                            <td>${(pageInfo.pageNum - 1) * pageInfo.pageSize + status.count}</td>
                            <td>${item.name}</td>
                            <td>${item.price}</td>
                            <td>${item.details}</td>
                            <td>
                                <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/Item/Up?id=${item.id}">
                                    <i class="fa fa-pencil"></i> 修改
                                </a>
                                &nbsp;
                                <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/Item/DeleList?id=${item.id}">
                                    <i class="fa fa-trash"></i> 删除
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5" class="empty-tip">
                            <i class="fa fa-inbox"></i>
                                ${not empty keyword ? '未找到匹配的商品数据' : '暂无商品数据，点击下方按钮添加商品吧！'}
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>

            <!-- 添加商品按钮行 -->
            <tr class="add-row">
                <td colspan="5" align="center">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/Item/add">
                        <i class="fa fa-plus"></i> 添加商品
                    </a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <!-- 分页展示区域 -->
    <c:if test="${not empty pageInfo and pageInfo.pages > 0}">
        <div class="pagination">
            <!-- 首页 -->
            <a href="${pageContext.request.contextPath}/Item/${empty keyword ? 'querylist' : 'search'}?pageNum=1&pageSize=${pageInfo.pageSize}&keyword=${keyword}"
               class="pagination-btn ${pageInfo.pageNum == 1 ? 'disabled' : ''}">
                <i class="fa fa-angle-double-left"></i> 首页
            </a>
            <!-- 上一页 -->
            <a href="${pageContext.request.contextPath}/Item/${empty keyword ? 'querylist' : 'search'}?pageNum=${pageInfo.pageNum-1}&pageSize=${pageInfo.pageSize}&keyword=${keyword}"
               class="pagination-btn ${pageInfo.pageNum == 1 ? 'disabled' : ''}">
                <i class="fa fa-angle-left"></i> 上一页
            </a>

            <!-- 页码（显示当前页前后2页） -->
            <c:forEach begin="${pageInfo.pageNum-2 > 0 ? pageInfo.pageNum-2 : 1}"
                       end="${pageInfo.pageNum+2 < pageInfo.pages ? pageInfo.pageNum+2 : pageInfo.pages}"
                       var="i">
                <a href="${pageContext.request.contextPath}/Item/${empty keyword ? 'querylist' : 'search'}?pageNum=${i}&pageSize=${pageInfo.pageSize}&keyword=${keyword}"
                   class="pagination-btn ${i == pageInfo.pageNum ? 'active' : ''}">${i}</a>
            </c:forEach>

            <!-- 下一页 -->
            <a href="${pageContext.request.contextPath}/Item/${empty keyword ? 'querylist' : 'search'}?pageNum=${pageInfo.pageNum+1}&pageSize=${pageInfo.pageSize}&keyword=${keyword}"
               class="pagination-btn ${pageInfo.pageNum == pageInfo.pages ? 'disabled' : ''}">
                下一页 <i class="fa fa-angle-right"></i>
            </a>
            <!-- 尾页 -->
            <a href="${pageContext.request.contextPath}/Item/${empty keyword ? 'querylist' : 'search'}?pageNum=${pageInfo.pages}&pageSize=${pageInfo.pageSize}&keyword=${keyword}"
               class="pagination-btn ${pageInfo.pageNum == pageInfo.pages ? 'disabled' : ''}">
                尾页 <i class="fa fa-angle-double-right"></i>
            </a>

            <!-- 分页信息 -->
            <span class="pagination-info">共${pageInfo.total}条，第${pageInfo.pageNum}/${pageInfo.pages}页</span>
        </div>
    </c:if>
</div>

<!-- 提示弹窗 -->
<div class="alert-modal" id="alertModal">
    <i class="fa fa-info-circle"></i>
    <span id="alertText"></span>
</div>

<!-- 引入Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 优化提示弹窗（替换原生alert）
    window.onload = function() {
        var searchMsg = "${searchMsg}";
        if (searchMsg && searchMsg.trim() !== "") {
            const alertModal = document.getElementById('alertModal');
            const alertText = document.getElementById('alertText');
            alertText.textContent = searchMsg;
            alertModal.style.display = 'flex';

            // 3秒后自动关闭
            setTimeout(() => {
                alertModal.style.animation = 'slideOut 0.3s ease';
                setTimeout(() => {
                    alertModal.style.display = 'none';
                }, 300);
            }, 3000);
        }
    }

    // 搜索提交函数
    function submitSearch() {
        const keyword = document.getElementById('searchKeyword').value.trim();
        const hiddenKeyword = document.getElementById('hiddenKeyword');
        const searchForm = document.getElementById('searchForm');

        hiddenKeyword.value = keyword;
        searchForm.submit();
    }

    // 回车提交搜索
    document.getElementById('searchKeyword').addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            submitSearch();
        }
    });

    // 为删除按钮添加确认提示
    document.querySelectorAll('.btn-danger').forEach(btn => {
        btn.addEventListener('click', function(e) {
            if (!confirm('确定要删除该商品吗？删除后不可恢复！')) {
                e.preventDefault(); // 取消跳转
            }
        });
    });

    // 禁用分页按钮点击事件（避免无效跳转）
    document.querySelectorAll('.pagination-btn.disabled').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
        });
    });
</script>
</body>
</html>