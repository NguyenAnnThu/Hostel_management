<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Báo cáo - Quản Lý Nhà Trọ</title>
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
        <a href="dashboard.jsp" class="nav-link">
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
        <a href="${pageContext.request.contextPath}/contract" class="nav-link">
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
        <a href="reports.jsp" class="nav-link active">
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
        <a href="dashboard.jsp">Trang chủ</a> / <span>Báo cáo doanh thu</span>
      </div>

      <div class="page-header">
        <h1 class="page-title">Báo cáo Doanh thu</h1>
      </div>

      <!-- Filters -->
      <div class="filter-section">
        <div class="filter-group">
          <label>Theo tháng</label>
          <input type="month" class="form-control" value="2025-01">
        </div>
        <div class="filter-group">
          <label>Theo năm</label>
          <select class="form-control">
            <option>2023</option>
            <option>2024</option>
            <option selected>2025</option>
          </select>
        </div>
        <div class="filter-group">
          <label>Theo phòng</label>
          <select id="roomFilter" class="form-control">
            <option value="">-- Tất cả phòng --</option>
            <option value="P101">P101</option>
            <option value="P102">P102</option>
            <option value="P201">P201</option>
            <option value="P205">P205</option>
            <option value="P301">P301</option>
          </select>
        </div>
        <div class="filter-actions">
          <button class="btn-custom btn-primary-custom">
            <i class="bi bi-funnel"></i> Lọc
          </button>
          <button class="btn-custom btn-outline" onclick="exportReport()">
            <i class="bi bi-download"></i> Xuất Excel
          </button>
        </div>
      </div>

      <!-- Note -->
      <div style="background-color: #e8f4ff; border-left: 4px solid #5dade2; padding: 15px; border-radius: 6px; margin-bottom: 25px;">
        <p style="margin: 0; font-size: 13px; color: #2e86ab;">
          <strong>💡 Lưu ý:</strong> Doanh thu chỉ tính hóa đơn đã thu (status = 'đã thu').
        </p>
      </div>

      <!-- KPI Cards -->
      <div class="kpi-container">
        <div class="kpi-card">
          <div class="kpi-label">Doanh thu (đã thu)</div>
          <div class="kpi-value" style="color: #27ae60;">182.5M</div>
          <div class="kpi-subtitle">Tổng kỳ vừa rồi</div>
        </div>
        <div class="kpi-card">
          <div class="kpi-label">Số hóa đơn đã thu</div>
          <div class="kpi-value" style="color: #5dade2;">52</div>
          <div class="kpi-subtitle">Cùng kỳ</div>
        </div>
        <div class="kpi-card">
          <div class="kpi-label">Tỷ lệ thu</div>
          <div class="kpi-value" style="color: #f39c12;">94.5%</div>
          <div class="kpi-subtitle">Hóa đơn được thanh toán</div>
        </div>
      </div>

      <!-- Tables Row -->
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px;">
        <!-- Monthly Revenue -->
        <div class="card-custom">
          <div class="card-header">
            <h5 class="card-title">Doanh thu Theo tháng (2025)</h5>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table-custom">
                <thead>
                  <tr>
                    <th>Tháng</th>
                    <th>Doanh thu (VND)</th>
                    <th>HĐ đã thu</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>01/2025</td>
                    <td>18.25M</td>
                    <td>5</td>
                  </tr>
                  <tr>
                    <td>12/2024</td>
                    <td>18.1M</td>
                    <td>5</td>
                  </tr>
                  <tr>
                    <td>11/2024</td>
                    <td>17.9M</td>
                    <td>5</td>
                  </tr>
                  <tr>
                    <td>10/2024</td>
                    <td>18.5M</td>
                    <td>5</td>
                  </tr>
                  <tr>
                    <td>09/2024</td>
                    <td>17.8M</td>
                    <td>5</td>
                  </tr>
                  <tr>
                    <td>08/2024</td>
                    <td>18.3M</td>
                    <td>5</td>
                  </tr>
                  <tr>
                    <td>07/2024</td>
                    <td>19.0M</td>
                    <td>6</td>
                  </tr>
                  <tr>
                    <td>06/2024</td>
                    <td>17.6M</td>
                    <td>5</td>
                  </tr>
                  <tr>
                    <td>05/2024</td>
                    <td>18.2M</td>
                    <td>5</td>
                  </tr>
                  <tr>
                    <td>04/2024</td>
                    <td>17.9M</td>
                    <td>5</td>
                  </tr>
                  <tr>
                    <td>03/2024</td>
                    <td>18.1M</td>
                    <td>5</td>
                  </tr>
                  <tr>
                    <td>02/2024</td>
                    <td>18.0M</td>
                    <td>5</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <!-- Revenue by Room -->
        <div class="card-custom">
          <div class="card-header">
            <h5 class="card-title">Doanh thu Theo phòng (01/2025)</h5>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table-custom">
                <thead>
                  <tr>
                    <th>Phòng</th>
                    <th>Tổng tiền (VND)</th>
                    <th>Trạng thái</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><strong>P101</strong></td>
                    <td>3,900,000</td>
                    <td><span class="badge-custom badge-success">Đã thu</span></td>
                  </tr>
                  <tr>
                    <td><strong>P102</strong></td>
                    <td>2,800,000</td>
                    <td><span class="badge-custom badge-success">Đã thu</span></td>
                  </tr>
                  <tr>
                    <td><strong>P201</strong></td>
                    <td>4,200,000</td>
                    <td><span class="badge-custom badge-success">Đã thu</span></td>
                  </tr>
                  <tr>
                    <td><strong>P205</strong></td>
                    <td>4,100,000</td>
                    <td><span class="badge-custom badge-info">Chưa thu</span></td>
                  </tr>
                  <tr>
                    <td><strong>P301</strong></td>
                    <td>3,250,000</td>
                    <td><span class="badge-custom badge-info">Chưa thu</span></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>

      <!-- Summary Chart -->
      <div class="card-custom" style="margin-top: 25px;">
        <div class="card-header">
          <h5 class="card-title">Xu hướng Doanh thu (6 tháng gần nhất)</h5>
        </div>
        <div class="card-body">
          <div class="chart-placeholder">
            📊 Biểu đồ doanh thu 6 tháng - 08/2024 đến 01/2025 (chế độ demo)
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function exportReport() {
      alert('Báo cáo đã được xuất thành tập tin Excel!');
    }

    function toggleProfileMenu() {
      const menu = document.getElementById('profileMenu');
      menu.classList.toggle('show');
    }

    function logout() {
      window.location.href = 'login.jsp';
    }

    document.addEventListener('click', function(event) {
      const menu = document.getElementById('profileMenu');
      const btn = document.querySelector('.profile-btn');
      if (menu && btn && !menu.contains(event.target) && !btn.contains(event.target)) {
        menu.classList.remove('show');
      }
    });
  </script>
</body>
</html>
