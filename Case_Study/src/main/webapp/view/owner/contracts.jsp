<%--<%@ taglib prefix="comment" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hợp đồng - Quản Lý Nhà Trọ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/owner/assets/styles.css">
</head>
<body>
<!-- Sidebar -->
<div class="sidebar">
    <div class="sidebar-logo">
        <i class="bi bi-buildings"></i> Quản Lý Nhà Trọ
    </div>
    <ul class="nav-menu">
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/dashboard.jsp" class="nav-link">
                <i class="bi bi-speedometer2"></i> Dashboard
            </a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/rooms.jsp" class="nav-link">
                <i class="bi bi-door-closed"></i> Phòng
            </a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/bookings.jsp" class="nav-link">
                <i class="bi bi-calendar-check"></i> Đặt phòng
            </a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/contract?action=listContracts" class="nav-link active">
                <i class="bi bi-file-earmark-text"></i> Hợp đồng
            </a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/utilities.jsp" class="nav-link">
                <i class="bi bi-lightning-fill"></i> Điện nước
            </a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/invoices.jsp" class="nav-link">
                <i class="bi bi-receipt"></i> Hóa đơn
            </a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/services.jsp" class="nav-link">
                <i class="bi bi-gear"></i> Dịch vụ
            </a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/users.jsp" class="nav-link">
                <i class="bi bi-people"></i> Người dùng
            </a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/reports.jsp" class="nav-link">
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
            <a href="dashboard.jsp">Trang chủ</a> / <span>Hợp đồng</span>
        </div>

        <div class="page-header d-flex justify-content-between align-items-center">
            <h1 class="page-title">Quản lý Hợp đồng</h1>

            <button class="btn btn-success"
                    onclick="openAddModal()">
                <i class="bi bi-plus-circle"></i> Thêm hợp đồng
            </button>
        </div>

        <!-- Filters -->
        <div class="filter-section">
            <div class="filter-group">
                <label>Trạng thái</label>
                <select id="statusFilter" class="form-control">
                    <option value="">-- Chọn trạng thái --</option>
                    <option value="hiệu lực">Đã đặt</option>
                    <option value="kết thúc">Đã trả</option>
                </select>
            </div>
            <div class="filter-group">
                <label>Phòng</label>
                <select id="roomFilter" class="form-control" name="action" value="roomList">
                    <option value="">-- Chọn phòng --</option>
                    <c:forEach var="room" items="${roomList}">
                        <option>${room.roomId}</option>
                    </c:forEach>
                </select>
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

        <!-- Table -->
        <div class="card-custom">
            <div class="table-responsive">
                <table class="table-custom">
                    <thead>
                    <tr>
                        <th>Mã HĐ</th>
                        <th>Phòng</th>
                        <th>Người thuê</th>
                        <th>Ngày bắt đầu</th>
                        <th>Ngày kết thúc</th>
                        <th>Tiền cọc (VND)</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="c" items="${contractsList}">
                        <tr>
                            <td><strong>${c.contractId}</strong></td>
                            <td>${c.roomId}</td>
                            <td>${c.name}</td>
                            <td>${c.startDate}</td>
                            <td>${c.endDate}</td>
                            <td>${c.deposit} VND</td>
                            <td><span class="badge-custom badge-success">${c.status}</span></td>
                            <td>
                                <div class="action-buttons">
                                    <form method="post"
                                          action="${pageContext.request.contextPath}/contract"
                                          onsubmit="return confirmDelete();"
                                          style="display:inline;">

                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="contractId" value="${c.contractId}">

                                        <button type="submit" class="btn-custom btn-primary-custom btn-danger">
                                            Xoá
                                        </button>
                                    </form>

                                    <button class="btn-custom btn-primary-custom"
                                            onclick="editContract(
                                                    '${c.contractId}',
                                                    '${c.roomId}',
                                                    '${c.name}',
                                                    '${c.customerId}',
                                                    '${c.startDate}',
                                                    '${c.endDate}',
                                                    '${c.deposit}',
                                                    '${c.status}'
                                                    )"> Sửa
                                    </button>
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
<!-- ADD CONTRACT MODAL -->
<div class="modal fade" id="addContractModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <form method="post" action="${pageContext.request.contextPath}/contract">
                <input type="hidden" name="action" value="add">

                <div class="modal-header">
                    <h5 class="modal-title">Thêm hợp đồng mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    <div class="mb-3">
                        <label>Phòng</label>
                        <select name="roomId" class="form-control" required>
                            <c:forEach var="room" items="${roomList}">
                                <option value="${room.roomId}">
                                        ${room.roomId}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Mã khách hàng</label>
                        <input type="text" name="customerId" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Ngày bắt đầu</label>
                        <input type="date" name="startDate" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Ngày kết thúc</label>
                        <input type="date" name="endDate" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Tiền cọc</label>
                        <input type="number" name="deposit" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Trạng thái</label>
                        <select name="status" class="form-control">
                            <option value="Đã đặt">Đã đặt</option>
                            <option value="Đã trả">Đã trả</option>
                        </select>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Thêm mới</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                </div>

            </form>

        </div>
    </div>
</div>
<!-- MODAL -->
<div class="modal fade" id="contractModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <form method="post" action="${pageContext.request.contextPath}/contract">
                <input type="hidden" name="action" value="update">
                <input type="hidden" id="contractId" name="contractId">

                <div class="modal-header">
                    <h5 class="modal-title">Chỉnh sửa hợp đồng</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <input type="hidden" id="customerId" name="customerId">
                    <div class="mb-3">
                        <label>Phòng</label>
                        <input type="text" id="roomId" name="roomId" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label>Người thuê</label>
                        <input type="text" id="name" name="name" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label>Ngày bắt đầu</label>
                        <input type="date" id="startDate" name="startDate" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label>Ngày kết thúc</label>
                        <input type="date" id="endDate" name="endDate" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label>Tiền cọc</label>
                        <input type="number" id="deposit" name="deposit" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label>Trạng thái</label>
                        <select id="status" name="status" class="form-control">
                            <option value="Đã đặt">Đã đặt</option>
                            <option value="Đã trả">Đã trả</option>
                        </select>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                </div>

            </form>

        </div>
    </div>
</div>

<script>

    function openAddModal() {
        let modal = new bootstrap.Modal(document.getElementById('addContractModal'));
        modal.show();
    }

    function editContract(id, roomId, name, customerId, startDate, endDate, deposit, status) {

        document.getElementById("contractId").value = id;
        document.getElementById("roomId").value = roomId;
        document.getElementById("name").value = name;
        document.getElementById("customerId").value = customerId;
        document.getElementById("startDate").value = startDate;
        document.getElementById("endDate").value = endDate;
        document.getElementById("deposit").value = deposit;
        document.getElementById("status").value = status;

        let modal = new bootstrap.Modal(document.getElementById('contractModal'));
        modal.show();
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function closeContractModal() {
        document.getElementById("contractModal").classList.remove("show");
    }

    function resetFilters() {
        document.getElementById('statusFilter').value = '';
        document.getElementById('roomFilter').value = '';
    }

    function toggleProfileMenu() {
        const menu = document.getElementById('profileMenu');
        menu.classList.toggle('show');
    }

    function logout() {
        window.location.href = 'login.jsp';
    }

    document.addEventListener('click', function (event) {
        const menu = document.getElementById('profileMenu');
        const btn = document.querySelector('.profile-btn');
        if (menu && btn && !menu.contains(event.target) && !btn.contains(event.target)) {
            menu.classList.remove('show');
        }
    });

    document.getElementById('contractModal').addEventListener('click', function (e) {
        if (e.target === this) {
            closeContractModal();
        }
    });

    function confirmDelete() {
        return confirm("Bạn có chắc chắn muốn xoá hợp đồng này không?");
    }
</script>
</body>
</html>