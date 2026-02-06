<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lý Phòng - Quản Lý Nhà Trọ</title>
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
        <a href="rooms.jsp" class="nav-link active">
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
        <a href="dashboard.jsp">Trang chủ</a> / <span>Quản lý phòng</span>
      </div>

      <div class="page-header">
        <h1 class="page-title">Quản lý Phòng</h1>
        <button class="btn-custom btn-primary-custom" onclick="openAddRoomModal()">
          <i class="bi bi-plus-lg"></i> Thêm phòng
        </button>
      </div>

      <!-- Filters -->
      <div class="filter-section">
        <div class="filter-group">
          <label>Tầng</label>
          <select id="floorFilter" class="form-control">
            <option value="">-- Chọn tầng --</option>
            <option value="1">Tầng 1</option>
            <option value="2">Tầng 2</option>
            <option value="3">Tầng 3</option>
            <option value="4">Tầng 4</option>
          </select>
        </div>
        <div class="filter-group">
          <label>Trạng thái</label>
          <select id="statusFilter" class="form-control">
            <option value="">-- Chọn trạng thái --</option>
            <option value="trống">Trống</option>
            <option value="đang thuê">Đang thuê</option>
            <option value="bảo trì">Bảo trì</option>
            <option value="đang đặt">Đang đặt</option>
            <option value="đặt cọc">Đặt cọc</option>
          </select>
        </div>
        <div class="filter-group">
          <label>Giá từ (VND)</label>
          <input type="number" class="form-control" id="minPrice" placeholder="Min">
        </div>
        <div class="filter-group">
          <label>Giá đến (VND)</label>
          <input type="number" class="form-control" id="maxPrice" placeholder="Max">
        </div>
        <div class="filter-group">
          <label>Mã phòng</label>
          <input type="text" class="form-control" id="roomCodeSearch" placeholder="Tìm mã phòng">
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
                <th>Ảnh</th>
                <th>Mã phòng</th>
                <th>Tầng</th>
                <th>Diện tích (m²)</th>
                <th>Giá/tháng (VND)</th>
                <th>Trạng thái</th>
                <th>Người thuê</th>
                <th>Cập nhật</th>
                <th>Thao tác</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><div class="img-placeholder">📷</div></td>
                <td><strong>P101</strong></td>
                <td>1</td>
                <td>25</td>
                <td>3.5M</td>
                <td><span class="badge-custom badge-success">Đang thuê</span></td>
                <td>Nguyễn Văn A</td>
                <td>20/01/2025</td>
                <td>
                  <div class="action-buttons">
                    <a href="room-detail.jsp" class="btn-custom btn-primary-custom">Xem</a>
                    <button class="btn-custom btn-primary-custom" onclick="editRoom('P101')">Sửa</button>
                    <button class="btn-custom btn-danger">Xóa</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><div class="img-placeholder">📷</div></td>
                <td><strong>P102</strong></td>
                <td>1</td>
                <td>20</td>
                <td>2.8M</td>
                <td><span class="badge-custom badge-warning">Trống</span></td>
                <td>-</td>
                <td>18/01/2025</td>
                <td>
                  <div class="action-buttons">
                    <a href="room-detail.jsp" class="btn-custom btn-primary-custom">Xem</a>
                    <button class="btn-custom btn-primary-custom" onclick="editRoom('P102')">Sửa</button>
                    <button class="btn-custom btn-danger">Xóa</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><div class="img-placeholder">📷</div></td>
                <td><strong>P201</strong></td>
                <td>2</td>
                <td>30</td>
                <td>4.2M</td>
                <td><span class="badge-custom badge-info">Đang đặt</span></td>
                <td>Trần Thị B</td>
                <td>15/01/2025</td>
                <td>
                  <div class="action-buttons">
                    <a href="room-detail.jsp" class="btn-custom btn-primary-custom">Xem</a>
                    <button class="btn-custom btn-primary-custom" onclick="editRoom('P201')">Sửa</button>
                    <button class="btn-custom btn-success">Tạo HĐ</button>
                    <button class="btn-custom btn-danger">Hủy đặt</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><div class="img-placeholder">📷</div></td>
                <td><strong>P205</strong></td>
                <td>2</td>
                <td>35</td>
                <td>4.8M</td>
                <td><span class="badge-custom badge-success">Đang thuê</span></td>
                <td>Phạm Minh C</td>
                <td>10/01/2025</td>
                <td>
                  <div class="action-buttons">
                    <a href="room-detail.jsp" class="btn-custom btn-primary-custom">Xem</a>
                    <button class="btn-custom btn-primary-custom" onclick="editRoom('P205')">Sửa</button>
                    <button class="btn-custom btn-danger">Xóa</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><div class="img-placeholder">📷</div></td>
                <td><strong>P301</strong></td>
                <td>3</td>
                <td>28</td>
                <td>3.8M</td>
                <td><span class="badge-custom badge-danger">Bảo trì</span></td>
                <td>-</td>
                <td>05/01/2025</td>
                <td>
                  <div class="action-buttons">
                    <a href="room-detail.jsp" class="btn-custom btn-primary-custom">Xem</a>
                    <button class="btn-custom btn-primary-custom" onclick="editRoom('P301')">Sửa</button>
                    <button class="btn-custom btn-danger">Xóa</button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal Add/Edit Room -->
  <div class="modal-overlay" id="roomModal">
    <div class="modal-content">
      <div class="modal-header">
        <h5 id="modalTitle">Thêm phòng mới</h5>
        <button class="modal-close-btn" onclick="closeRoomModal()">×</button>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label class="form-label">Mã phòng</label>
          <input type="text" class="form-control" placeholder="Ví dụ: P101">
        </div>
        <div class="form-row">
          <div class="form-group">
            <label class="form-label">Tầng</label>
            <input type="number" class="form-control" placeholder="1">
          </div>
          <div class="form-group">
            <label class="form-label">Diện tích (m²)</label>
            <input type="number" class="form-control" placeholder="25">
          </div>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label class="form-label">Giá phòng/tháng (VND)</label>
            <input type="number" class="form-control" placeholder="3500000">
          </div>
          <div class="form-group">
            <label class="form-label">Số người ở</label>
            <input type="number" class="form-control" placeholder="2">
          </div>
        </div>
        <div class="form-group">
          <label class="form-label">Trạng thái</label>
          <select class="form-control">
            <option>Trống</option>
            <option>Đang thuê</option>
            <option>Bảo trì</option>
            <option>Đang đặt</option>
            <option>Đặt cọc</option>
          </select>
        </div>
        <div class="form-group">
          <label class="form-label">Mô tả</label>
          <textarea class="form-control" rows="3" placeholder="Mô tả phòng..."></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn-custom btn-secondary" onclick="closeRoomModal()">Hủy</button>
        <button class="btn-custom btn-primary-custom">Lưu</button>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function openAddRoomModal() {
      document.getElementById('modalTitle').textContent = 'Thêm phòng mới';
      document.getElementById('roomModal').classList.add('show');
    }

    function editRoom(roomCode) {
      document.getElementById('modalTitle').textContent = 'Chỉnh sửa: ' + roomCode;
      document.getElementById('roomModal').classList.add('show');
    }

    function closeRoomModal() {
      document.getElementById('roomModal').classList.remove('show');
    }

    function resetFilters() {
      document.getElementById('floorFilter').value = '';
      document.getElementById('statusFilter').value = '';
      document.getElementById('minPrice').value = '';
      document.getElementById('maxPrice').value = '';
      document.getElementById('roomCodeSearch').value = '';
    }

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
      if (menu && btn && !menu.contains(event.target) && !btn.contains(event.target)) {
        menu.classList.remove('show');
      }
    });

    // Close modal when clicking outside
    document.getElementById('roomModal').addEventListener('click', function(e) {
      if (e.target === this) {
        closeRoomModal();
      }
    });
  </script>
</body>
</html>
