<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard - Quản Lý Nhà Trọ</title>
  <c:import url="../layout/library.jsp"></c:import>
</head>
<body>
  <!-- Sidebar -->
  <c:import url="../layout/sidebar.jsp"></c:import>

  <!-- Main Wrapper -->
  <div class="main-wrapper">
    <!-- Top Navbar -->
    <c:import url="../layout/topbar.jsp"></c:import>

    <!-- Main Content -->
    <div class="main-content">
      <div class="breadcrumb-nav">
        <a href="#">Trang chủ</a> / <span>Dashboard</span>
      </div>

      <div class="page-header">
        <h1 class="page-title">Tổng Quan</h1>
      </div>

      <!-- KPI Cards -->
      <div class="kpi-container">
        <div class="kpi-card">
          <div class="kpi-label">Tổng số phòng</div>
          <div class="kpi-value">24</div>
          <div class="kpi-subtitle">Tất cả phòng</div>
        </div>
        <div class="kpi-card">
          <div class="kpi-label">Phòng trống</div>
          <div class="kpi-value" style="color: #f39c12;">5</div>
          <div class="kpi-subtitle">Sẵn sàng cho thuê</div>
        </div>
        <div class="kpi-card">
          <div class="kpi-label">Phòng đang thuê</div>
          <div class="kpi-value" style="color: #27ae60;">18</div>
          <div class="kpi-subtitle">Đã cho thuê</div>
        </div>
        <div class="kpi-card">
          <div class="kpi-label">Phòng đang đặt</div>
          <div class="kpi-value" style="color: #5dade2;">1</div>
          <div class="kpi-subtitle">Chờ xác nhận</div>
        </div>
        <div class="kpi-card">
          <div class="kpi-label">Hóa đơn chưa thu</div>
          <div class="kpi-value" style="color: #e74c3c;">3</div>
          <div class="kpi-subtitle">Cần xử lý</div>
        </div>
        <div class="kpi-card">
          <div class="kpi-label">Doanh thu tháng</div>
          <div class="kpi-value" style="color: #27ae60; font-size: 24px;">36.5M</div>
          <div class="kpi-subtitle">Đã thu (VND)</div>
        </div>
      </div>

      <!-- Chart Section -->
      <div class="card-custom">
        <div class="card-header">
          <h5 class="card-title">Doanh thu 6 tháng gần nhất</h5>
        </div>
        <div class="card-body">
          <div class="chart-placeholder">
            📊 Biểu đồ doanh thu 6 tháng (chế độ demo)
          </div>
        </div>
      </div>

      <!-- Two Section Row -->
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px; margin-top: 25px;">
        <!-- Pending Bookings -->
        <div class="card-custom">
          <div class="card-header">
            <h5 class="card-title">
              <i class="bi bi-calendar-check"></i> Đặt phòng chờ xử lý (Top 5)
            </h5>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table-custom">
                <thead>
                  <tr>
                    <th>Phòng</th>
                    <th>Khách</th>
                    <th>Ngày đặt</th>
                    <th>Hạn</th>
                    <th>Trạng thái</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><strong>P101</strong></td>
                    <td>Nguyễn Văn A</td>
                    <td>20/01/2025</td>
                    <td>27/01/2025</td>
                    <td><span class="badge-custom badge-info">Chờ</span></td>
                  </tr>
                  <tr>
                    <td><strong>P205</strong></td>
                    <td>Trần Thị B</td>
                    <td>19/01/2025</td>
                    <td>26/01/2025</td>
                    <td><span class="badge-custom badge-info">Chờ</span></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <!-- Unpaid Invoices -->
        <div class="card-custom">
          <div class="card-header">
            <h5 class="card-title">
              <i class="bi bi-receipt"></i> Hóa đơn chưa thu (Top 5)
            </h5>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table-custom">
                <thead>
                  <tr>
                    <th>Mã HĐ</th>
                    <th>Phòng</th>
                    <th>Tổng tiền</th>
                    <th>Kỳ</th>
                    <th>Thao tác</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><strong>HĐ001</strong></td>
                    <td>P101</td>
                    <td>3.5M VND</td>
                    <td>01/2025</td>
                    <td><a href="invoice-detail.jsp" class="btn-link-custom">Xem</a></td>
                  </tr>
                  <tr>
                    <td><strong>HĐ002</strong></td>
                    <td>P205</td>
                    <td>3.2M VND</td>
                    <td>01/2025</td>
                    <td><a href="invoice-detail.jsp" class="btn-link-custom">Xem</a></td>
                  </tr>
                  <tr>
                    <td><strong>HĐ003</strong></td>
                    <td>P301</td>
                    <td>4.1M VND</td>
                    <td>12/2024</td>
                    <td><a href="invoice-detail.jsp" class="btn-link-custom">Xem</a></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // Update active nav link
    document.querySelectorAll('.nav-link').forEach(link => {
      if (link.href === window.location.href) {
        link.classList.add('active');
      }
    });
  </script>
</body>
</html>
