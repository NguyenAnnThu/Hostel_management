<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Cấu hình Dịch vụ</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/view/owner/assets/styles.css">
</head>

<body>

<!-- ================= SIDEBAR ================= -->
<!-- Sidebar -->
<div class="sidebar">
  <div class="sidebar-logo">
    <i class="bi bi-buildings"></i> Quản Lý Nhà Trọ
  </div>
  <ul class="nav-menu">
    <li class="nav-item" s>
      <a href="${pageContext.request.contextPath}/dashboard" class="nav-link active">
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
      <a href="${pageContext.request.contextPath}/contracts" class="nav-link">
        <i class="bi bi-file-earmark-text"></i> Hợp đồng
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/utilities" class="nav-link">
        <i class="bi bi-lightning-fill"></i> Điện nước
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/invoices" class="nav-link">
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


<!-- ================= MAIN ================= -->
<div class="main-wrapper">
  <div class="main-content">

    <div class="page-header d-flex justify-content-between align-items-center mb-3">
      <h1>Cấu hình Dịch vụ</h1>
      <button class="btn btn-primary" onclick="openCreateModal()">
        <i class="bi bi-plus-lg"></i> Thêm dịch vụ
      </button>
    </div>

    <!-- ================= TABLE ================= -->
    <table class="table table-hover align-middle">
      <thead class="table-light">
      <tr>
        <th>Mã</th>
        <th>Tên dịch vụ</th>
        <th>Loại</th>
        <th>Đơn vị</th>
        <th>Đơn giá</th>
        <th>Trạng thái</th>
        <th></th>
      </tr>
      </thead>

      <tbody>
      <c:forEach var="s" items="${services}">
        <tr>
          <td><strong>${s.serviceCode}</strong></td>
          <td>${s.serviceName}</td>

          <td>
            <span class="badge
              ${s.serviceType eq 'fixed' ? 'bg-info' :
                s.serviceType eq 'electricity' ? 'bg-warning' :
                'bg-primary'}">
                ${s.serviceType}
            </span>
          </td>

          <td>${s.unit}</td>

          <td>
            <fmt:formatNumber value="${s.defaultPrice}" type="number"/> đ
          </td>

          <td>
            <span class="badge ${s.status eq 'active' ? 'bg-success' : 'bg-danger'}">
                ${s.status}
            </span>
          </td>

          <td>
            <button class="btn btn-sm btn-warning"
                    onclick="openEditModal(
                            '${s.serviceCode}',
                            '${s.serviceName}',
                            '${s.serviceType}',
                            '${s.unit}',
                            '${s.defaultPrice}',
                            '${s.status}'
                            )">
              Sửa
            </button>
          </td>
        </tr>
      </c:forEach>

      <c:if test="${empty services}">
        <tr>
          <td colspan="7" class="text-center text-muted">
            Chưa có dịch vụ nào
          </td>
        </tr>
      </c:if>
      </tbody>
    </table>

  </div>
</div>

<!-- ================= MODAL ================= -->
<div class="modal fade" id="serviceModal" tabindex="-1">
  <div class="modal-dialog">
    <form id="serviceForm"
          class="modal-content"
          method="post"
          action="${pageContext.request.contextPath}/services">

      <div class="modal-header">
        <h5 class="modal-title" id="modalTitle">Dịch vụ</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
        <input type="hidden" name="serviceCode" id="serviceCode">

        <div class="mb-2">
          <label>Tên dịch vụ</label>
          <input type="text" name="serviceName" id="serviceName" class="form-control" required>
        </div>

        <div class="mb-2">
          <label>Loại</label>
          <select name="serviceType" id="serviceType" class="form-select">
            <option value="fixed">Cố định</option>
            <option value="electricity">Điện</option>
            <option value="water">Nước</option>
          </select>
        </div>

        <div class="mb-2">
          <label>Đơn vị</label>
          <input type="text" name="unit" id="unit" class="form-control">
        </div>

        <div class="mb-2">
          <label>Đơn giá</label>
          <input type="number" name="defaultPrice" id="defaultPrice" class="form-control">
        </div>

        <div class="mb-2">
          <label>Trạng thái</label>
          <select name="status" id="status" class="form-select">
            <option value="active">Hoạt động</option>
            <option value="inactive">Ngưng</option>
          </select>
        </div>
      </div>

      <div class="modal-footer">
        <button class="btn btn-primary">Lưu</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
      </div>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
  const modal = new bootstrap.Modal(document.getElementById('serviceModal'));
  const form = document.getElementById('serviceForm');

  function openCreateModal() {
    document.getElementById('modalTitle').innerText = 'Thêm dịch vụ';
    form.reset();
    document.getElementById('serviceCode').value = '';
    modal.show();
  }

  function openEditModal(code, name, type, unitVal, price, statusVal) {
    document.getElementById('modalTitle').innerText = 'Chỉnh sửa dịch vụ';
    document.getElementById('serviceCode').value = code;
    document.getElementById('serviceName').value = name;
    document.getElementById('serviceType').value = type;
    document.getElementById('unit').value = unitVal;
    document.getElementById('defaultPrice').value = price;
    document.getElementById('status').value = statusVal;
    modal.show();
  }
</script>

</body>
</html>