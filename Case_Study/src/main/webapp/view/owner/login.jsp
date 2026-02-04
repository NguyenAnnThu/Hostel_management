<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng nhập - Quản Lý Nhà Trọ</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
  <link rel="stylesheet" href="assets/styles.css">
  <style>
    .login-container {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      background: linear-gradient(135deg, #5dade2 0%, #2e86ab 100%);
    }
    .login-card {
      background: white;
      border-radius: 12px;
      padding: 40px;
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
      max-width: 400px;
      width: 100%;
    }
    .login-logo {
      text-align: center;
      margin-bottom: 30px;
    }
    .login-logo h2 {
      color: #2e86ab;
      font-weight: 700;
      font-size: 24px;
      margin: 0;
    }
    .login-logo p {
      color: #7f8c8d;
      font-size: 13px;
      margin-top: 5px;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .form-label {
      font-size: 13px;
      font-weight: 600;
      color: #2c3e50;
      margin-bottom: 8px;
      display: block;
    }
    .form-control {
      padding: 10px 12px;
      border: 1px solid #d4e6f1;
      border-radius: 6px;
      font-size: 13px;
      transition: all 0.3s ease;
    }
    .form-control:focus {
      outline: none;
      border-color: #5dade2;
      box-shadow: 0 0 0 3px rgba(93, 173, 226, 0.1);
    }
    .btn-login {
      width: 100%;
      padding: 10px;
      background-color: #5dade2;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 14px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      margin-bottom: 20px;
    }
    .btn-login:hover {
      background-color: #2e86ab;
      box-shadow: 0 4px 16px rgba(93, 173, 226, 0.3);
    }
    .login-note {
      background-color: #f5f9ff;
      border-left: 3px solid #5dade2;
      padding: 12px;
      border-radius: 4px;
      font-size: 12px;
      color: #2e86ab;
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <div class="login-card">
      <div class="login-logo">
        <h2><i class="bi bi-buildings"></i> Quản Lý Nhà Trọ</h2>
        <p>Hệ thống quản lý nhà trọ hiện đại</p>
      </div>

      <form id="loginForm">
        <div class="form-group">
          <label class="form-label">Số điện thoại</label>
          <input type="tel" class="form-control" id="phone" placeholder="Nhập số điện thoại" required>
        </div>

        <div class="form-group">
          <label class="form-label">Mật khẩu</label>
          <input type="password" class="form-control" id="password" placeholder="Nhập mật khẩu" required>
        </div>

        <button type="submit" class="btn-login">Đăng nhập</button>
      </form>

      <div class="login-note">
        <i class="bi bi-info-circle"></i> UI demo — chưa kết nối backend
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    document.getElementById('loginForm').addEventListener('submit', function(e) {
      e.preventDefault();
      // Demo login - just redirect to dashboard
      window.location.href = 'dashboard.jsp';
    });
  </script>
</body>
</html>
