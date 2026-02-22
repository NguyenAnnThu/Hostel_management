<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tạo Hóa Đơn - Quản Lý Nhà Trọ</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
  <link rel="stylesheet" href="assets/styles.css">
  <style>
    /* ============================
       Create Invoice Specific Styles
       ============================ */

    .invoice-form-container {
      background: white;
      border-radius: 12px;
      box-shadow: 0 2px 8px rgba(21, 78, 158, 0.1);
      padding: 0;
      margin-bottom: 30px;
    }

    .invoice-section {
      padding: 25px;
      border-bottom: 1px solid #e9ecef;
    }

    .invoice-section:last-child {
      border-bottom: none;
    }

    .section-header {
      display: flex;
      align-items: center;
      gap: 12px;
      margin-bottom: 20px;
      padding-bottom: 12px;
      border-bottom: 2px solid var(--primary-light);
    }

    .section-header i {
      font-size: 20px;
      color: var(--primary-main);
      width: 30px;
      text-align: center;
    }

    .section-header h5 {
      margin: 0;
      font-size: 16px;
      font-weight: 700;
      color: var(--primary-dark);
    }

    .form-group {
      margin-bottom: 16px;
    }

    .form-label {
      display: block;
      margin-bottom: 6px;
      font-size: 13px;
      font-weight: 600;
      color: var(--dark);
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .form-label.required::after {
      content: " *";
      color: var(--danger);
    }

    .form-control {
      border: 1px solid var(--border);
      border-radius: 6px;
      padding: 10px 12px;
      font-size: 13px;
      transition: all 0.3s ease;
      background-color: white;
    }

    .form-control:focus {
      border-color: var(--primary-main);
      box-shadow: 0 0 0 3px rgba(21, 78, 158, 0.1);
      outline: none;
    }

    .form-control::placeholder {
      color: #adb5bd;
    }

    .input-group-text {
      background-color: var(--light);
      border: 1px solid var(--border);
      border-right: none;
      font-size: 13px;
      color: var(--text-muted);
    }

    .input-group .form-control {
      border-left: none;
    }

    .input-group .form-control:focus {
      border-left-color: var(--primary-main);
    }

    /* Two-column form layout */
    .form-row-2 {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
    }

    .form-row-3 {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap: 20px;
    }

    .form-row-4 {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr 1fr;
      gap: 20px;
    }

    /* Responsive grid */
    @media (max-width: 768px) {
      .form-row-2,
      .form-row-3,
      .form-row-4 {
        grid-template-columns: 1fr;
      }
    }

    /* Input info helper text */
    .form-text {
      display: block;
      margin-top: 4px;
      font-size: 12px;
      color: var(--text-muted);
    }

    /* Summary section */
    .summary-box {
      background: linear-gradient(135deg, var(--primary-lighter, #f0f5ff) 0%, #f9fbff 100%);
      border-left: 4px solid var(--primary-main);
      border-radius: 8px;
      padding: 18px;
      margin-bottom: 20px;
    }

    .summary-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px 0;
      border-bottom: 1px solid rgba(21, 78, 158, 0.1);
    }

    .summary-item:last-child {
      border-bottom: none;
    }

    .summary-item-label {
      font-size: 13px;
      color: var(--dark);
      font-weight: 500;
    }

    .summary-item-value {
      font-size: 13px;
      color: var(--primary-dark);
      font-weight: 600;
    }

    .summary-total {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 0;
      margin-top: 15px;
      padding-top: 15px;
      border-top: 2px solid var(--primary-main);
    }

    .summary-total-label {
      font-size: 16px;
      font-weight: 700;
      color: var(--primary-dark);
    }

    .summary-total-value {
      font-size: 24px;
      font-weight: 700;
      color: var(--primary-main);
    }

    /* Utility items list */
    .utility-list {
      background-color: #f8f9fa;
      border-radius: 6px;
      padding: 12px;
      margin-bottom: 12px;
      border: 1px dashed var(--border);
    }

    .utility-item {
      display: grid;
      grid-template-columns: 1fr 80px 80px 100px 50px;
      gap: 10px;
      align-items: center;
      padding: 12px;
      background: white;
      border-radius: 6px;
      margin-bottom: 10px;
      border: 1px solid var(--border);
    }

    .utility-item:last-child {
      margin-bottom: 0;
    }

    .utility-item-remove {
      background: none;
      border: none;
      color: var(--danger);
      cursor: pointer;
      font-size: 18px;
      padding: 0;
      transition: all 0.2s ease;
      text-align: center;
    }

    .utility-item-remove:hover {
      color: #c0392b;
      transform: scale(1.2);
    }

    .no-items-placeholder {
      text-align: center;
      padding: 20px;
      color: var(--text-muted);
      font-size: 13px;
    }

    /* Buttons */
    .btn-add-utility {
      background-color: transparent;
      border: 2px dashed var(--primary-main);
      color: var(--primary-main);
      padding: 10px 15px;
      border-radius: 6px;
      font-size: 13px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      width: 100%;
      margin-top: 10px;
    }

    .btn-add-utility:hover {
      background-color: var(--light);
      border-color: var(--primary-dark);
      color: var(--primary-dark);
    }

    /* Action buttons container */
    .form-actions {
      display: flex;
      gap: 12px;
      justify-content: flex-end;
      padding-top: 20px;
      border-top: 1px solid var(--border);
    }

    .form-actions .btn-custom {
      min-width: 120px;
    }

    /* Meter input group */
    .meter-input-group {
      display: grid;
      grid-template-columns: 80px 80px 80px auto;
      gap: 8px;
      align-items: flex-end;
    }

    .meter-usage {
      background-color: var(--light);
      padding: 8px 12px;
      border-radius: 6px;
      border: 1px solid var(--border);
      font-size: 13px;
      font-weight: 600;
      color: var(--primary-main);
      text-align: center;
    }

    .meter-total {
      background-color: #d5f4e6;
      padding: 8px 12px;
      border-radius: 6px;
      border: 1px solid var(--success);
      font-size: 13px;
      font-weight: 600;
      color: var(--success);
      text-align: center;
    }

    /* Notes textarea */
    .form-control.textarea-control {
      min-height: 80px;
      resize: vertical;
      font-family: inherit;
    }

    /* Status badge */
    .invoice-status-badge {
      display: inline-block;
      padding: 6px 12px;
      border-radius: 4px;
      font-size: 11px;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      background-color: #d5f4e6;
      color: var(--success);
    }

    /* Info alert */
    .invoice-info {
      background-color: #e3f2fd;
      border-left: 4px solid var(--primary-main);
      border-radius: 6px;
      padding: 12px 15px;
      margin-bottom: 20px;
      font-size: 13px;
      color: #0f3a77;
    }

    .invoice-info i {
      margin-right: 8px;
      color: var(--primary-main);
    }

    /* Date picker */
    input[type="date"].form-control,
    input[type="month"].form-control,
    input[type="time"].form-control {
      position: relative;
    }

    /* Select styling */
    select.form-control {
      appearance: none;
      background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23154e9e' d='M6 9L1 4h10z'/%3E%3C/svg%3E");
      background-repeat: no-repeat;
      background-position: right 10px center;
      padding-right: 32px;
      background-color: white;
    }

    /* Divider line */
    .divider {
      margin: 20px 0;
      border: none;
      border-top: 1px solid var(--border);
    }

    /* Highlight field */
    .form-group.highlight .form-control {
      background-color: #fffbea;
      border-color: var(--warning);
    }

    .form-group.highlight .form-label {
      color: var(--warning);
    }

    /* Loading state */
    .btn-custom.loading {
      opacity: 0.6;
      pointer-events: none;
    }

    .btn-custom.loading::after {
      content: "";
      display: inline-block;
      width: 14px;
      height: 14px;
      margin-left: 8px;
      border: 2px solid currentColor;
      border-radius: 50%;
      border-top-color: transparent;
      animation: spin 0.6s linear infinite;
    }

    @keyframes spin {
      to { transform: rotate(360deg); }
    }

    /* Card style alternative */
    .card-alternative {
      background-color: #f8f9fa;
      border: 1px solid var(--border);
      border-radius: 8px;
      padding: 15px;
      margin-bottom: 15px;
    }

    .card-alternative.highlight {
      background-color: #fffbea;
      border-color: var(--warning);
    }

    /* Responsive adjustments */
    @media (max-width: 1024px) {
      .invoice-section {
        padding: 20px;
      }

      .form-row-4 {
        grid-template-columns: 1fr 1fr;
      }

      .utility-item {
        grid-template-columns: 1fr 70px 70px 80px 40px;
        font-size: 12px;
      }
    }

    @media (max-width: 768px) {
      .invoice-form-container {
        margin-bottom: 20px;
      }

      .invoice-section {
        padding: 18px;
      }

      .section-header h5 {
        font-size: 15px;
      }

      .form-actions {
        flex-direction: column-reverse;
      }

      .form-actions .btn-custom {
        width: 100%;
        min-width: auto;
      }

      .summary-box {
        padding: 15px;
      }

      .utility-item {
        grid-template-columns: 1fr;
        gap: 8px;
      }

      .utility-item-remove {
        position: absolute;
        top: 8px;
        right: 8px;
      }

      .meter-input-group {
        grid-template-columns: 1fr;
      }
    }
  </style>
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
      <a href="invoices.jsp" class="nav-link active">
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
    <!-- Breadcrumb -->
    <div class="breadcrumb-nav">
      <a href="dashboard.jsp">Trang chủ</a> / <a href="invoices.jsp">Hóa đơn</a> / <span>Tạo hóa đơn</span>
    </div>

    <!-- Page Header -->
    <div class="page-header">
      <div>
        <h1 class="page-title"><i class="bi bi-file-earmark-plus"></i> Tạo Hóa Đơn Mới</h1>
        <p style="margin: 5px 0 0 0; color: var(--text-muted); font-size: 13px;">
          Tạo hóa đơn cho khách thuê phòng. Tất cả thông tin sẽ được lưu và có thể chỉnh sửa sau.
        </p>
      </div>
    </div>

    <!-- Info Alert -->
    <div class="invoice-info">
      <i class="bi bi-info-circle"></i>
      <strong>Hướng dẫn:</strong> Điền đầy đủ thông tin phòng và chi phí. Hệ thống sẽ tự động tính toán tổng cộng.
    </div>

    <!-- Invoice Form Container -->
    <div class="invoice-form-container">

      <!-- SECTION 1: BASIC INFORMATION -->
      <div class="invoice-section">
        <div class="section-header">
          <i class="bi bi-info-circle"></i>
          <h5>Thông Tin Cơ Bản</h5>
        </div>

        <div class="form-row-2">
          <div class="form-group">
            <label class="form-label required">Chọn Phòng</label>
            <select class="form-control" id="roomSelect" onchange="loadRoomInfo()">
              <option value="">-- Chọn phòng --</option>
              <option value="P101">P101 - Tầng 1 (3.500.000 VND/tháng)</option>
              <option value="P102">P102 - Tầng 1 (3.500.000 VND/tháng)</option>
              <option value="P103">P103 - Tầng 1 (3.500.000 VND/tháng)</option>
              <option value="P104">P104 - Tầng 1 (3.500.000 VND/tháng)</option>
              <option value="P201">P201 - Tầng 2 (4.000.000 VND/tháng)</option>
              <option value="P202">P202 - Tầng 2 (4.000.000 VND/tháng)</option>
              <option value="P203">P203 - Tầng 2 (4.000.000 VND/tháng)</option>
              <option value="P204">P204 - Tầng 2 (4.000.000 VND/tháng)</option>
              <option value="P205">P205 - Tầng 2 (4.500.000 VND/tháng)</option>
              <option value="P301">P301 - Tầng 3 (4.500.000 VND/tháng)</option>
              <option value="P302">P302 - Tầng 3 (4.500.000 VND/tháng)</option>
              <option value="P303">P303 - Tầng 3 (5.000.000 VND/tháng)</option>
            </select>
            <small class="form-text">Chọn phòng để tự động tải thông tin khách thuê</small>
          </div>

          <div class="form-group">
            <label class="form-label required">Kỳ Thanh Toán</label>
            <input type="month" class="form-control" id="billingPeriod" value="2026-02">
            <small class="form-text">Tháng/năm cho hóa đơn này</small>
          </div>
        </div>

        <div class="form-row-2">
          <div class="form-group">
            <label class="form-label">Người Thuê</label>
            <input type="text" class="form-control" id="tenantName" placeholder="Tự động tải" readonly>
          </div>

          <div class="form-group">
            <label class="form-label">Số Điện Thoại</label>
            <input type="text" class="form-control" id="tenantPhone" placeholder="Tự động tải" readonly>
          </div>
        </div>

        <div class="form-row-2">
          <div class="form-group">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" id="tenantEmail" placeholder="Tự động tải" readonly>
          </div>

          <div class="form-group">
            <label class="form-label">Số CMND/Passport</label>
            <input type="text" class="form-control" id="tenantIdNumber" placeholder="Tự động tải" readonly>
          </div>
        </div>
      </div>

      <!-- SECTION 2: ROOM CHARGES -->
      <div class="invoice-section">
        <div class="section-header">
          <i class="bi bi-door-closed"></i>
          <h5>Chi Phí Phòng</h5>
        </div>

        <div class="card-alternative">
          <div class="form-row-3">
            <div class="form-group">
              <label class="form-label">Giá Phòng/Tháng (VND)</label>
              <div class="input-group">
                <input type="number" class="form-control" id="roomPrice" value="3500000" onchange="calculateTotal()">
                <span class="input-group-text">VND</span>
              </div>
            </div>

            <div class="form-group">
              <label class="form-label">Số Ngày Thuê</label>
              <input type="number" class="form-control" id="rentalDays" value="30" min="1" max="31" onchange="calculateTotal()">
            </div>

            <div class="form-group">
              <label class="form-label">Thành Tiền</label>
              <div class="input-group">
                <input type="text" class="form-control" id="roomTotal" readonly value="3.500.000" style="background-color: #d5f4e6; font-weight: 600; color: var(--success);">
                <span class="input-group-text" style="background-color: #d5f4e6; color: var(--success);">VND</span>
              </div>
            </div>
          </div>
        </div>

        <small class="form-text">
          <i class="bi bi-lightbulb"></i> Giá phòng sẽ được tính theo số ngày thuê. Thay đổi giá nếu cần điều chỉnh.
        </small>
      </div>

      <!-- SECTION 3: UTILITIES -->
      <div class="invoice-section">
        <div class="section-header">
          <i class="bi bi-lightning-fill"></i>
          <h5>Dịch Vụ Tiện Ích</h5>
        </div>

        <!-- Electricity -->
        <div style="margin-bottom: 25px;">
          <h6 style="font-size: 13px; font-weight: 600; color: var(--dark); margin-bottom: 12px; display: flex; align-items: center; gap: 8px;">
            <i class="bi bi-lightning-charge" style="color: #f39c12; font-size: 16px;"></i> Điện
          </h6>
          <div class="meter-input-group">
            <div class="form-group" style="margin-bottom: 0;">
              <label class="form-label" style="font-size: 12px;">Chỉ Số Cũ</label>
              <input type="number" class="form-control" id="electricMeterOld" value="0" onchange="calculateElectric()">
            </div>
            <div class="form-group" style="margin-bottom: 0;">
              <label class="form-label" style="font-size: 12px;">Chỉ Số Mới</label>
              <input type="number" class="form-control" id="electricMeterNew" value="0" onchange="calculateElectric()">
            </div>
            <div class="form-group" style="margin-bottom: 0;">
              <label class="form-label" style="font-size: 12px;">Đơn Giá (VND)</label>
              <input type="number" class="form-control" id="electricPrice" value="3500" onchange="calculateElectric()">
            </div>
            <div class="form-group" style="margin-bottom: 0;">
              <div class="meter-total" id="electricTotal">0 VND</div>
            </div>
          </div>
          <small class="form-text">Tiêu thụ: <span id="electricUsage" style="font-weight: 600; color: var(--primary-main);">0</span> kWh</small>
        </div>

        <!-- Water -->
        <div style="margin-bottom: 25px;">
          <h6 style="font-size: 13px; font-weight: 600; color: var(--dark); margin-bottom: 12px; display: flex; align-items: center; gap: 8px;">
            <i class="bi bi-droplet-fill" style="color: #3498db; font-size: 16px;"></i> Nước
          </h6>
          <div class="meter-input-group">
            <div class="form-group" style="margin-bottom: 0;">
              <label class="form-label" style="font-size: 12px;">Chỉ Số Cũ</label>
              <input type="number" class="form-control" id="waterMeterOld" value="0" onchange="calculateWater()">
            </div>
            <div class="form-group" style="margin-bottom: 0;">
              <label class="form-label" style="font-size: 12px;">Chỉ Số Mới</label>
              <input type="number" class="form-control" id="waterMeterNew" value="0" onchange="calculateWater()">
            </div>
            <div class="form-group" style="margin-bottom: 0;">
              <label class="form-label" style="font-size: 12px;">Đơn Giá (VND)</label>
              <input type="number" class="form-control" id="waterPrice" value="20000" onchange="calculateWater()">
            </div>
            <div class="form-group" style="margin-bottom: 0;">
              <div class="meter-total" id="waterTotal">0 VND</div>
            </div>
          </div>
          <small class="form-text">Tiêu thụ: <span id="waterUsage" style="font-weight: 600; color: var(--primary-main);">0</span> m³</small>
        </div>

        <!-- Internet/Other Utilities -->
        <div style="margin-bottom: 25px;">
          <h6 style="font-size: 13px; font-weight: 600; color: var(--dark); margin-bottom: 12px; display: flex; align-items: center; gap: 8px;">
            <i class="bi bi-wifi" style="color: #9b59b6; font-size: 16px;"></i> Internet & Dịch Vụ Khác
          </h6>
          <div id="utilityList" class="utility-list">
            <div class="no-items-placeholder">
              <i class="bi bi-inbox"></i> Chưa có dịch vụ nào
            </div>
          </div>
          <button type="button" class="btn-add-utility" onclick="addUtilityRow()">
            <i class="bi bi-plus-circle"></i> Thêm Dịch Vụ Khác
          </button>
        </div>
      </div>

      <!-- SECTION 4: DEPOSITS & REFUNDS -->
      <div class="invoice-section">
        <div class="section-header">
          <i class="bi bi-wallet2"></i>
          <h5>Tiền Cọc & Hoàn Trả</h5>
        </div>

        <div class="form-row-3">
          <div class="form-group">
            <label class="form-label">Tiền Cọc Ban Đầu (VND)</label>
            <div class="input-group">
              <input type="number" class="form-control" id="depositAmount" value="0" onchange="calculateTotal()">
              <span class="input-group-text">VND</span>
            </div>
            <small class="form-text">Số tiền cọc khi ký hợp đồng</small>
          </div>

          <div class="form-group">
            <label class="form-label">Tiền Hoàn Lại (VND)</label>
            <div class="input-group">
              <input type="number" class="form-control" id="refundAmount" value="0" onchange="calculateTotal()">
              <span class="input-group-text">VND</span>
            </div>
            <small class="form-text">Tiền hoàn lại cho khách</small>
          </div>

          <div class="form-group">
            <label class="form-label">Các Khoản Khác (VND)</label>
            <div class="input-group">
              <input type="number" class="form-control" id="otherAmount" value="0" onchange="calculateTotal()">
              <span class="input-group-text">VND</span>
            </div>
            <small class="form-text">Tiền phạt, vệ sinh, v.v.</small>
          </div>
        </div>
      </div>

      <!-- SECTION 5: SUMMARY -->
      <div class="invoice-section">
        <div class="section-header">
          <i class="bi bi-calculator"></i>
          <h5>Tóm Tắt Chi Phí</h5>
        </div>

        <div class="summary-box">
          <div class="summary-item">
            <span class="summary-item-label">Tiền Phòng:</span>
            <span class="summary-item-value" id="summaryRoomPrice">0 VND</span>
          </div>
          <div class="summary-item">
            <span class="summary-item-label">Tiền Điện:</span>
            <span class="summary-item-value" id="summaryElectric">0 VND</span>
          </div>
          <div class="summary-item">
            <span class="summary-item-label">Tiền Nước:</span>
            <span class="summary-item-value" id="summaryWater">0 VND</span>
          </div>
          <div class="summary-item">
            <span class="summary-item-label">Dịch Vụ Khác:</span>
            <span class="summary-item-value" id="summaryOtherServices">0 VND</span>
          </div>
          <div class="summary-item">
            <span class="summary-item-label">Tiền Cọc:</span>
            <span class="summary-item-value" id="summaryDeposit">0 VND</span>
          </div>
          <div class="summary-item">
            <span class="summary-item-label">Tiền Hoàn Lại:</span>
            <span class="summary-item-value" id="summaryRefund" style="color: var(--danger);">-0 VND</span>
          </div>
          <div class="summary-item">
            <span class="summary-item-label">Khoản Khác:</span>
            <span class="summary-item-value" id="summaryOther">0 VND</span>
          </div>
          <div class="summary-total">
            <span class="summary-total-label">Tổng Thanh Toán:</span>
            <span class="summary-total-value" id="totalAmount">0 VND</span>
          </div>
        </div>
      </div>

      <!-- SECTION 6: NOTES & PAYMENT METHOD -->
      <div class="invoice-section">
        <div class="section-header">
          <i class="bi bi-chat-left-text"></i>
          <h5>Ghi Chú & Phương Thức Thanh Toán</h5>
        </div>

        <div class="form-group">
          <label class="form-label">Ghi Chú Hóa Đơn</label>
          <textarea class="form-control textarea-control" id="invoiceNotes" placeholder="Ghi chú thêm về hóa đơn (nếu cần)..."></textarea>
          <small class="form-text">Ví dụ: Thanh toán trễ, chiết khấu, điều kiện đặc biệt, v.v.</small>
        </div>

        <div class="form-row-2">
          <div class="form-group">
            <label class="form-label required">Phương Thức Thanh Toán</label>
            <select class="form-control" id="paymentMethod">
              <option value="">-- Chọn phương thức --</option>
              <option value="cash">Tiền Mặt</option>
              <option value="bank_transfer">Chuyển Khoản Ngân Hàng</option>
              <option value="e_wallet">Ví Điện Tử</option>
              <option value="check">Séc/Phiếu</option>
              <option value="mixed">Hỗn Hợp</option>
            </select>
          </div>

          <div class="form-group">
            <label class="form-label">Ngày Thanh Toán Dự Kiến</label>
            <input type="date" class="form-control" id="expectedPaymentDate">
            <small class="form-text">Ngày hạn thanh toán</small>
          </div>
        </div>
      </div>

      <!-- SECTION 7: ADDITIONAL INFORMATION -->
      <div class="invoice-section">
        <div class="section-header">
          <i class="bi bi-file-text"></i>
          <h5>Thông Tin Bổ Sung</h5>
        </div>

        <div class="form-row-2">
          <div class="form-group">
            <label class="form-label">Tên Người Tạo Hóa Đơn</label>
            <input type="text" class="form-control" id="createdBy" placeholder="Nhập tên của bạn" value="Chủ trọ">
          </div>

          <div class="form-group">
            <label class="form-label">Ngày Tạo Hóa Đơn</label>
            <input type="date" class="form-control" id="invoiceDate" value="2026-02-20">
          </div>
        </div>

        <div class="form-group">
          <label class="form-label">Mô Tả Hóa Đơn</label>
          <textarea class="form-control textarea-control" id="invoiceDescription" placeholder="Mô tả chi tiết nội dung hóa đơn..."></textarea>
          <small class="form-text">Tùy chọn: Thêm mô tả chi tiết cho hóa đơn này</small>
        </div>
      </div>

      <!-- Action Buttons -->
      <div class="invoice-section" style="background-color: #f8f9fa;">
        <div class="form-actions">
          <button type="button" class="btn-custom btn-outline" onclick="resetForm()">
            <i class="bi bi-arrow-clockwise"></i> Đặt Lại
          </button>
          <button type="button" class="btn-custom btn-secondary" onclick="saveDraft()">
            <i class="bi bi-cloud-check"></i> Lưu Nháp
          </button>
          <button type="button" class="btn-custom btn-primary-custom" onclick="previewInvoice()">
            <i class="bi bi-eye"></i> Xem Trước
          </button>
          <button type="button" class="btn-custom btn-success" onclick="submitInvoice()">
            <i class="bi bi-check-lg"></i> Tạo Hóa Đơn
          </button>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // ========================================
  // Initialize
  // ========================================
  document.addEventListener('DOMContentLoaded', function() {
    loadRoomInfo();
    setDefaultDates();
    calculateTotal();
  });

  // ========================================
  // Room Data (Mock Data)
  // ========================================
  const roomsData = {
    'P101': { tenant: 'Nguyễn Văn A', phone: '0912345678', email: 'nguyenvana@email.com', id: '123456789', price: 3500000 },
    'P102': { tenant: 'Phạm Thị B', phone: '0912345679', email: 'phamthib@email.com', id: '987654321', price: 3500000 },
    'P103': { tenant: 'Trần Văn C', phone: '0912345680', email: 'tranvanc@email.com', id: '456789123', price: 3500000 },
    'P104': { tenant: 'Hoàng Thị D', phone: '0912345681', email: 'hoangthid@email.com', id: '789123456', price: 3500000 },
    'P201': { tenant: 'Lê Văn E', phone: '0912345682', email: 'levane@email.com', id: '321654987', price: 4000000 },
    'P202': { tenant: 'Dương Thị F', phone: '0912345683', email: 'duongthif@email.com', id: '654987321', price: 4000000 },
    'P203': { tenant: 'Bùi Văn G', phone: '0912345684', email: 'buivang@email.com', id: '159753456', price: 4000000 },
    'P204': { tenant: 'Văn Thị H', phone: '0912345685', email: 'vanthih@email.com', id: '753159456', price: 4000000 },
    'P205': { tenant: 'Nông Văn I', phone: '0912345686', email: 'nongvani@email.com', id: '357951456', price: 4500000 },
    'P301': { tenant: 'Mạc Thị K', phone: '0912345687', email: 'macthik@email.com', id: '456753159', price: 4500000 },
    'P302': { tenant: 'Phan Văn L', phone: '0912345688', email: 'phanvanl@email.com', id: '951357456', price: 4500000 },
    'P303': { tenant: 'Tạ Thị M', phone: '0912345689', email: 'tathim@email.com', id: '789456123', price: 5000000 }
  };

  // ========================================
  // Load Room Information
  // ========================================
  function loadRoomInfo() {
    const roomSelect = document.getElementById('roomSelect').value;
    if (roomSelect && roomsData[roomSelect]) {
      const room = roomsData[roomSelect];
      document.getElementById('tenantName').value = room.tenant;
      document.getElementById('tenantPhone').value = room.phone;
      document.getElementById('tenantEmail').value = room.email;
      document.getElementById('tenantIdNumber').value = room.id;
      document.getElementById('roomPrice').value = room.price;
      calculateTotal();
    } else {
      document.getElementById('tenantName').value = '';
      document.getElementById('tenantPhone').value = '';
      document.getElementById('tenantEmail').value = '';
      document.getElementById('tenantIdNumber').value = '';
    }
  }

  // ========================================
  // Calculate Functions
  // ========================================
  function calculateTotal() {
    const roomPrice = parseFloat(document.getElementById('roomPrice').value) || 0;
    const rentalDays = parseFloat(document.getElementById('rentalDays').value) || 0;
    const roomTotal = (roomPrice / 30) * rentalDays;

    document.getElementById('roomTotal').value = formatCurrency(roomTotal);
    document.getElementById('summaryRoomPrice').textContent = formatCurrency(roomTotal) + ' VND';

    updateGrandTotal();
  }

  function calculateElectric() {
    const meterOld = parseFloat(document.getElementById('electricMeterOld').value) || 0;
    const meterNew = parseFloat(document.getElementById('electricMeterNew').value) || 0;
    const price = parseFloat(document.getElementById('electricPrice').value) || 0;
    const usage = meterNew - meterOld;
    const total = usage * price;

    document.getElementById('electricUsage').textContent = usage;
    document.getElementById('electricTotal').textContent = formatCurrency(total) + ' VND';
    document.getElementById('summaryElectric').textContent = formatCurrency(total) + ' VND';

    updateGrandTotal();
  }

  function calculateWater() {
    const meterOld = parseFloat(document.getElementById('waterMeterOld').value) || 0;
    const meterNew = parseFloat(document.getElementById('waterMeterNew').value) || 0;
    const price = parseFloat(document.getElementById('waterPrice').value) || 0;
    const usage = meterNew - meterOld;
    const total = usage * price;

    document.getElementById('waterUsage').textContent = usage;
    document.getElementById('waterTotal').textContent = formatCurrency(total) + ' VND';
    document.getElementById('summaryWater').textContent = formatCurrency(total) + ' VND';

    updateGrandTotal();
  }

  function updateGrandTotal() {
    const roomTotal = parseFloat(document.getElementById('roomTotal').value.replace(/\D/g, '')) || 0;
    const electricTotal = parseFloat(document.getElementById('electricTotal').textContent.replace(/\D/g, '')) || 0;
    const waterTotal = parseFloat(document.getElementById('waterTotal').textContent.replace(/\D/g, '')) || 0;
    const otherServices = calculateOtherServices();
    const deposit = parseFloat(document.getElementById('depositAmount').value) || 0;
    const refund = parseFloat(document.getElementById('refundAmount').value) || 0;
    const other = parseFloat(document.getElementById('otherAmount').value) || 0;

    document.getElementById('summaryDeposit').textContent = formatCurrency(deposit) + ' VND';
    document.getElementById('summaryRefund').textContent = '-' + formatCurrency(refund) + ' VND';
    document.getElementById('summaryOther').textContent = formatCurrency(other) + ' VND';
    document.getElementById('summaryOtherServices').textContent = formatCurrency(otherServices) + ' VND';

    const total = roomTotal + electricTotal + waterTotal + otherServices + deposit - refund + other;
    document.getElementById('totalAmount').textContent = formatCurrency(total) + ' VND';
  }

  function calculateOtherServices() {
    let total = 0;
    const utilities = document.querySelectorAll('.utility-item');
    utilities.forEach(item => {
      const amount = parseFloat(item.querySelector('input[name="utilityCost"]').value) || 0;
      total += amount;
    });
    return total;
  }

  // ========================================
  // Utility Functions
  // ========================================
  function addUtilityRow() {
    const list = document.getElementById('utilityList');

    // Remove placeholder if exists
    const placeholder = list.querySelector('.no-items-placeholder');
    if (placeholder) {
      placeholder.remove();
    }

    const utilityId = Date.now();
    const html = `
      <div class="utility-item" id="utility-${utilityId}">
        <input type="text" class="form-control" placeholder="Tên dịch vụ (Internet, Vệ sinh, v.v.)" name="utilityName">
        <input type="number" class="form-control" placeholder="Số lượng" name="utilityQuantity" value="1">
        <input type="number" class="form-control" placeholder="Đơn giá" name="utilityPrice" value="0" onchange="updateGrandTotal()">
        <div class="form-control" style="background-color: #d5f4e6; padding: 8px 12px; border: 1px solid var(--success); text-align: center; font-weight: 600; color: var(--success);">
          <span class="utility-cost">0 VND</span>
        </div>
        <button type="button" class="utility-item-remove" onclick="removeUtility(${utilityId})">
          <i class="bi bi-trash"></i>
        </button>
      </div>
    `;

    list.insertAdjacentHTML('beforeend', html);

    // Add event listener to calculate cost
    const item = document.getElementById(`utility-${utilityId}`);
    item.querySelector('input[name="utilityQuantity"]').addEventListener('change', function() {
      calculateUtilityCost(utilityId);
    });
    item.querySelector('input[name="utilityPrice"]').addEventListener('change', function() {
      calculateUtilityCost(utilityId);
    });
  }

  function calculateUtilityCost(utilityId) {
    const item = document.getElementById(`utility-${utilityId}`);
    const quantity = parseFloat(item.querySelector('input[name="utilityQuantity"]').value) || 0;
    const price = parseFloat(item.querySelector('input[name="utilityPrice"]').value) || 0;
    const cost = quantity * price;

    item.querySelector('input[name="utilityCost"]').value = cost;
    item.querySelector('.utility-cost').textContent = formatCurrency(cost) + ' VND';

    updateGrandTotal();
  }

  function removeUtility(utilityId) {
    const item = document.getElementById(`utility-${utilityId}`);
    item.remove();

    const list = document.getElementById('utilityList');
    if (list.querySelectorAll('.utility-item').length === 0) {
      list.innerHTML = '<div class="no-items-placeholder"><i class="bi bi-inbox"></i> Chưa có dịch vụ nào</div>';
    }

    updateGrandTotal();
  }

  // ========================================
  // Format Currency
  // ========================================
  function formatCurrency(value) {
    return new Intl.NumberFormat('vi-VN').format(Math.round(value));
  }

  // ========================================
  // Set Default Dates
  // ========================================
  function setDefaultDates() {
    const today = new Date();
    const dateString = today.toISOString().split('T')[0];
    document.getElementById('invoiceDate').value = dateString;
    document.getElementById('expectedPaymentDate').value = dateString;
  }

  // ========================================
  // Form Actions
  // ========================================
  function resetForm() {
    if (confirm('Bạn chắc chắn muốn đặt lại toàn bộ biểu mẫu?')) {
      document.querySelectorAll('.form-control, .form-control').forEach(input => {
        input.value = '';
      });
      loadRoomInfo();
      setDefaultDates();
    }
  }

  function saveDraft() {
    alert('Hóa đơn đã được lưu nháp. Bạn có thể tiếp tục chỉnh sửa sau.');
    // Logic lưu nháp sẽ được thêm ở backend
  }

  function previewInvoice() {
    alert('Xem trước hóa đơn. Tính năng này sẽ mở trong tab mới.');
    // Logic xem trước sẽ được thêm ở backend
  }

  function submitInvoice() {
    const roomSelect = document.getElementById('roomSelect').value;
    const billingPeriod = document.getElementById('billingPeriod').value;

    if (!roomSelect) {
      alert('Vui lòng chọn phòng!');
      return;
    }

    if (!billingPeriod) {
      alert('Vui lòng chọn kỳ thanh toán!');
      return;
    }

    alert('Hóa đơn đã được tạo thành công! Mã hóa đơn: HĐ-2026-02-001');
    // Logic tạo hóa đơn sẽ được thêm ở backend
  }

  // ========================================
  // Profile Menu
  // ========================================
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

