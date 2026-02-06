<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Chi tiết Phòng - Quản Lý Nhà Trọ</title>
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
        <a href="dashboard.jsp">Trang chủ</a> / <a href="rooms.jsp">Quản lý phòng</a> / <span>Chi tiết phòng P101</span>
      </div>

      <div class="page-header">
        <h1 class="page-title">Chi tiết Phòng P101</h1>
        <a href="rooms.jsp" class="btn-custom btn-outline">
          <i class="bi bi-arrow-left"></i> Quay lại
        </a>
      </div>

      <!-- Room Info Card -->
      <div class="card-custom" style="margin-bottom: 25px;">
        <div style="display: grid; grid-template-columns: auto 1fr; gap: 30px; align-items: start;">
          <div class="img-placeholder-lg">📷</div>
          <div>
            <div style="margin-bottom: 20px;">
              <h3 style="color: #2e86ab; margin-bottom: 10px;">Mã phòng: <strong>P101</strong></h3>
              <p style="margin: 0;">
                <span class="badge-custom badge-success">Đang thuê</span>
              </p>
            </div>
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
              <div>
                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Giá phòng</div>
                <div style="font-size: 20px; font-weight: 700; color: #2e86ab;">3.5M VND/tháng</div>
              </div>
              <div>
                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Diện tích</div>
                <div style="font-size: 20px; font-weight: 700; color: #2e86ab;">25 m²</div>
              </div>
              <div>
                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Tầng</div>
                <div style="font-size: 20px; font-weight: 700; color: #2e86ab;">Tầng 1</div>
              </div>
              <div>
                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Số người ở</div>
                <div style="font-size: 20px; font-weight: 700; color: #2e86ab;">2 người</div>
              </div>
            </div>
            <div style="margin-top: 20px; padding-top: 20px; border-top: 1px solid #d4e6f1;">
              <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 8px;">Mô tả</div>
              <p style="margin: 0; color: #2c3e50; font-size: 13px;">Phòng đơn thoáng mát, cửa sổ hướng mặt đường. Nội thất cơ bản đầy đủ. Phù hợp cho sinh viên hoặc nhân viên độc thân.</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Tabs -->
      <div class="tabs-container">
        <div class="tab-buttons">
          <button class="tab-btn active" onclick="switchTab('equipment')">
            <i class="bi bi-tools"></i> Thiết bị
          </button>
          <button class="tab-btn" onclick="switchTab('history')">
            <i class="bi bi-clock-history"></i> Lịch sử thuê
          </button>
          <button class="tab-btn" onclick="switchTab('contract')">
            <i class="bi bi-file-earmark-text"></i> Hợp đồng
          </button>
          <button class="tab-btn" onclick="switchTab('invoices')">
            <i class="bi bi-receipt"></i> Hóa đơn
          </button>
        </div>

        <!-- Equipment Tab -->
        <div id="equipment" class="tab-content active">
          <div class="card-custom">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
              <h5 class="card-title">Danh sách Thiết bị</h5>
              <button class="btn-custom btn-primary-custom" onclick="openEquipmentModal()">
                <i class="bi bi-plus-lg"></i> Thêm thiết bị
              </button>
            </div>
            <div class="table-responsive">
              <table class="table-custom">
                <thead>
                  <tr>
                    <th>Tên thiết bị</th>
                    <th>Số lượng</th>
                    <th>Ghi chú</th>
                    <th>Thao tác</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Giường</td>
                    <td>1</td>
                    <td>Giường đôi size king</td>
                    <td>
                      <div class="action-buttons">
                        <button class="btn-custom btn-primary-custom" onclick="editEquipment()">Sửa</button>
                        <button class="btn-custom btn-danger">Xóa</button>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Tủ quần áo</td>
                    <td>1</td>
                    <td>Tủ gỗ cao cấp</td>
                    <td>
                      <div class="action-buttons">
                        <button class="btn-custom btn-primary-custom" onclick="editEquipment()">Sửa</button>
                        <button class="btn-custom btn-danger">Xóa</button>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Quạt điện</td>
                    <td>2</td>
                    <td>Quạt trần + quạt đứng</td>
                    <td>
                      <div class="action-buttons">
                        <button class="btn-custom btn-primary-custom" onclick="editEquipment()">Sửa</button>
                        <button class="btn-custom btn-danger">Xóa</button>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <!-- History Tab -->
        <div id="history" class="tab-content">
          <div class="card-custom">
            <h5 class="card-title" style="margin-bottom: 20px;">Lịch sử Thuê</h5>
            <div style="display: flex; flex-direction: column; gap: 15px;">
              <div style="padding-left: 20px; border-left: 3px solid #5dade2; padding-bottom: 15px;">
                <div style="font-weight: 600; color: #2e86ab;">01/11/2024 - Hiện tại</div>
                <div style="font-size: 13px; color: #2c3e50; margin-top: 5px;">Khách: Nguyễn Văn A</div>
                <div style="font-size: 12px; color: #7f8c8d; margin-top: 3px;">Trạng thái: Đang thuê</div>
              </div>
              <div style="padding-left: 20px; border-left: 3px solid #95a5a6; padding-bottom: 15px;">
                <div style="font-weight: 600; color: #7f8c8d;">15/08/2024 - 31/10/2024</div>
                <div style="font-size: 13px; color: #2c3e50; margin-top: 5px;">Khách: Trần Minh B</div>
                <div style="font-size: 12px; color: #7f8c8d; margin-top: 3px;">Trạng thái: Đã kết thúc</div>
              </div>
              <div style="padding-left: 20px; border-left: 3px solid #95a5a6; padding-bottom: 15px;">
                <div style="font-weight: 600; color: #7f8c8d;">20/05/2024 - 14/08/2024</div>
                <div style="font-size: 13px; color: #2c3e50; margin-top: 5px;">Khách: Phạm Thị C</div>
                <div style="font-size: 12px; color: #7f8c8d; margin-top: 3px;">Trạng thái: Đã kết thúc</div>
              </div>
            </div>
          </div>
        </div>

        <!-- Contract Tab -->
        <div id="contract" class="tab-content">
          <div class="card-custom">
            <h5 class="card-title" style="margin-bottom: 20px;">Hợp đồng Hiện tại</h5>
            <div style="display: grid; gap: 15px;">
              <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                <div>
                  <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Mã hợp đồng</div>
                  <div style="font-size: 14px; font-weight: 600; color: #2e86ab;">HĐ001</div>
                </div>
                <div>
                  <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Người thuê</div>
                  <div style="font-size: 14px; font-weight: 600; color: #2e86ab;">Nguyễn Văn A</div>
                </div>
                <div>
                  <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Ngày bắt đầu</div>
                  <div style="font-size: 14px; color: #2c3e50;">01/11/2024</div>
                </div>
                <div>
                  <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Ngày kết thúc</div>
                  <div style="font-size: 14px; color: #2c3e50;">31/10/2025</div>
                </div>
                <div>
                  <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Tiền cọc</div>
                  <div style="font-size: 14px; font-weight: 600; color: #27ae60;">7.0M VND</div>
                </div>
                <div>
                  <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Trạng thái</div>
                  <div><span class="badge-custom badge-success">Hiệu lực</span></div>
                </div>
              </div>
              <div style="padding-top: 15px; border-top: 1px solid #d4e6f1;">
                <a href="contracts.jsp" class="btn-custom btn-outline">
                  <i class="bi bi-file-earmark-text"></i> Xem hợp đồng
                </a>
              </div>
            </div>
          </div>
        </div>

        <!-- Invoices Tab -->
        <div id="invoices" class="tab-content">
          <div class="card-custom">
            <h5 class="card-title" style="margin-bottom: 20px;">Hóa đơn Gần đây</h5>
            <div class="table-responsive">
              <table class="table-custom">
                <thead>
                  <tr>
                    <th>Mã HĐ</th>
                    <th>Kỳ</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><strong>HĐ001</strong></td>
                    <td>01/2025</td>
                    <td>3.5M VND</td>
                    <td><span class="badge-custom badge-success">Đã thu</span></td>
                    <td><a href="invoice-detail.jsp" class="btn-link-custom">Xem</a></td>
                  </tr>
                  <tr>
                    <td><strong>HĐ002</strong></td>
                    <td>12/2024</td>
                    <td>3.5M VND</td>
                    <td><span class="badge-custom badge-success">Đã thu</span></td>
                    <td><a href="invoice-detail.jsp" class="btn-link-custom">Xem</a></td>
                  </tr>
                  <tr>
                    <td><strong>HĐ003</strong></td>
                    <td>11/2024</td>
                    <td>3.5M VND</td>
                    <td><span class="badge-custom badge-success">Đã thu</span></td>
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

  <!-- Equipment Modal -->
  <div class="modal-overlay" id="equipmentModal">
    <div class="modal-content">
      <div class="modal-header">
        <h5>Thêm Thiết bị</h5>
        <button class="modal-close-btn" onclick="closeEquipmentModal()">×</button>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label class="form-label">Tên thiết bị</label>
          <input type="text" class="form-control" placeholder="Ví dụ: Giường, Tủ...">
        </div>
        <div class="form-group">
          <label class="form-label">Số lượng</label>
          <input type="number" class="form-control" placeholder="1">
        </div>
        <div class="form-group">
          <label class="form-label">Ghi chú</label>
          <textarea class="form-control" rows="3" placeholder="Mô tả chi tiết thiết bị..."></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn-custom btn-secondary" onclick="closeEquipmentModal()">Hủy</button>
        <button class="btn-custom btn-primary-custom">Lưu</button>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function switchTab(tabName) {
      // Hide all tabs
      document.querySelectorAll('.tab-content').forEach(tab => {
        tab.classList.remove('active');
      });
      document.querySelectorAll('.tab-btn').forEach(btn => {
        btn.classList.remove('active');
      });

      // Show selected tab
      document.getElementById(tabName).classList.add('active');
      event.target.classList.add('active');
    }

    function openEquipmentModal() {
      document.getElementById('equipmentModal').classList.add('show');
    }

    function closeEquipmentModal() {
      document.getElementById('equipmentModal').classList.remove('show');
    }

    function editEquipment() {
      openEquipmentModal();
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

    document.getElementById('equipmentModal').addEventListener('click', function(e) {
      if (e.target === this) {
        closeEquipmentModal();
      }
    });
  </script>
</body>
</html>
