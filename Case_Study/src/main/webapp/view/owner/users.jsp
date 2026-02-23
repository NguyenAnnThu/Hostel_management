<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Người dùng - Quản Lý Nhà Trọ</title>
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
        <a href="dashboard.jsp">Trang chủ</a> / <span>Người dùng</span>
      </div>

      <div class="page-header">
        <h1 class="page-title">Quản lý Người dùng</h1>
      </div>

      <!-- Filters -->
      <div class="filter-section">
        <div class="filter-group">
          <label>Trạng thái</label>
          <select id="statusFilter" class="form-control">
            <option value="">-- Chọn trạng thái --</option>
            <option value="active">Hoạt động</option>
            <option value="locked">Bị khóa</option>
          </select>
        </div>
        <div class="filter-group">
          <label>Tìm kiếm</label>
          <input type="text" class="form-control" id="searchInput" placeholder="Tên hoặc SĐT">
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
                <th>ID</th>
                <th>Họ tên</th>
                <th>Số điện thoại</th>
                <th>Email</th>
                <th>Role</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><strong>KH001</strong></td>
                <td>Nguyễn Văn A</td>
                <td>0987654321</td>
                <td>vana@email.com</td>
                <td><span class="badge-custom badge-light">Khách</span></td>
                <td><span class="badge-custom badge-success">Hoạt động</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom" onclick="viewUser()">Xem</button>
                    <button class="btn-custom btn-primary-custom" onclick="editUser()">Sửa</button>
                    <button class="btn-custom btn-danger">Khóa</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>KH002</strong></td>
                <td>Trần Thị B</td>
                <td>0912345678</td>
                <td>thib@email.com</td>
                <td><span class="badge-custom badge-light">Khách</span></td>
                <td><span class="badge-custom badge-success">Hoạt động</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom" onclick="viewUser()">Xem</button>
                    <button class="btn-custom btn-primary-custom" onclick="editUser()">Sửa</button>
                    <button class="btn-custom btn-danger">Khóa</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>KH003</strong></td>
                <td>Phạm Minh C</td>
                <td>0901234567</td>
                <td>minc@email.com</td>
                <td><span class="badge-custom badge-light">Khách</span></td>
                <td><span class="badge-custom badge-success">Hoạt động</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom" onclick="viewUser()">Xem</button>
                    <button class="btn-custom btn-primary-custom" onclick="editUser()">Sửa</button>
                    <button class="btn-custom btn-danger">Khóa</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>KH004</strong></td>
                <td>Lê Thị D</td>
                <td>0923456789</td>
                <td>thid@email.com</td>
                <td><span class="badge-custom badge-light">Khách</span></td>
                <td><span class="badge-custom badge-danger">Bị khóa</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom" onclick="viewUser()">Xem</button>
                    <button class="btn-custom btn-primary-custom" onclick="editUser()">Sửa</button>
                    <button class="btn-custom btn-success">Mở khóa</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>ADM001</strong></td>
                <td>Chủ trọ Admin</td>
                <td>0909999999</td>
                <td>admin@rental.com</td>
                <td><span class="badge-custom badge-info">Chủ</span></td>
                <td><span class="badge-custom badge-success">Hoạt động</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom" onclick="viewUser()">Xem</button>
                    <button class="btn-custom btn-primary-custom" onclick="editUser()">Sửa</button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <!-- User Modal -->
  <div class="modal-overlay" id="userModal">
    <div class="modal-content" style="max-width: 550px;">
      <div class="modal-header">
        <h5 id="userModalTitle">Xem Người dùng</h5>
        <button class="modal-close-btn" onclick="closeUserModal()">×</button>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label class="form-label">ID</label>
          <input type="text" class="form-control" value="KH001" disabled>
        </div>
        <div class="form-group">
          <label class="form-label">Họ tên</label>
          <input type="text" class="form-control" value="Nguyễn Văn A">
        </div>
        <div class="form-group">
          <label class="form-label">Số điện thoại</label>
          <input type="tel" class="form-control" value="0987654321" disabled>
        </div>
        <div class="form-group">
          <label class="form-label">Email</label>
          <input type="email" class="form-control" value="vana@email.com">
        </div>
        <div class="form-group">
          <label class="form-label">CCCD/CMND</label>
          <input type="text" class="form-control" value="123456789012">
        </div>
        <div class="form-group">
          <label class="form-label">Địa chỉ</label>
          <input type="text" class="form-control" value="123 Đường ABC, Quận 1, TP HCM">
        </div>
        <div class="form-group">
          <label class="form-label">Ngày sinh</label>
          <input type="date" class="form-control" value="1990-05-15">
        </div>
        <div class="form-group">
          <label class="form-label">Trạng thái</label>
          <select class="form-control">
            <option selected>Hoạt động</option>
            <option>Bị khóa</option>
          </select>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn-custom btn-secondary" onclick="closeUserModal()">Hủy</button>
        <button class="btn-custom btn-primary-custom" id="saveBtnUser">Lưu</button>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function viewUser() {
      document.getElementById('userModalTitle').textContent = 'Xem Người dùng';
      document.getElementById('saveBtnUser').style.display = 'none';
      document.getElementById('userModal').classList.add('show');
    }

    function editUser() {
      document.getElementById('userModalTitle').textContent = 'Chỉnh sửa Người dùng';
      document.getElementById('saveBtnUser').style.display = 'inline-block';
      document.getElementById('userModal').classList.add('show');
    }

    function closeUserModal() {
      document.getElementById('userModal').classList.remove('show');
    }

    function resetFilters() {
      document.getElementById('statusFilter').value = '';
      document.getElementById('searchInput').value = '';
    }

    document.getElementById('userModal').addEventListener('click', function(e) {
      if (e.target === this) {
        closeUserModal();
      }
    });
  </script>
</body>
</html>
