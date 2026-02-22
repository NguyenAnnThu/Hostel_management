<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String currentURI = request.getRequestURI();
%>
<div class="sidebar">
  <div class="sidebar-logo">
    <i class="bi bi-buildings"></i> Quản Lý Nhà Trọ
  </div>
  <ul class="nav-menu">
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/owner?page=dashboard" class="nav-link <%= currentURI.contains("dashboard") ? "active" : "" %>">
        <i class="bi bi-speedometer2"></i> Dashboard
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/owner?page=rooms" class="nav-link <%= currentURI.contains("rooms") ? "active" : "" %>">
        <i class="bi bi-door-closed"></i> Phòng
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/owner?page=booking" class="nav-link <%= currentURI.contains("bookings") ? "active" : "" %>">
        <i class="bi bi-calendar-check"></i> Đặt phòng
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/owner?page=contracts" class="nav-link <%= currentURI.contains("contracts") ? "active" : "" %>">
        <i class="bi bi-file-earmark-text"></i> Hợp đồng
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/owner?page=invoices" class="nav-link <%= currentURI.contains("invoices") ? "active" : "" %>">
        <i class="bi bi-receipt"></i> Hóa đơn
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/owner?page=reports" class="nav-link <%= currentURI.contains("reports") ? "active" : "" %>">
        <i class="bi bi-bar-chart"></i> Báo cáo
      </a>
    </li>
  </ul>
</div>