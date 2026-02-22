<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Dashboard - Quản Lý Nhà Trọ</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/view/owner/assets/styles.css">
</head>

<body>

<!-- ===== SIDEBAR ===== -->
<!-- Sidebar -->
<div class="sidebar">
  <div class="sidebar-logo">
    <i class="bi bi-buildings"></i> Quản Lý Nhà Trọ
  </div>
  <ul class="nav-menu">
    <li class="nav-item" s>
      <a href="${pageContext.request.contextPath}/dashboard" class="nav-link active">
        <i class="bi bi-speedometer2"></i> Dashboard
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/rooms" class="nav-link ">
        <i class="bi bi-door-closed"></i> Phòng
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/bookings" class="nav-link">
        <i class="bi bi-calendar-check"></i> Đặt phòng
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/contracts" class="nav-link">
        <i class="bi bi-file-earmark-text"></i> Hợp đồng
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/utilities" class="nav-link">
        <i class="bi bi-lightning-fill"></i> Điện nước
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/invoices" class="nav-link">
        <i class="bi bi-receipt"></i> Hóa đơn
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/services" class="nav-link">
        <i class="bi bi-gear"></i> Dịch vụ
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/users" class="nav-link">
        <i class="bi bi-people"></i> Người dùng
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/reports" class="nav-link">
        <i class="bi bi-bar-chart"></i> Báo cáo
      </a>
    </li>
  </ul>
</div>

<!-- ===== MAIN ===== -->
<div class="main-wrapper">

  <!-- TOPBAR -->
  <div class="topbar">
    <div class="topbar-left">
      <div class="topbar-greeting">Chào mừng, Chủ trọ</div>
    </div>
    <div class="topbar-right">
      <a href="${pageContext.request.contextPath}/account?action=logout"
         class="btn btn-outline-danger btn-sm">Đăng xuất</a>
    </div>
  </div>

  <!-- ===== CONTENT ===== -->
  <div class="main-content">

    <h1 class="page-title mb-4">Tổng quan kinh doanh</h1>

    <!-- ===== KPI ===== -->
    <div class="kpi-container">

      <div class="kpi-card">
        <div class="kpi-label">Tổng số phòng</div>
        <div class="kpi-value">${totalRooms}</div>
      </div>

      <div class="kpi-card">
        <div class="kpi-label">Phòng trống</div>
        <div class="kpi-value text-warning">${availableRooms}</div>
      </div>

      <div class="kpi-card">
        <div class="kpi-label">Phòng đang thuê</div>
        <div class="kpi-value text-success">${rentedRooms}</div>
      </div>

      <div class="kpi-card">
        <div class="kpi-label">Đặt phòng chờ</div>
        <div class="kpi-value text-info">${pendingBookings}</div>
      </div>

      <div class="kpi-card">
        <div class="kpi-label">Hóa đơn chưa thu</div>
        <div class="kpi-value text-danger">${unpaidInvoices}</div>
      </div>

      <div class="kpi-card">
        <div class="kpi-label">Doanh thu tháng</div>
        <div class="kpi-value text-success">
          <fmt:formatNumber value="${monthlyRevenue}"
                            type="currency"
                            currencySymbol="₫"/>
        </div>
      </div>

    </div>

    <!-- ===== CHART PLACEHOLDER ===== -->
    <div class="card-custom mt-4">
      <div class="card-header">
        <h5 class="card-title">Doanh thu 6 tháng gần nhất</h5>
      </div>
      <div class="card-body text-center text-muted">
        📊 Biểu đồ sẽ được tích hợp ChartJS
      </div>
    </div>

    <!-- ===== NOTE ===== -->
    <div class="alert alert-info mt-4">
      ℹ️ Danh sách chi tiết đặt phòng và hóa đơn sẽ hiển thị
      khi bạn mở module quản lý tương ứng.
    </div>

  </div>
</div>

</body>
</html>
