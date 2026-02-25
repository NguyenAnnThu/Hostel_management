<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đặt phòng - Quản Lý Nhà Trọ</title>
  <c:import url="../layout/library.jsp"/>
</head>
<body>
<c:import url="../layout/sidebar.jsp"/>

<div class="main-wrapper">
  <c:import url="../layout/topbar.jsp"/>

  <div class="main-content">
    <div class="breadcrumb-nav">
      <a href="dashboard.jsp">Trang chủ</a> / <span>Đặt phòng</span>
    </div>
    <div class="page-header">
      <h1 class="page-title">Quản lý Đặt phòng</h1>
    </div>

    <!-- Filters -->
    <div class="filter-section">
      <form action="${pageContext.request.contextPath}/owner/bookings" method="get"
            style="display:flex; flex-wrap:wrap; gap:inherit; align-items:flex-end; width:100%">
        <input type="hidden" name="action" value="filter">

        <div class="filter-group">
          <label>Trạng thái</label>
          <select name="searchStatus" class="form-control">
            <option value="">-- Chọn trạng thái --</option>
            <c:forEach var="s" items="${statusList}">
              <option value="${s}" ${selectedStatus == s ? 'selected' : ''}>
                <c:choose>
                  <c:when test="${s == 'confirmed'}">Xác nhận</c:when>
                  <c:when test="${s == 'cancelled'}">Đã hủy</c:when>
                  <c:when test="${s == 'expired'}">Hết hạn</c:when>
                  <c:otherwise>${s}</c:otherwise>
                </c:choose>
              </option>
            </c:forEach>
          </select>
        </div>

        <div class="filter-group">
          <label>Tìm phòng / khách</label>
          <input type="text" name="searchKeyword" class="form-control"
                 placeholder="Mã phòng hoặc tên khách"
                 value="${searchKeyword}">
        </div>

        <div class="filter-actions">
          <button type="submit" class="btn-custom btn-primary-custom">
            <i class="bi bi-funnel"></i> Lọc
          </button>
          <button type="button" class="btn-custom btn-outline"
                  onclick="window.location.href='${pageContext.request.contextPath}/owner/bookings'">
            <i class="bi bi-arrow-clockwise"></i> Đặt lại
          </button>
        </div>
      </form>
    </div>

    <!-- Table -->
    <div class="card-custom">
      <div class="table-responsive">
        <table class="table-custom">
          <thead>
          <tr>
            <th>Mã đặt</th>
            <th>Phòng</th>
            <th>Khách thuê</th>
            <th>Ngày đặt</th>
            <th>Hạn</th>
            <th>Trạng thái</th>
            <th>Thao tác</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="b" items="${bookings}">
            <tr>
              <td><strong>#${b.bookingId}</strong></td>
              <td>${b.roomId}</td>
              <td>${b.customerName} (${b.customerPhone})</td>
              <td><fmt:formatDate value="${b.bookingDate}" pattern="dd/MM/yyyy"/></td>
              <td><fmt:formatDate value="${b.expireDate}"  pattern="dd/MM/yyyy"/></td>
              <td>
                <c:choose>
                  <c:when test="${b.status == 'confirmed'}">
                    <span class="badge-custom badge-success">Xác nhận</span>
                  </c:when>
                  <c:when test="${b.status == 'cancelled'}">
                    <span class="badge-custom badge-light">Đã hủy</span>
                  </c:when>
                  <c:when test="${b.status == 'expired'}">
                    <span class="badge-custom badge-danger">Hết hạn</span>
                  </c:when>
                  <c:otherwise>
                    <span class="badge-custom badge-info">Chờ</span>
                  </c:otherwise>
                </c:choose>
              </td>
              <td>
                <div class="action-buttons">
                  <c:choose>
                    <%-- Chỉ booking đang chờ mới cho thao tác --%>
                    <c:when test="${b.status != 'confirmed' && b.status != 'cancelled'}">
                      <%-- Nút Xác nhận → mở modal tạo hợp đồng --%>
                      <button class="btn-custom btn-success"
                              onclick="openConfirmModal(${b.bookingId}, '${b.roomId}', '${b.customerName}')">
                        Xác nhận thuê
                      </button>
                      <%-- Nút Hủy → POST cancel --%>
                      <form method="post"
                            action="${pageContext.request.contextPath}/owner/bookings"
                            style="display:inline"
                            onsubmit="return confirm('Hủy đặt phòng này?')">
                        <input type="hidden" name="action"    value="cancel">
                        <input type="hidden" name="bookingId" value="${b.bookingId}">
                        <button type="submit" class="btn-custom btn-danger">Hủy</button>
                      </form>
                    </c:when>
                    <c:when test="${b.status == 'confirmed'}">
                      <span style="color:#27ae60; font-size:12px;">Đã xác nhận</span>
                    </c:when>
                    <c:otherwise>
                      <span style="color:#7f8c8d; font-size:12px;">Không có thao tác</span>
                    </c:otherwise>
                  </c:choose>
                </div>
              </td>
            </tr>
          </c:forEach>

          <c:if test="${empty bookings}">
            <tr>
              <td colspan="7" style="text-align:center; color:#7f8c8d;">
                Không có dữ liệu
              </td>
            </tr>
          </c:if>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<!-- Modal xác nhận → tạo hợp đồng -->
<div class="modal-overlay" id="confirmModal">
  <div class="modal-content" style="max-width:550px;">
    <form method="post" action="${pageContext.request.contextPath}/owner/bookings">
      <input type="hidden" name="action"    value="confirm">
      <input type="hidden" name="bookingId" id="modalBookingId">

      <div class="modal-header">
        <h5>Xác nhận thuê phòng</h5>
        <button type="button" class="modal-close-btn" onclick="closeConfirmModal()">×</button>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label class="form-label">Phòng</label>
          <input type="text" class="form-control" id="modalRoom" disabled>
        </div>
        <div class="form-group">
          <label class="form-label">Người thuê</label>
          <input type="text" class="form-control" id="modalTenant" disabled>
        </div>
        <p style="color:#e67e22; font-size:13px;">
          * Xác nhận sẽ cập nhật trạng thái đặt phòng thành "Đã xác nhận".
          Vui lòng tạo hợp đồng tại trang Hợp đồng.
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn-custom btn-secondary"
                onclick="closeConfirmModal()">Hủy</button>
        <button type="submit" class="btn-custom btn-success">Xác nhận</button>
      </div>
    </form>
  </div>
</div>

<script>
  function openConfirmModal(bookingId, roomId, tenantName) {
    document.getElementById('modalBookingId').value = bookingId;
    document.getElementById('modalRoom').value      = roomId;
    document.getElementById('modalTenant').value    = tenantName;
    document.getElementById('confirmModal').classList.add('show');
  }

  function closeConfirmModal() {
    document.getElementById('confirmModal').classList.remove('show');
  }

  document.getElementById('confirmModal').addEventListener('click', function (e) {
    if (e.target === this) closeConfirmModal();
  });
</script>
</body>
</html>
