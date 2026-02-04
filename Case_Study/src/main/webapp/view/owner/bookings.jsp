<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đặt phòng - Quản Lý Nhà Trọ</title>
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
        <a href="bookings.jsp" class="nav-link active">
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
        <a href="dashboard.jsp">Trang chủ</a> / <span>Đặt phòng</span>
      </div>

      <div class="page-header">
        <h1 class="page-title">Quản lý Đặt phòng</h1>
      </div>

      <!-- Filters -->
      <div class="filter-section">
        <div class="filter-group">
          <label>Trạng thái</label>
          <select id="statusFilter" class="form-control">
            <option value="">-- Chọn trạng thái --</option>
            <option value="chờ">Chờ xác nhận</option>
            <option value="hủy">Hủy</option>
            <option value="xác nhận">Xác nhận</option>
          </select>
        </div>
        <div class="filter-group">
          <label>Tìm phòng/khách</label>
          <input type="text" class="form-control" id="searchInput" placeholder="Mã phòng hoặc tên khách">
        </div>
        <div class="filter-actions">
          <button class="btn-custom btn-primary-custom">
            <i class="bi bi-funnel"></i> Lọc
          </button>
          <button class="btn-custom btn-outline" onclick="resetFilters()">
            <i class="bi bi-arrow-clockwise"></i> Đặt lại
          </button>
        </div>
      </div>

      <!-- Table -->
      <div class="card-custom">
        <div class="table-responsive">
          <table class="table-custom">
            <thead>
              <tr>
                <th>Phòng</th>
                <th>Khách</th>
                <th>Ngày đặt</th>
                <th>Hạn</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><strong>P101</strong></td>
                <td>Nguyễn Văn A (0987654321)</td>
                <td>20/01/2025</td>
                <td>27/01/2025</td>
                <td><span class="badge-custom badge-info">Chờ</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-success" onclick="confirmBooking()">Xác nhận thuê</button>
                    <button class="btn-custom btn-danger">Hủy</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>P205</strong></td>
                <td>Trần Thị B (0912345678)</td>
                <td>19/01/2025</td>
                <td>26/01/2025</td>
                <td><span class="badge-custom badge-info">Chờ</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-success" onclick="confirmBooking()">Xác nhận thuê</button>
                    <button class="btn-custom btn-danger">Hủy</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>P301</strong></td>
                <td>Phạm Minh C (0901234567)</td>
                <td>10/01/2025</td>
                <td>17/01/2025</td>
                <td><span class="badge-custom badge-danger">Hết hạn</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-success" onclick="confirmBooking()">Xác nhận thuê</button>
                    <button class="btn-custom btn-danger">Hủy</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>P102</strong></td>
                <td>Lê Thị D (0923456789)</td>
                <td>25/12/2024</td>
                <td>01/01/2025</td>
                <td><span class="badge-custom badge-light">Đã hủy</span></td>
                <td>
                  <div class="action-buttons">
                    <span style="color: #7f8c8d; font-size: 12px;">Không hành động</span>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>P203</strong></td>
                <td>Hoàng Văn E (0934567890)</td>
                <td>15/01/2025</td>
                <td>22/01/2025</td>
                <td><span class="badge-custom badge-success">Xác nhận</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-outline">Xem HĐ</button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <!-- Contract Modal -->
  <div class="modal-overlay" id="contractModal">
    <div class="modal-content" style="max-width: 550px;">
      <div class="modal-header">
        <h5>Tạo Hợp đồng</h5>
        <button class="modal-close-btn" onclick="closeContractModal()">×</button>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label class="form-label">Phòng</label>
          <input type="text" class="form-control" id="contractRoom" disabled>
        </div>
        <div class="form-group">
          <label class="form-label">Người thuê</label>
          <input type="text" class="form-control" id="contractTenant" disabled>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label class="form-label">Ngày bắt đầu</label>
            <input type="date" class="form-control">
          </div>
          <div class="form-group">
            <label class="form-label">Ngày kết thúc</label>
            <input type="date" class="form-control">
          </div>
        </div>
        <div class="form-group">
          <label class="form-label">Tiền cọc (VND)</label>
          <input type="number" class="form-control" placeholder="7000000">
        </div>
        <div class="form-group">
          <label class="form-label">Trạng thái</label>
          <select class="form-control">
            <option>Hiệu lực</option>
            <option>Kết thúc</option>
          </select>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn-custom btn-secondary" onclick="closeContractModal()">Hủy</button>
        <button class="btn-custom btn-primary-custom" onclick="saveContract()">Tạo hợp đồng</button>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function confirmBooking() {
      document.getElementById('contractRoom').value = 'P101';
      document.getElementById('contractTenant').value = 'Nguyễn Văn A';
      document.getElementById('contractModal').classList.add('show');
    }

    function closeContractModal() {
      document.getElementById('contractModal').classList.remove('show');
    }

    function saveContract() {
      alert('Hợp đồng đã được tạo thành công!');
      closeContractModal();
      // Redirect to contracts page
      window.location.href = 'contracts.jsp';
    }

    function resetFilters() {
      document.getElementById('statusFilter').value = '';
      document.getElementById('searchInput').value = '';
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

    document.getElementById('contractModal').addEventListener('click', function(e) {
      if (e.target === this) {
        closeContractModal();
      }
    });
  </script>
</body>
</html>
