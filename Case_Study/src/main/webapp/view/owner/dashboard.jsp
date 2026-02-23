<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Dashboard - Quản Lý Nhà Trọ</title>
  <c:import url="../layout/library.jsp"></c:import>
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/view/owner/assets/styles.css">

  <!-- ChartJS -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>

<!-- ===== SIDEBAR ===== -->
<c:import url="../layout/sidebar.jsp"></c:import>

<!-- ===== MAIN ===== -->
<div class="main-wrapper">

  <!-- TOPBAR -->
  <c:import url="../layout/topbar.jsp"></c:import>

  <!-- ===== CONTENT ===== -->
  <div class="main-content">

    <h1 class="page-title mb-4">Tổng quan kinh doanh</h1>

    <!-- ===== KPI ===== -->
    <div class="kpi-container">

      <div class="kpi-card">
        <div class="kpi-label">Tổng số phòng</div>
        <div class="kpi-value">${totalRooms}</div>
      </div>

      <div class="kpi-card">
        <div class="kpi-label">Phòng trống</div>
        <div class="kpi-value text-warning">${availableRooms}</div>
      </div>

      <div class="kpi-card">
        <div class="kpi-label">Phòng đang thuê</div>
        <div class="kpi-value text-success">${rentedRooms}</div>
      </div>

      <div class="kpi-card">
        <div class="kpi-label">Đang bảo trì</div>
        <div class="kpi-value text-success">${maintenanceRooms}</div>
      </div>

      <div class="kpi-card">
        <div class="kpi-label">Đặt phòng chờ</div>
        <div class="kpi-value text-info">${pendingBookings}</div>
      </div>

      <div class="kpi-card">
        <div class="kpi-label">Hóa đơn chưa thu</div>
        <div class="kpi-value text-danger">${unpaidInvoices}</div>
      </div>

      <div class="kpi-card">
        <div class="kpi-label">Doanh thu tháng gần nhất</div>
        <div class="kpi-value text-success">
          <fmt:formatNumber value="${monthlyRevenue}"
                            type="number"
                            groupingUsed="true"/> ₫
        </div>
      </div>

    </div>

    <!-- ===== CHART ===== -->
    <div class="card-custom mt-4">
      <div class="card-header">
        <h5 class="card-title">Doanh thu 3 tháng gần nhất</h5>
      </div>
      <div class="card-body">
        <canvas id="revenueChart" height="100"></canvas>
      </div>
    </div>

    <!-- ===== NOTE ===== -->
    <div class="alert alert-info mt-4">
      ℹ️ Dữ liệu chi tiết sẽ hiển thị khi bạn truy cập các module quản lý tương ứng.
    </div>

  </div>
</div>

<!-- ===== CHART SCRIPT ===== -->
<script>
  const labels = [
    <c:forEach var="item" items="${chartData}" varStatus="s">
    "${item.key}"<c:if test="${!s.last}">,</c:if>
    </c:forEach>
  ];

  const values = [
    <c:forEach var="item" items="${chartData}" varStatus="s">
    ${item.value}<c:if test="${!s.last}">,</c:if>
    </c:forEach>
  ];

  new Chart(document.getElementById('revenueChart'), {
    type: 'bar',
    data: {
      labels: labels.reverse(),
      datasets: [{
        label: 'Doanh thu (VNĐ)',
        data: values.reverse(),
        backgroundColor: '#0d6efd'
      }]
    },
    options: {
      responsive: true,
      plugins: {
        legend: { display: false }
      }
    }
  });
</script>

</body>
</html>