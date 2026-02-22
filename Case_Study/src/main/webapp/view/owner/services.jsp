<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dịch vụ - Quản Lý Nhà Trọ</title>
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
        <a href="dashboard.jsp">Trang chủ</a> / <span>Cấu hình dịch vụ</span>
      </div>

      <div class="page-header">
        <h1 class="page-title">Cấu hình Dịch vụ</h1>
        <button class="btn-custom btn-primary-custom" onclick="openServiceModal()">
          <i class="bi bi-plus-lg"></i> Thêm dịch vụ
        </button>
      </div>

      <!-- Table -->
      <div class="card-custom">
        <div class="table-responsive">
          <table class="table-custom">
            <thead>
              <tr>
                <th>Mã DV</th>
                <th>Tên dịch vụ</th>
                <th>Loại</th>
                <th>Đơn vị tính</th>
                <th>Đơn giá (VND)</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><strong>DV001</strong></td>
                <td>Tiền thuê phòng</td>
                <td><span class="badge-custom badge-info">Cố định</span></td>
                <td>Lần/tháng</td>
                <td>-</td>
                <td><span class="badge-custom badge-success">Hoạt động</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom" onclick="editService()">Sửa</button>
                    <button class="btn-custom btn-danger">Xóa</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>DV002</strong></td>
                <td>Điện</td>
                <td><span class="badge-custom badge-light">Chỉ số</span></td>
                <td>kWh</td>
                <td>5,000</td>
                <td><span class="badge-custom badge-success">Hoạt động</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom" onclick="editService()">Sửa</button>
                    <button class="btn-custom btn-danger">Xóa</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>DV003</strong></td>
                <td>Nước</td>
                <td><span class="badge-custom badge-light">Chỉ số</span></td>
                <td>m³</td>
                <td>25,000</td>
                <td><span class="badge-custom badge-success">Hoạt động</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom" onclick="editService()">Sửa</button>
                    <button class="btn-custom btn-danger">Xóa</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>DV004</strong></td>
                <td>Wifi</td>
                <td><span class="badge-custom badge-info">Cố định</span></td>
                <td>Lần/tháng</td>
                <td>200,000</td>
                <td><span class="badge-custom badge-success">Hoạt động</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom" onclick="editService()">Sửa</button>
                    <button class="btn-custom btn-danger">Xóa</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>DV005</strong></td>
                <td>Dịch vụ vệ sinh</td>
                <td><span class="badge-custom badge-info">Cố định</span></td>
                <td>Lần/tháng</td>
                <td>150,000</td>
                <td><span class="badge-custom badge-success">Hoạt động</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom" onclick="editService()">Sửa</button>
                    <button class="btn-custom btn-danger">Xóa</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><strong>DV006</strong></td>
                <td>Gửi xe máy</td>
                <td><span class="badge-custom badge-info">Cố định</span></td>
                <td>Lần/tháng</td>
                <td>50,000</td>
                <td><span class="badge-custom badge-success">Hoạt động</span></td>
                <td>
                  <div class="action-buttons">
                    <button class="btn-custom btn-primary-custom" onclick="editService()">Sửa</button>
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

  <!-- Service Modal -->
  <div class="modal-overlay" id="serviceModal">
    <div class="modal-content" style="max-width: 550px;">
      <div class="modal-header">
        <h5 id="serviceModalTitle">Thêm Dịch vụ mới</h5>
        <button class="modal-close-btn" onclick="closeServiceModal()">×</button>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label class="form-label">Mã dịch vụ</label>
          <input type="text" class="form-control" placeholder="DV001">
        </div>
        <div class="form-group">
          <label class="form-label">Tên dịch vụ</label>
          <input type="text" class="form-control" placeholder="Ví dụ: Wifi, Điện, Nước...">
        </div>
        <div class="form-group">
          <label class="form-label">Loại dịch vụ</label>
          <select class="form-control">
            <option value="">-- Chọn loại --</option>
            <option value="chi_so">Chỉ số (tính theo số lượng)</option>
            <option value="co_dinh">Cố định (không tính chỉ số)</option>
          </select>
        </div>
        <div class="form-group">
          <label class="form-label">Đơn vị tính</label>
          <input type="text" class="form-control" placeholder="kWh, m³, Lần/tháng...">
        </div>
        <div class="form-group">
          <label class="form-label">Đơn giá (VND)</label>
          <input type="number" class="form-control" placeholder="5000">
        </div>
        <div class="form-group">
          <label class="form-label">Trạng thái</label>
          <select class="form-control">
            <option selected>Hoạt động</option>
            <option>Không hoạt động</option>
          </select>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn-custom btn-secondary" onclick="closeServiceModal()">Hủy</button>
        <button class="btn-custom btn-primary-custom">Lưu</button>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function openServiceModal() {
      document.getElementById('serviceModalTitle').textContent = 'Thêm Dịch vụ mới';
      document.getElementById('serviceModal').classList.add('show');
    }

    function editService() {
      document.getElementById('serviceModalTitle').textContent = 'Chỉnh sửa Dịch vụ';
      document.getElementById('serviceModal').classList.add('show');
    }

    function closeServiceModal() {
      document.getElementById('serviceModal').classList.remove('show');
    }

    document.getElementById('serviceModal').addEventListener('click', function(e) {
      if (e.target === this) {
        closeServiceModal();
      }
    });
  </script>
</body>
</html>
