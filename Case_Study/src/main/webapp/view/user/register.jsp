<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản - Quản Lý Nhà Trọ</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

    <style>
        body {
            background: linear-gradient(135deg, #5dade2, #2e86ab);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register-card {
            background: #fff;
            border-radius: 12px;
            padding: 35px 30px;
            width: 100%;
            max-width: 420px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
        }

        .register-title {
            text-align: center;
            margin-bottom: 25px;
        }

        .register-title h2 {
            font-weight: 700;
            color: #2e86ab;
        }

        .register-title p {
            font-size: 13px;
            color: #7f8c8d;
        }

        .form-control {
            font-size: 14px;
            padding: 10px 12px;
            border-radius: 6px;
        }

        .form-control:focus {
            border-color: #5dade2;
            box-shadow: 0 0 0 3px rgba(93, 173, 226, 0.15);
        }

        .btn-register {
            background: #5dade2;
            border: none;
            font-weight: 600;
            padding: 10px;
        }

        .btn-register:hover {
            background: #2e86ab;
        }
    </style>
</head>

<body>

<div class="register-card">

    <div class="register-title">
        <h2><i class="bi bi-person-plus-fill"></i> Đăng ký</h2>
        <p>Hệ thống quản lý nhà trọ</p>
    </div>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
    <div class="alert alert-danger text-center">
        <%= error %>
    </div>
    <% } %>

    <form action="${pageContext.request.contextPath}/register" method="post">

        <div class="mb-3">
            <input class="form-control" name="fullName" placeholder="Họ và tên" required>
        </div>

        <div class="mb-3">
            <input class="form-control" name="phone" placeholder="Số điện thoại" required>
        </div>

        <div class="mb-3">
            <input class="form-control" name="email" type="email" placeholder="Email" required>
        </div>

        <div class="mb-3">
            <input class="form-control" name="citizenId" placeholder="CCCD" required>
        </div>

        <div class="mb-3">
            <input class="form-control" name="address" placeholder="Địa chỉ" required>
        </div>

        <div class="mb-3">
            <input class="form-control" name="dob" type="date" required>
        </div>

        <div class="mb-4">
            <input class="form-control" name="password" type="password" placeholder="Mật khẩu" required>
        </div>

        <button type="submit" class="btn btn-register w-100">
            Đăng ký
        </button>

    </form>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
