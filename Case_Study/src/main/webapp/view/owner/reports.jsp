<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Báo cáo - Quản Lý Nhà Trọ</title>
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
  </script>
</body>
</html>
