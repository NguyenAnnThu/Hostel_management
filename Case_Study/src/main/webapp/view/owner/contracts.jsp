<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hợp đồng - Quản Lý Nhà Trọ</title>
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
        <a href="contracts.jsp" class="nav-link active">
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
        <a href="dashboard.jsp">Trang chủ</a> / <span>Hợp đồng</span>
      </div>

      <div class="page-header">
        <h1 class="page-title">Quản lý Hợp đồng</h1>
      </div>

      <!-- Filters -->
      <div class="filter-section">
        <div class="filter-group">
          <label>Trạng thái</label>
          <select id="statusFilter" class="form-control">
            <option value="">-- Chọn trạng thái --</option>
            <option value="hiệu lực">Hiệu lực</option>
            <option value="kết thúc">Kết thúc</option>
          </select>
        </div>
        <div class="filter-group">
          <label>Phòng</label>
          <select id="roomFilter" class="form-control">
            <option value="">-- Chọn phòng --</option>
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
                <th>Mã HĐ</th>
                <th>Phòng</th>
                <th>Người thuê</th>
                <th>Ngày bắt đầu</th>
                <th>Ngày kết thúc</th>
                <th>Tiền cọc (VND)</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><strong>HĐ001</strong></td>
                <td>P101</td>
                <td>Nguyễn Văn A</td>
                <td>01/11/2024</td>
                <td>31/10/2025</td>
                <td>7.0M</td>
                <td><span class="badge-custom badge-success">Hiệu lực</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom">Xem</button>
                    <button class="btn-custom btn-primary-custom" onclick="editContract()">Sửa</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>HĐ002</strong></td>
                <td>P205</td>
                <td>Phạm Minh C</td>
                <td>15/08/2024</td>
                <td>14/02/2025</td>
                <td>9.6M</td>
                <td><span class="badge-custom badge-success">Hiệu lực</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom">Xem</button>
                    <button class="btn-custom btn-primary-custom" onclick="editContract()">Sửa</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>HĐ003</strong></td>
                <td>P301</td>
                <td>Trần Thị B</td>
                <td>20/05/2024</td>
                <td>19/08/2024</td>
                <td>11.4M</td>
                <td><span class="badge-custom badge-danger">Kết thúc</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom">Xem</button>
                    <button class="btn-custom btn-success">Trả phòng</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>HĐ004</strong></td>
                <td>P102</td>
                <td>Lê Thị D</td>
                <td>10/02/2024</td>
                <td>09/05/2024</td>
                <td>8.4M</td>
                <td><span class="badge-custom badge-danger">Kết thúc</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom">Xem</button>
                    <button class="btn-custom btn-secondary">Trả phòng</button>
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
        <h5 id="modalTitle">Chỉnh sửa Hợp đồng</h5>
        <button class="modal-close-btn" onclick="closeContractModal()">×</button>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label class="form-label">Phòng</label>
          <select class="form-control">
            <option>P101</option>
            <option>P102</option>
            <option>P201</option>
            <option>P205</option>
            <option>P301</option>
          </select>
        </div>
        <div class="form-group">
          <label class="form-label">Người thuê</label>
          <select class="form-control">
            <option>Nguyễn Văn A</option>
            <option>Trần Thị B</option>
            <option>Phạm Minh C</option>
            <option>Lê Thị D</option>
            <option>Hoàng Văn E</option>
          </select>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label class="form-label">Ngày bắt đầu</label>
            <input type="date" class="form-control" value="2024-11-01">
          </div>
          <div class="form-group">
            <label class="form-label">Ngày kết thúc</label>
            <input type="date" class="form-control" value="2025-10-31">
          </div>
        </div>
        <div class="form-group">
          <label class="form-label">Tiền cọc (VND)</label>
          <input type="number" class="form-control" value="7000000">
        </div>
        <div class="form-group">
          <label class="form-label">Trạng thái</label>
          <select class="form-control">
            <option selected>Hiệu lực</option>
            <option>Kết thúc</option>
          </select>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn-custom btn-secondary" onclick="closeContractModal()">Hủy</button>
        <button class="btn-custom btn-primary-custom">Lưu thay đổi</button>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function editContract() {
      document.getElementById('contractModal').classList.add('show');
    }

    function closeContractModal() {
      document.getElementById('contractModal').classList.remove('show');
    }

    function resetFilters() {
      document.getElementById('statusFilter').value = '';
      document.getElementById('roomFilter').value = '';
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
