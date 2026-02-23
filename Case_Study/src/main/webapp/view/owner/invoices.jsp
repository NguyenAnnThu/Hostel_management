<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hóa đơn - Quản Lý Nhà Trọ</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/view/owner/assets/styles.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <style>
    .add{
      display:flex;
      justify-content: space-around;
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
      <li class="nav-item" s>
        <a href="${pageContext.request.contextPath}/dashboard" class="nav-link ">
          <i class="bi bi-speedometer2"></i> Dashboard
        </a>
      </li>
      <li class="nav-item">
        <a href="${pageContext.request.contextPath}/rooms" class="nav-link ">
          <i class="bi bi-door-closed"></i> Phòng
        </a>
      </li>
      <li class="nav-item">
        <a href="${pageContext.request.contextPath}/bookings" class="nav-link">
          <i class="bi bi-calendar-check"></i> Đặt phòng
        </a>
      </li>
      <li class="nav-item">
        <a href="${pageContext.request.contextPath}/contract" class="nav-link">
          <i class="bi bi-file-earmark-text"></i> Hợp đồng
        </a>
      </li>
      <li class="nav-item">
        <a href="${pageContext.request.contextPath}/utilities" class="nav-link">
          <i class="bi bi-lightning-fill"></i> Điện nước
        </a>
      </li>
      <li class="nav-item">
        <a href="${pageContext.request.contextPath}/invoices" class="nav-link active">
          <i class="bi bi-receipt"></i> Hóa đơn
        </a>
      </li>
      <li class="nav-item">
        <a href="${pageContext.request.contextPath}/services" class="nav-link">
          <i class="bi bi-gear"></i> Dịch vụ
        </a>
      </li>
      <li class="nav-item">
        <a href="${pageContext.request.contextPath}/users" class="nav-link">
          <i class="bi bi-people"></i> Người dùng
        </a>
      </li>
      <li class="nav-item">
        <a href="${pageContext.request.contextPath}/reports" class="nav-link">
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
        <a href="dashboard.jsp">Trang chủ</a> / <span>Hóa đơn</span>
      </div>

      <div class="page-header">
        <h1 class="page-title">Quản lý Hóa đơn</h1>
      </div>

      <!-- Filters -->
      <div class="filter-section">
        <div class="filter-group">
          <label>Tháng/Năm</label>
          <input type="month" class="form-control" value="2025-01">
        </div>
        <div class="filter-group">
          <label>Trạng thái</label>
          <select id="statusFilter" class="form-control">
            <option value="">-- Chọn trạng thái --</option>
            <option value="chưa">Chưa thu</option>
            <option value="đã">Đã thu</option>
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
        <div class="filter-group">
          <label>Mã hóa đơn</label>
          <input type="text" class="form-control" id="invoiceSearch" placeholder="Tìm mã HĐ">
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

      <!-- Note -->
      <div class="page-header d-flex justify-content-between align-items-center mb-3">
        <p>*Lưu ý khi tạo hóa đơn</p>
        <button class="btn btn-primary" onclick="openCreateModal()">
          <i class="bi bi-plus-lg"></i> Tạo hóa đơn
        </button>
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
                <th>Kỳ</th>
                <th>Tổng tiền (VND)</th>
                <th>Trạng thái</th>
                <th>Ngày tạo</th>
                <th>Thao tác</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="inv" items="${invoices}">
              <tr>
                <td><strong>HĐ${inv.invoiceId}</strong></td>
                <td>${inv.roomId}</td>
                <td>${inv.customerId}</td>
                <td>
                  <fmt:formatNumber value="${inv.month}" minIntegerDigits="2"/>/${inv.year}
                </td>
                <td>
                  <!-- tạm để 0, sau này join detail -->
                  0
                </td>

                <td>
                  <c:choose>
                    <c:when test="${inv.status == 'PAID'}">
                      <span class="badge-custom badge-success">Đã thu</span>
                    </c:when>
                    <c:otherwise>
                      <span class="badge-custom badge-info">Chưa thu</span>
                    </c:otherwise>
                  </c:choose>
                </td>

                <td>
                  <fmt:formatDate value="${inv.createdAt}" pattern="dd/MM/yyyy"/>
                </td>

                <td>
                  <div class="action-buttons">
                    <a href="${pageContext.request.contextPath}/invoice-detail?id=${inv.invoiceId}"
                       class="btn-custom btn-primary-custom">Xem</a>

                    <c:if test="${inv.status != 'PAID'}">
                      <button class="btn-custom btn-success"
                              onclick="markAsPaid('HĐ${inv.invoiceId}')">
                        Đã thu
                      </button>
                    </c:if>
                  </div>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <!-- Payment Modal -->
  <div class="modal-overlay" id="paymentModal">
    <div class="modal-content" style="max-width: 550px;">
      <div class="modal-header">
        <h5 id="paymentTitle">Đánh dấu hóa đơn đã thu</h5>
        <button class="modal-close-btn" onclick="closePaymentModal()">×</button>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label class="form-label">Mã hóa đơn</label>
          <input type="text" class="form-control" id="invoiceCode" disabled>
        </div>
        <div class="form-group">
          <label class="form-label">Ngày xác nhận</label>
          <input type="date" class="form-control" id="confirmDate">
        </div>
        <div class="form-group">
          <label class="form-label">Người xác nhận</label>
          <input type="text" class="form-control" placeholder="Tên người xác nhận">
        </div>
        <div class="form-group">
          <label class="form-label">Ghi chú</label>
          <textarea class="form-control" rows="3" placeholder="Ghi chú thêm (tuỳ chọn)"></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn-custom btn-secondary" onclick="closePaymentModal()">Hủy</button>
        <button class="btn-custom btn-success" onclick="confirmPayment()">Xác nhận đã thu</button>
      </div>
    </div>
  </div>

  <!-- Info Modal -->
  <div class="modal-overlay" id="infoModal">
    <div class="modal-content" style="max-width: 550px;">
      <div class="modal-header">
        <h5>Thông tin thanh toán</h5>
        <button class="modal-close-btn" onclick="closeInfoModal()">×</button>
      </div>
      <div class="modal-body">
        <div style="display: grid; gap: 12px;">
          <div>
            <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600;">Mã xác nhận</div>
            <div style="font-size: 14px; color: #2c3e50;">XN20250120001</div>
          </div>
          <div>
            <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600;">Ngày xác nhận</div>
            <div style="font-size: 14px; color: #2c3e50;">20/01/2025</div>
          </div>
          <div>
            <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600;">Người xác nhận</div>
            <div style="font-size: 14px; color: #2c3e50;">Chủ trọ</div>
          </div>
          <div>
            <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600;">Ghi chú</div>
            <div style="font-size: 14px; color: #2c3e50;">Thanh toán bằng tiền mặt</div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn-custom btn-secondary" onclick="closeInfoModal()">Đóng</button>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  <div class="modal-overlay" id="createInvoiceModal">
    <div class="modal-content" style="max-width: 700px;">
      <form method="post" action="${pageContext.request.contextPath}/invoices">
        <div class="modal-header">
          <h5>Tạo hóa đơn</h5>
          <button type="button" class="modal-close-btn"
                  onclick="closeCreateModal()">×</button>
        </div>

        <div class="modal-body">

          <div class="row">
            <div class="col-md-6">
              <label class="form-label">Phòng</label>
              <input name="roomId" class="form-control" required>
            </div>

            <div class="col-md-6">
              <label class="form-label">Người thuê</label>
              <input name="customerId" class="form-control" required>
            </div>
          </div>

          <div class="row mt-2">
            <div class="col-md-6">
              <label class="form-label">Tháng</label>
              <input type="number" name="month" min="1" max="12"
                     class="form-control" required>
            </div>

            <div class="col-md-6">
              <label class="form-label">Năm</label>
              <input type="number" name="year" value="2025"
                     class="form-control" required>
            </div>
          </div>

          <hr>

          <h6>Dịch vụ</h6>

          <!-- 1 dòng dịch vụ -->
          <div class="row">
            <div class="col-md-4">
              <input name="serviceCode" class="form-control"
                     placeholder="Mã DV" required>
            </div>
            <div class="col-md-4">
              <input name="quantity" type="number"
                     class="form-control" placeholder="Số lượng" required>
            </div>
            <div class="col-md-4">
              <input name="unitPrice" type="number"
                     class="form-control" placeholder="Đơn giá" required>
            </div>
          </div>

        </div>

        <div class="modal-footer">
          <button type="button"
                  class="btn-custom btn-secondary"
                  onclick="closeCreateModal()">Hủy</button>
          <button type="submit"
                  class="btn-custom btn-primary-custom">Tạo hóa đơn</button>
        </div>
      </form>
    </div>
  </div>
  <script>
    function openCreateModal() {
      document.getElementById('modalTitle').innerText = 'Tạo hóa đơn';
      form.reset();
      document.getElementById('invoicesCode').value = '';
      modal.show();
    }

    // Set today's date
    document.getElementById('confirmDate').valueAsDate = new Date();

    function markAsPaid(invoiceCode) {
      document.getElementById('invoiceCode').value = invoiceCode;
      document.getElementById('paymentModal').classList.add('show');
    }

    function closePaymentModal() {
      document.getElementById('paymentModal').classList.remove('show');
    }

    function confirmPayment() {
      alert('Hóa đơn đã được đánh dấu "Đã thu" thành công!');
      closePaymentModal();
      location.reload();
    }

    function viewPaymentInfo() {
      document.getElementById('infoModal').classList.add('show');
    }

    function closeInfoModal() {
      document.getElementById('infoModal').classList.remove('show');
    }

    function resetFilters() {
      document.getElementById('statusFilter').value = '';
      document.getElementById('roomFilter').value = '';
      document.getElementById('invoiceSearch').value = '';
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

    document.getElementById('paymentModal').addEventListener('click', function(e) {
      if (e.target === this) {
        closePaymentModal();
      }
    });

    document.getElementById('infoModal').addEventListener('click', function(e) {
      if (e.target === this) {
        closeInfoModal();
      }
    });
    function openCreateModal() {
      document.getElementById('createInvoiceModal').classList.add('show');
    }

    function closeCreateModal() {
      document.getElementById('createInvoiceModal').classList.remove('show');
    }
  </script>
</body>
</html>
