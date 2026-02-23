<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Phòng - Quản Lý Nhà Trọ</title>
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
            <a href="dashboard.jsp">Trang chủ</a> / <span>Quản lý phòng</span>
        </div>

        <div class="page-header">
            <h1 class="page-title">Quản lý Phòng</h1>
            <button class="btn-custom btn-primary-custom" onclick="openAddRoomModal()">
                <i class="bi bi-plus-lg"></i> Thêm phòng
            </button>
        </div>

        <!-- Filters -->
        <div class="filter-section">
            <form action="${pageContext.request.contextPath}/owner/rooms" method="get" style="display: flex; flex-wrap: wrap; gap: inherit; width: 100%; align-items: flex-end;">
                <input type="hidden" name="action" value="filter">
                <div class="filter-group">
                    <label>Tầng</label>
                    <select id="floorFilter" class="form-control" name="searchFloor">
                        <option value="0">-- Chọn tầng --</option>
                        <c:forEach items="${floorList}" var="floor">
                            <option value="${floor}" ${selectedFloor == floor ? 'selected' : ''}>Tầng ${floor}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="filter-group">
                    <label>Trạng thái</label>
                    <select id="statusFilter" class="form-control" name="searchStatus">
                        <option value="">-- Chọn trạng thái --</option>
                        <c:forEach items="${statusList}" var="status">
                            <option value="${status}" ${selectedStatus == status ? 'selected' : ''}>
                                <c:choose>
                                    <c:when test="${status == 'available'}">Trống</c:when>
                                    <c:when test="${status == 'rented'}">Đang thuê</c:when>
                                    <c:when test="${status == 'maintenance'}">Bảo trì</c:when>
                                    <c:when test="${status == 'pending'}">Phòng chờ</c:when>
                                    <c:otherwise>${status}</c:otherwise>
                                </c:choose>
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="filter-group">
                    <label>Giá từ (VND)</label>
                    <input type="number" class="form-control" id="minPrice" name="searchMinPrice" value="${selectedMinPrice}" placeholder="Min">
                </div>
                <div class="filter-group">
                    <label>Giá đến (VND)</label>
                    <input type="number" class="form-control" id="maxPrice" name="searchMaxPrice" value="${selectedMaxPrice}" placeholder="Max">
                </div>
                <div class="filter-group">
                    <label>Mã phòng</label>
                    <input type="text" class="form-control" id="roomCodeSearch" name="roomCodeSearch" value="${selectedRoomId}" placeholder="Tìm mã phòng">
                </div>
                <div class="filter-actions">
                    <button type="submit" class="btn-custom btn-primary-custom">
                        <i class="bi bi-funnel"></i> Lọc
                    </button>
                    <button type="button" class="btn-custom btn-outline" onclick="resetFilters()">
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
                        <th>Ảnh</th>
                        <th>Mã phòng</th>
                        <th>Tầng</th>
                        <th>Diện tích (m²)</th>
                        <th>Giá/tháng (VND)</th>
                        <th>Trạng thái</th>
                        <th>Người thuê</th>
                        <th>Cập nhật</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${roomList}" var="room">
                        <tr>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty room.image}">
                                        <img src="${pageContext.request.contextPath}/uploads/rooms/${room.image}"
                                             alt="Ảnh phòng ${room.roomId}"
                                             style="width: 60px; height: 60px; object-fit: cover; border-radius: 6px;">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="img-placeholder">📷</div>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><strong>${room.roomId}</strong></td>
                            <td>${room.floor}</td>
                            <td>${room.area}</td>
                            <td>
                                <fmt:formatNumber value="${room.price / 1000000}" maxFractionDigits="1"/>M
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${room.status == 'available'}">
                                        <span class="badge-custom badge-warning">TRỐNG</span>
                                    </c:when>

                                    <c:when test="${room.status == 'rented'}">
                                        <span class="badge-custom badge-success">ĐANG THUÊ</span>
                                    </c:when>

                                    <c:when test="${room.status == 'maintenance'}">
                                        <span class="badge-custom badge-danger">BẢO TRÌ</span>
                                    </c:when>

                                    <c:when test="${room.status == 'pending'}">
                                        <span class="badge-custom badge-info">PHÒNG CHỜ</span>
                                    </c:when>

                                    <c:otherwise>
                                        <span class="badge-custom badge-info">${room.status}</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${room.tenantName}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${room.updatedAt != null}">
                                        <fmt:formatDate value="${room.updatedAt}" pattern="dd/MM/yyyy"/>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatDate value="${room.createdAt}" pattern="dd/MM/yyyy"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <div class="action-buttons">
                                    <a href="${pageContext.request.contextPath}/owner/rooms?action=view-detail&id=${room.getRoomId()}"
                                       class="btn-custom btn-primary-custom">Xem</a>
                                    <button class="btn-custom btn-primary-custom"
                                            onclick="editRoom('${room.roomId}', ${room.floor}, ${room.area}, ${room.price}, '${room.status}', ${room.maxOccupants}, '${fn:escapeXml(room.description)}')">
                                        Sửa
                                    </button>
                                    <button class="btn-custom btn-danger" onclick="openDeleteModal('${room.roomId}')">
                                        Xóa
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

<!-- Modal Add/Edit Room -->
<div class="modal-overlay" id="roomModal">
    <div class="modal-content">
        <c:if test="${not empty errorMap}">
            <div class="alert alert-danger">
                <c:forEach items="${errorMap}" var="error">
                    <p>${error.value}</p>
                </c:forEach>
            </div>
        </c:if>
        <form action="${pageContext.request.contextPath}/owner/rooms" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" id="modelAction" value="add">
            <div class="modal-header">
                <h5 id="modalTitle">Thêm phòng mới</h5>
                <button type="button" class="modal-close-btn" onclick="closeRoomModal()">×</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="form-label">Mã phòng</label>
                    <input type="text" class="form-control" name="roomId" id="m_roomId" value="${inputRoom.roomId}"
                           required>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Tầng</label>
                        <input type="number" min="1" class="form-control" name="floor" id="m_floor"
                               value="${inputRoom.floor}" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Diện tích (m²)</label>
                        <input type="number" min="1" step="0.1" class="form-control" name="area" id="m_area"
                               value="${inputRoom.area}" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Giá phòng/tháng (VND)</label>
                        <input type="number" min="1" class="form-control" name="price" id="m_price"
                               value="${inputRoom.price}" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Số người ở</label>
                        <input type="number" min="1" class="form-control" name="maxOccupants" id="m_maxOccupants"
                               value="${inputRoom.maxOccupants}"
                               required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">Trạng thái</label>
                    <select class="form-control" name="status" id="m_status">
                        <option value="">-- Chọn trạng thái --</option>
                        <c:forEach items="${statusList}" var="status">
                            <option value="${status}">
                                <c:choose>
                                    <c:when test="${status == 'available'}">Trống</c:when>
                                    <c:when test="${status == 'rented'}">Đang thuê</c:when>
                                    <c:when test="${status == 'maintenance'}">Bảo trì</c:when>
                                    <c:otherwise>${status}</c:otherwise>
                                </c:choose>
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Mô tả</label>
                    <textarea class="form-control" rows="3" name="description" id="m_description"></textarea>
                </div>

                <div class="form-group">
                    <label class="form-label">Ảnh phòng</label>
                    <input type="file" class="form-control" name="image" accept="image/*">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-custom btn-secondary" onclick="closeRoomModal()">Hủy</button>
                <button type="submit" class="btn-custom btn-primary-custom">Lưu</button>
            </div>
        </form>
    </div>
</div>

<!-- Modal Confirm Delete -->
<div class="modal-overlay" id="deleteModal">
    <div class="modal-content" style="max-width: 400px;">
        <div class="modal-header">
            <h5>Xác nhận xóa phòng</h5>
        </div>
        <div class="modal-body">
            <p>Bạn có chắc muốn xóa phòng <strong id="deleteRoomId"></strong> không?</p>
            <p style="color: #dc3545; font-size: 0.9rem;">
                <i class="bi bi-exclamation-triangle"></i> Hành động này không thể hoàn tác!
            </p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn-custom btn-secondary" onclick="closeDeleteModal()">Hủy</button>
            <form id="deleteForm" action="${pageContext.request.contextPath}/owner/rooms" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="roomId" id="deleteRoomIdInput">
                <button type="submit" class="btn-custom btn-danger">Xóa</button>
            </form>
        </div>
    </div>
</div>

<c:if test="${not empty errorMap}">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('roomModal').classList.add('show');
        });
    </script>
</c:if>

<script>
    function openAddRoomModal() {
        document.getElementById('modalTitle').textContent = 'Thêm phòng mới';

        let idInput = document.getElementById('m_roomId');
        idInput.value = '';
        idInput.readOnly = false;
        idInput.style.backgroundColor = "#fff";

        document.getElementById('m_floor').value = '';
        document.getElementById('m_area').value = '';
        document.getElementById('m_price').value = '';
        document.getElementById('m_status').value = '';
        document.getElementById('m_maxOccupants').value = '';
        document.getElementById('m_description').value = '';

        document.getElementById('roomModal').classList.add('show');
    }

    function editRoom(roomId, floor, area, price, status, maxOccupants, description) {
        document.getElementById('modalTitle').textContent = 'Chỉnh sửa: ' + roomId;
        document.getElementById('modelAction').value = 'update';
        let idInput = document.getElementById('m_roomId');
        idInput.value = roomId;
        idInput.readOnly = true;
        idInput.style.backgroundColor = "#e9ecef";

        document.getElementById('m_floor').value = floor;
        document.getElementById('m_area').value = area;
        document.getElementById('m_price').value = price;
        document.getElementById('m_status').value = status;
        document.getElementById('m_maxOccupants').value = maxOccupants;
        document.getElementById('m_description').value = description;
        document.getElementById('roomModal').classList.add('show');
    }

    function closeRoomModal() {
        document.getElementById('roomModal').classList.remove('show');
    }

    function openDeleteModal(roomId) {
        document.getElementById('deleteRoomId').textContent = roomId;
        document.getElementById('deleteRoomIdInput').value = roomId;
        document.getElementById('deleteModal').classList.add('show');
    }

    function closeDeleteModal() {
        document.getElementById('deleteModal').classList.remove('show');
    }

    // Click outside để đóng
    document.getElementById('deleteModal').addEventListener('click', function (e) {
        if (e.target === this) closeDeleteModal();
    });

    function resetFilters() {
        window.location.href = "${pageContext.request.contextPath}/owner/rooms"
    }

    // Close modal when clicking outside
    document.getElementById('roomModal').addEventListener('click', function (e) {
        if (e.target === this) {
            closeRoomModal();
        }
    });
</script>
</body>
</html>
