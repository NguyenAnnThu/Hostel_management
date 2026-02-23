<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Điện nước - Quản Lý Nhà Trọ</title>
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
        <a href="dashboard.jsp">Trang chủ</a> / <span>Chỉ số điện nước</span>
      </div>

      <div class="page-header">
        <h1 class="page-title">Ghi chỉ số Điện - Nước</h1>
      </div>

      <!-- Controls -->
      <div class="card-custom" style="margin-bottom: 25px;">
        <div class="card-header">
          <h5 class="card-title">Chọn Kỳ</h5>
        </div>
        <div class="card-body">
          <div class="form-row">
            <div class="form-group">
              <label class="form-label">Tháng</label>
              <select class="form-control">
                <option selected>01</option>
                <option>02</option>
                <option>03</option>
                <option>04</option>
                <option>05</option>
                <option>06</option>
                <option>07</option>
                <option>08</option>
                <option>09</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
              </select>
            </div>
            <div class="form-group">
              <label class="form-label">Năm</label>
              <select class="form-control">
                <option>2023</option>
                <option>2024</option>
                <option selected>2025</option>
              </select>
            </div>
          </div>
          <div style="background-color: #f5f9ff; border-left: 3px solid #5dade2; padding: 12px; border-radius: 4px; margin-top: 15px; font-size: 12px; color: #2e86ab;">
            <strong>⚠️ Lưu ý:</strong> Chỉ số mới phải lớn hơn chỉ số cũ. Không cho nhập nhỏ hơn tháng trước (quy tắc nghiệp vụ).
          </div>
        </div>
      </div>

      <!-- Utilities Table -->
      <div class="card-custom">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
          <h5 class="card-title">Chỉ số Điện - Nước (Phòng đang thuê)</h5>
          <button class="btn-custom btn-success" onclick="finalizeReadings()">
            <i class="bi bi-check-circle"></i> Chốt tháng & tạo hóa đơn
          </button>
        </div>
        <div class="table-responsive">
          <table class="table-custom">
            <thead>
              <tr>
                <th>Phòng</th>
                <th colspan="3" style="text-align: center;">Điện</th>
                <th colspan="3" style="text-align: center;">Nước</th>
                <th>Ngày ghi</th>
                <th>Trạng thái</th>
              </tr>
              <tr>
                <th></th>
                <th>Chỉ cũ</th>
                <th>Chỉ mới</th>
                <th>Đơn vị</th>
                <th>Chỉ cũ</th>
                <th>Chỉ mới</th>
                <th>Đơn vị</th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><strong>P101</strong></td>
                <td>150</td>
                <td><input type="number" class="form-control" style="font-size: 12px;" value="165" min="150"></td>
                <td>kWh</td>
                <td>20</td>
                <td><input type="number" class="form-control" style="font-size: 12px;" value="25" min="20"></td>
                <td>m³</td>
                <td><input type="date" class="form-control" style="font-size: 12px;" value="2025-01-23"></td>
                <td><span class="badge-custom badge-success">Đủ</span></td>
              </tr>
              <tr>
                <td><strong>P102</strong></td>
                <td>280</td>
                <td><input type="number" class="form-control" style="font-size: 12px;" placeholder="Nhập chỉ số" min="280"></td>
                <td>kWh</td>
                <td>35</td>
                <td><input type="number" class="form-control" style="font-size: 12px;" placeholder="Nhập chỉ số" min="35"></td>
                <td>m³</td>
                <td><input type="date" class="form-control" style="font-size: 12px;"></td>
                <td><span class="badge-custom badge-warning">Thiếu</span></td>
              </tr>
              <tr>
                <td><strong>P201</strong></td>
                <td>420</td>
                <td><input type="number" class="form-control" style="font-size: 12px;" value="445" min="420"></td>
                <td>kWh</td>
                <td>45</td>
                <td><input type="number" class="form-control" style="font-size: 12px;" value="52" min="45"></td>
                <td>m³</td>
                <td><input type="date" class="form-control" style="font-size: 12px;" value="2025-01-23"></td>
                <td><span class="badge-custom badge-success">Đủ</span></td>
              </tr>
              <tr>
                <td><strong>P205</strong></td>
                <td>560</td>
                <td><input type="number" class="form-control" style="font-size: 12px;" value="590" min="560"></td>
                <td>kWh</td>
                <td>60</td>
                <td><input type="number" class="form-control" style="font-size: 12px;" value="68" min="60"></td>
                <td>m³</td>
                <td><input type="date" class="form-control" style="font-size: 12px;" value="2025-01-23"></td>
                <td><span class="badge-custom badge-success">Đủ</span></td>
              </tr>
              <tr>
                <td><strong>P301</strong></td>
                <td>340</td>
                <td><input type="number" class="form-control" style="font-size: 12px;" placeholder="Nhập chỉ số" min="340"></td>
                <td>kWh</td>
                <td>48</td>
                <td><input type="number" class="form-control" style="font-size: 12px;" placeholder="Nhập chỉ số" min="48"></td>
                <td>m³</td>
                <td><input type="date" class="form-control" style="font-size: 12px;"></td>
                <td><span class="badge-custom badge-warning">Thiếu</span></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div style="margin-top: 20px; padding-top: 20px; border-top: 1px solid #d4e6f1;">
          <button class="btn-custom btn-success" onclick="finalizeReadings()">
            <i class="bi bi-check-circle"></i> Chốt tháng & tạo hóa đơn
          </button>
          <button class="btn-custom btn-outline" style="margin-left: 10px;">
            <i class="bi bi-arrow-clockwise"></i> Làm mới
          </button>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function finalizeReadings() {
      alert('Tháng 01/2025 đã được chốt. Hóa đơn tự động được tạo cho các phòng đủ chỉ số!');
      window.location.href = 'invoices.jsp';
    }
  </script>
</body>
</html>
