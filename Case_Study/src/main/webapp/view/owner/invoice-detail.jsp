<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Chi tiết Hóa đơn - Quản Lý Nhà Trọ</title>
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
        <a href="dashboard.jsp">Trang chủ</a> / <a href="invoices.jsp">Hóa đơn</a> / <span>Chi tiết HĐ001</span>
      </div>

      <div class="page-header">
        <h1 class="page-title">Hóa đơn HĐ001</h1>
        <a href="invoices.jsp" class="btn-custom btn-outline">
          <i class="bi bi-arrow-left"></i> Quay lại
        </a>
      </div>

      <!-- Invoice Header -->
      <div class="card-custom" style="margin-bottom: 25px;">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 30px;">
          <div>
            <div style="margin-bottom: 20px;">
              <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Mã hóa đơn</div>
              <div style="font-size: 20px; font-weight: 700; color: #2e86ab;">HĐ001</div>
            </div>
            <div style="display: grid; gap: 15px;">
              <div>
                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Phòng</div>
                <div style="font-size: 14px; color: #2c3e50;">P101</div>
              </div>
              <div>
                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Người thuê</div>
                <div style="font-size: 14px; color: #2c3e50;">Nguyễn Văn A</div>
              </div>
              <div>
                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Kỳ</div>
                <div style="font-size: 14px; color: #2c3e50;">01/2025</div>
              </div>
            </div>
          </div>
          <div>
            <div style="background-color: var(--light); padding: 20px; border-radius: 8px;">
              <div style="margin-bottom: 15px;">
                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Trạng thái</div>
                <span class="badge-custom badge-success">Đã thu</span>
              </div>
              <div style="margin-bottom: 15px;">
                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Ngày tạo</div>
                <div style="font-size: 14px; color: #2c3e50;">20/01/2025</div>
              </div>
              <div>
                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">Ngày xác nhận</div>
                <div style="font-size: 14px; color: #2c3e50;">20/01/2025</div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Invoice Details -->
      <div class="card-custom" style="margin-bottom: 25px;">
        <div class="card-header">
          <h5 class="card-title">Chi tiết Dịch vụ</h5>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table-custom">
              <thead>
                <tr>
                  <th>Dịch vụ</th>
                  <th>Loại</th>
                  <th>Số lượng</th>
                  <th>Đơn giá (VND)</th>
                  <th>Thành tiền (VND)</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><strong>Tiền thuê phòng</strong></td>
                  <td>Cố định</td>
                  <td>1</td>
                  <td>3,500,000</td>
                  <td><strong>3,500,000</strong></td>
                </tr>
                <tr>
                  <td><strong>Điện</strong></td>
                  <td>Chỉ số</td>
                  <td>15 kWh</td>
                  <td>5,000</td>
                  <td><strong>75,000</strong></td>
                </tr>
                <tr>
                  <td><strong>Nước</strong></td>
                  <td>Chỉ số</td>
                  <td>5 m³</td>
                  <td>25,000</td>
                  <td><strong>125,000</strong></td>
                </tr>
                <tr>
                  <td><strong>Dịch vụ khác (Wifi)</strong></td>
                  <td>Cố định</td>
                  <td>1</td>
                  <td>200,000</td>
                  <td><strong>200,000</strong></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- Summary & QR -->
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px; margin-bottom: 25px;">
        <!-- Summary -->
        <div class="card-custom">
          <div class="card-header">
            <h5 class="card-title">Tóm tắt Thành tiền</h5>
          </div>
          <div class="card-body">
            <div style="display: flex; justify-content: space-between; margin-bottom: 10px; padding-bottom: 10px; border-bottom: 1px solid var(--border);">
              <div>Tiền thuê phòng:</div>
              <div style="font-weight: 600;">3,500,000 VND</div>
            </div>
            <div style="display: flex; justify-content: space-between; margin-bottom: 10px; padding-bottom: 10px; border-bottom: 1px solid var(--border);">
              <div>Điện:</div>
              <div style="font-weight: 600;">75,000 VND</div>
            </div>
            <div style="display: flex; justify-content: space-between; margin-bottom: 10px; padding-bottom: 10px; border-bottom: 1px solid var(--border);">
              <div>Nước:</div>
              <div style="font-weight: 600;">125,000 VND</div>
            </div>
            <div style="display: flex; justify-content: space-between; margin-bottom: 15px; padding-bottom: 10px; border-bottom: 1px solid var(--border);">
              <div>Dịch vụ khác:</div>
              <div style="font-weight: 600;">200,000 VND</div>
            </div>
            <div style="display: flex; justify-content: space-between; align-items: center; padding: 15px 0; background-color: var(--light); padding: 15px; border-radius: 6px;">
              <div style="font-size: 14px; font-weight: 600; color: var(--dark);">Tổng tiền:</div>
              <div style="font-size: 24px; font-weight: 700; color: var(--primary-dark);">3,900,000</div>
            </div>
            <p style="font-size: 11px; color: var(--text-muted); margin-top: 10px; margin-bottom: 0;"><strong>Đơn vị:</strong> VND</p>
          </div>
        </div>

        <!-- QR Code -->
        <div class="card-custom">
          <div class="card-header">
            <h5 class="card-title">Mã QR Thanh toán</h5>
          </div>
          <div class="card-body" style="display: flex; flex-direction: column; align-items: center;">
            <div style="width: 150px; height: 150px; background: linear-gradient(135deg, var(--primary-light) 0%, #b3d9f2 100%); border-radius: 8px; display: flex; align-items: center; justify-content: center; color: var(--primary-main); font-size: 48px; margin-bottom: 15px;">
              <i class="bi bi-qr-code"></i>
            </div>
            <div style="text-align: center;">
              <div style="font-size: 12px; color: var(--text-muted); margin-bottom: 8px;">Mã QR:</div>
              <div style="font-size: 13px; font-weight: 600; color: var(--dark); word-break: break-all;">QR20250120HĐ001</div>
            </div>
          </div>
        </div>
      </div>

      <!-- Actions -->
      <div style="display: flex; gap: 10px;">
        <a href="invoices.jsp" class="btn-custom btn-outline">
          <i class="bi bi-arrow-left"></i> Quay lại
        </a>
        <button class="btn-custom btn-primary-custom" onclick="printInvoice()">
          <i class="bi bi-printer"></i> In hóa đơn
        </button>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function printInvoice() {
      window.print();
    }
  </script>
</body>
</html>
