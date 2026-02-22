<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #5dade2, #2e86ab);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .card {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0,0,0,.2);
        }
    </style>
</head>
<body>

<div class="card">
    <h4 class="text-center mb-4">Quên mật khẩu</h4>

    <% String error = (String) request.getAttribute("error"); %>
    <% String success = (String) request.getAttribute("success"); %>

    <% if (error != null) { %>
    <div class="alert alert-danger text-center"><%= error %></div>
    <% } %>

    <% if (success != null) { %>
    <div class="alert alert-success text-center"><%= success %></div>
    <% } %>

    <form action="${pageContext.request.contextPath}/forgot" method="post">
        <div class="mb-3">
            <input class="form-control" name="phone" placeholder="Số điện thoại" required>
        </div>

        <div class="mb-3">
            <input class="form-control" type="password" name="newPassword" placeholder="Mật khẩu mới" required>
        </div>

        <button class="btn btn-primary w-100">Đổi mật khẩu</button>
    </form>
</div>

</body>
</html>
