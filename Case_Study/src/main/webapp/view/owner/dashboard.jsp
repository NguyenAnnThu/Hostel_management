<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard - Quản Lý Nhà Trọ</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
  <link rel="stylesheet" href="assets/styles.css">
</head>
<body>
  <!-- Sidebar -->
  <div class="sidebar">
    <div class="sidebar-logo">
      <i class="bi bi-buildings"></i> Quản Lý Nhà Trọ
    </div>
    <ul class="nav-menu">
      <li class="nav-item">
        <a href="dashboard.jsp" class="nav-link active">
          <i class="bi bi-speedometer2"></i> Dashboard
        </a>
      </li>
      <li class="nav-item">
        <a href="rooms.jsp" class="nav-link">
          <i class="bi bi-door-closed"></i> Phòng
        </a>
      </li>
      <li class="nav-item">
        <a href="bookings.jsp" class="nav-link">
          <i class="bi bi-calendar-check"></i> Đặt phòng
        </a>
      </li>
      <li class="nav-item">
        <a href="contracts.jsp" class="nav-link">
          <i class="bi bi-file-earmark-text"></i> Hợp đồng
        </a>
      </li>
      <li class="nav-item">
        <a href="utilities.jsp" class="nav-link">
          <i class="bi bi-lightning-fill"></i> Điện nước
        </a>
      </li>
      <li class="nav-item">
        <a href="invoices.jsp" class="nav-link">
          <i class="bi bi-receipt"></i> Hóa đơn
        </a>
      </li>
      <li class="nav-item">
        <a href="services.jsp" class="nav-link">
          <i class="bi bi-gear"></i> Dịch vụ
        </a>
      </li>
      <li class="nav-item">
        <a href="users.jsp" class="nav-link">
          <i class="bi bi-people"></i> Người dùng
        </a>
      </li>
      <li class="nav-item">
        <a href="reports.jsp" class="nav-link">
          <i class="bi bi-bar-chart"></i> Báo cáo
        </a>
      </li>
    </ul>
  </div>

  <!-- Main Wrapper -->
  <div class="main-wrapper">
    <!-- Top Navbar -->
    <div class="topbar">
      <div class="topbar-left">
        <div class="topbar-greeting">Chào mừng, Chủ trọ</div>
        <div class="topbar-search">
          <i class="bi bi-search"></i>
          <input type="text" placeholder="Tìm kiếm...">
        </div>
      </div>
      <div class="topbar-right">
        <div class="profile-dropdown">
          <button class="profile-btn" onclick="toggleProfileMenu()">
            <div class="profile-avatar">CT</div>
            <span>Chủ trọ</span>
            <i class="bi bi-chevron-down"></i>
          </button>
          <div class="dropdown-menu-custom" id="profileMenu">
            <div class="dropdown-item-custom">Hồ sơ cá nhân</div>
            <div class="dropdown-item-custom">Cài đặt</div>
            <div class="dropdown-item-custom" onclick="logout()">Đăng xuất</div>
          </div>
        </div>
      </div>
    </div>

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
    function toggleProfileMenu() {
      const menu = document.getElementById('profileMenu');
      menu.classList.toggle('show');
    }

    function logout() {
      window.location.href = 'login.jsp';
    }

    // Close menu when clicking outside
    document.addEventListener('click', function(event) {
      const menu = document.getElementById('profileMenu');
      const btn = document.querySelector('.profile-btn');
      if (!menu.contains(event.target) && !btn.contains(event.target)) {
        menu.classList.remove('show');
      }
    });

    // Update active nav link
    document.querySelectorAll('.nav-link').forEach(link => {
      if (link.href === window.location.href) {
        link.classList.add('active');
      }
    });
  </script>
</body>
</html>
