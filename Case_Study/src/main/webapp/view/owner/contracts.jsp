<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hợp đồng - Quản Lý Nhà Trọ</title>
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
        <form method="get" action="${pageContext.request.contextPath}/contract">
            <input type="hidden" name="action" value="filter">

            <div class="filter-section">
                <div class="filter-group">
                    <label>Trạng thái</label>
                    <select name="status" class="form-control">
                        <option value="">-- Chọn trạng thái --</option>
                        <option value="Đã trả"
                                <c:if test="${param.status == 'Đã trả'}">selected</c:if>>
                            Đã trả
                        </option>
                        <option value="Chưa trả"
                                <c:if test="${param.status == 'Chưa trả'}">selected</c:if>>
                            Chưa trả
                        </option>
                    </select>
                </div>

                <div class="filter-group">
                    <label>Phòng</label>
                    <select name="roomId" class="form-control">
                        <option value="">-- Chọn phòng --</option>
                        <c:forEach var="room" items="${roomList}">
                            <option value="${room.roomId}"
                                    <c:if test="${param.roomId == room.roomId}">selected</c:if>>
                                    ${room.roomId}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="filter-actions">
                    <button type="submit" class="btn-custom btn-primary-custom">
                        <i class="bi bi-funnel"></i> Lọc
                    </button>

                    <a href="${pageContext.request.contextPath}/contract"
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
                            <td>
                                <c:if test="${c.status == 'Đã trả'}">
                                    <span class="badge-custom badge-success">${c.status}</span>
                                </c:if>
                                <c:if test="${c.status == 'Chưa trả'}">
                                    <span class="badge-custom badge-danger">${c.status}</span>
                                </c:if>
                            </td>
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
                                <c:if test="${room.status == 'available'}">
                                    <option>${room.roomId}</option>
                                </c:if>

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
                            <option selected value="Đã trả">Đã trả</option>
                            <option value="Chưa trả">Chưa trả</option>
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
                            <option value="Đã trả">Đã trả</option>
                            <option value="Chưa">Chưa trả</option>
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
