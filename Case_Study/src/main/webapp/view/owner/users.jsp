<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Người dùng - Quản Lý Nhà Trọ</title>
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
            <a href="dashboard.jsp">Trang chủ</a> / <span>Người dùng</span>
        </div>

        <div class="page-header d-flex justify-content-between align-items-center">
            <h1 class="page-title">Quản lý Người dùng</h1>

            <button class="btn btn-success"
                    onclick="openAddUserModal()">
                <i class="bi bi-plus-circle"></i> Thêm tài khoản
            </button>
        </div>
        <form method="get" action="${pageContext.request.contextPath}/users">
            <input type="hidden" name="action" value="filter">

            <div class="filter-section">

                <div class="filter-group">
                    <label>Trạng thái</label>
                    <select name="status" class="form-control">
                        <option value="">-- Chọn trạng thái --</option>
                        <option value="active">Hoạt động</option>
                        <option value="locked">Bị khóa</option>
                    </select>
                </div>

                <div class="filter-group">
                    <label>Tên</label>
                    <input type="text" name="keyword" class="form-control"  value="${param.keyword}" placeholder="Nhập tên">
                </div>

                <div class="filter-actions">
                    <button type="submit" class="btn-custom btn-primary-custom">
                        <i class="bi bi-funnel"></i> Lọc
                    </button>

                    <a href="${pageContext.request.contextPath}/users"
                       class="btn-custom btn-outline">
                        Đặt lại
                    </a>
                </div>
            </div>
        </form>


        <!-- Table -->
        <div class="card-custom">
            <div class="table-responsive">
                <table class="table-custom">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Họ tên</th>
                        <th>Số điện thoại</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="u" items="${userList}">
                        <tr>
                            <td><strong>${u.userId}</strong></td>
                            <td>${u.fullName}</td>
                            <td>${u.phone}</td>
                            <td>${u.email}</td>

                            <td>
                                <span class="badge-custom badge-light">${u.role}</span>
                            </td>

                            <td>
                                <c:if test="${u.status == 'active'}">
                                    <span class="badge-custom badge-success">Hoạt động</span>
                                </c:if>
                                <c:if test="${u.status == 'locked'}">
                                    <span class="badge-custom badge-danger">Bị khóa</span>
                                </c:if>
                            </td>

                            <td>
                                <div class="action-buttons">
                                    <button class="btn-custom btn-secondary"
                                            onclick="viewUser(
                                                    '${u.userId}',
                                                    '${u.fullName}',
                                                    '${u.phone}',
                                                    '${u.email}',
                                                    '${u.citizenId}',
                                                    '${u.address}',
                                                    '${u.dateOfBirth}',
                                                    '${u.status}',
                                                    '${u.role}',
                                                    '${u.password}'
                                                    )">
                                        Xem
                                    </button>

                                    <!-- Sửa -->
                                    <button class="btn-custom btn-primary-custom"
                                            onclick="editUser(
                                                    '${u.userId}',
                                                    '${u.fullName}',
                                                    '${u.phone}',
                                                    '${u.email}',
                                                    '${u.citizenId}',
                                                    '${u.address}',
                                                    '${u.dateOfBirth}',
                                                    '${u.status}',
                                                    '${u.role}',
                                                    '${u.password}'
                                                    )">
                                        Sửa
                                    </button>

                                    <!-- Xoá -->
                                    <form method="post" action="${pageContext.request.contextPath}/users"
                                          style="display:inline;">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="userId" value="${u.userId}">
                                        <button class="btn-custom btn-danger">Xoá</button>
                                    </form>

                                    <!-- Khoá / Mở -->
                                    <form method="post" action="${pageContext.request.contextPath}/users"
                                          style="display:inline;">
                                        <input type="hidden" name="userId" value="${u.userId}">
                                        <c:if test="${u.status == 'active'}">
                                            <input type="hidden" name="action" value="lock">
                                            <button class="btn-custom btn-danger">Khoá</button>
                                        </c:if>
                                        <c:if test="${u.status == 'locked'}">
                                            <input type="hidden" name="action" value="unlock">
                                            <button class="btn-custom btn-success">Mở</button>
                                        </c:if>
                                    </form>

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

<!-- User Modal -->
<div class="modal-overlay" id="userModal">
    <div class="modal-content">
        <div class="modal-header">
            <h5 id="userModalTitle">Người dùng</h5>
            <button type="button" class="modal-close-btn" onclick="closeUserModal()">×</button>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/users">
            <input type="hidden" name="action" id="formAction">

            <div class="modal-body">
                <div class="form-group" id="userIdGroup">
                    <label>ID</label>
                    <input type="text" id="userId" name="userId" class="form-control" readonly>
                </div>

                <div class="form-group">
                    <label>Role</label>
                    <select id="role" name="role" class="form-control">
                        <option value="ADMIN">ADMIN</option>
                        <option value="OWNER">OWNER</option>
                        <option value="TENANT">TENANT</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Mật khẩu</label>
                    <input id="password" name="password" class="form-control" required>
                </div>

                <div class="form-group">
                    <label>Họ tên</label>
                    <input type="text" id="fullName" name="fullName" class="form-control">
                </div>

                <div class="form-group">
                    <label>Số điện thoại</label>
                    <input type="tel" name="phone" id="phone" class="form-control">
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" id="email" name="email" class="form-control">
                </div>

                <div class="form-group">
                    <label>CCCD</label>
                    <input type="text" id="citizenId" name="citizenId" class="form-control">
                </div>

                <div class="form-group">
                    <label>Địa chỉ</label>
                    <input type="text" id="address" name="address" class="form-control">
                </div>

                <div class="form-group">
                    <label>Ngày sinh</label>
                    <input type="date" id="dateOfBirth" name="dateOfBirth" class="form-control">
                </div>

                <div class="form-group" id="statusGroup">
                    <label>Trạng thái</label>
                    <select id="status" name="status" class="form-control">
                        <option value="active">Hoạt động</option>
                        <option value="locked">Bị khóa</option>
                    </select>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn-custom btn-secondary" onclick="closeUserModal()">Hủy</button>
                <button type="submit" class="btn-custom btn-primary-custom" id="saveBtnUser">Lưu</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>

    function setUserData(id, name, phone, email, citizenId, address, dob, status, role, password) {

        document.getElementById("userId").value = id;
        document.getElementById("fullName").value = name;
        document.getElementById("phone").value = phone;
        document.getElementById("email").value = email;
        document.getElementById("citizenId").value = citizenId;
        document.getElementById("address").value = address;
        document.getElementById("dateOfBirth").value = dob;
        document.getElementById("status").value = status;
        document.getElementById("role").value = role;
        document.getElementById("password").value = password;
    }

    function openAddUserModal() {

        document.getElementById("userModalTitle").textContent = "Thêm tài khoản";
        document.getElementById("saveBtnUser").style.display = "inline-block";
        document.getElementById("userIdGroup").style.display = "none";
        document.getElementById("statusGroup").style.display = "none";

        // reset form TRƯỚC
        document.querySelectorAll("#userModal input, #userModal select")
            .forEach(el => {
                el.disabled = false;
                if (el.id !== "formAction") {
                    el.value = "";
                }
            });

        // set action SAU
        document.getElementById("formAction").value = "add";

        document.getElementById("userId").readOnly = true;

        document.getElementById("userModal").classList.add("show");
    }

    function viewUser(id, name, phone, email, citizenId, address, dob, status, role, password) {

        document.getElementById("userModalTitle").textContent = "Xem Người dùng";
        document.getElementById("saveBtnUser").style.display = "none";

        setUserData(id, name, phone, email, citizenId, address, dob, status, role, password);

        document.querySelectorAll("#userModal input, #userModal select")
            .forEach(el => el.disabled = true);

        document.getElementById("userModal").classList.add("show");
    }

    function editUser(id, name, phone, email, citizenId, address, dob, status, role, password) {

        document.getElementById("userModalTitle").textContent = "Chỉnh sửa Người dùng";
        document.getElementById("saveBtnUser").style.display = "inline-block";
        document.getElementById("formAction").value = "update";
        setUserData(id, name, phone, email, citizenId, address, dob, status, role, password);

        document.querySelectorAll("#userModal input, #userModal select")
            .forEach(el => el.disabled = false);

        document.getElementById("userId").readOnly = true;   // sửa chỗ này
        document.getElementById("phone").readOnly = true;
        document.getElementById("role").disabled = true;
        document.getElementById("userModal").classList.add("show");
    }

    function closeUserModal() {
        document.getElementById('userModal').classList.remove('show');
    }

    function resetFilters() {
        document.getElementById('statusFilter').value = '';
        document.getElementById('searchInput').value = '';
    }

    document.getElementById('userModal').addEventListener('click', function (e) {
        if (e.target === this) {
            closeUserModal();
        }
    });
</script>
</body>
</html>