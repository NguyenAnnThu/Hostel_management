<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết Phòng - Quản Lý Nhà Trọ</title>
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
            <a href="${pageContext.request.contextPath}/owner/dashboard">Trang chủ</a> / <a
                href="${pageContext.request.contextPath}/owner/rooms">Quản lý phòng</a> /
            <span>Chi tiết phòng ${room.roomId}</span>
        </div>

        <div class="page-header">
            <h1 class="page-title">Chi tiết Phòng ${room.roomId}</h1>
            <a href="${pageContext.request.contextPath}/owner/rooms" class="btn-custom btn-outline">
                <i class="bi bi-arrow-left"></i> Quay lại
            </a>
        </div>

        <!-- Room Info Card -->
        <div class="card-custom" style="margin-bottom: 25px;">
            <div style="display: grid; grid-template-columns: auto 1fr; gap: 30px; align-items: start;">
                <c:choose>
                    <c:when test="${not empty room.image}">
                        <img src="${pageContext.request.contextPath}/uploads/rooms/${room.image}"
                             style="width:200px; height:200px; object-fit:cover; border-radius:8px; display:block;">
                    </c:when>
                    <c:otherwise>
                        <div class="img-placeholder-lg">📷</div>
                    </c:otherwise>
                </c:choose>
                <div>
                    <div style="margin-bottom: 20px;">
                        <h3 style="color: #2e86ab; margin-bottom: 10px;">Mã phòng: <strong>${room.roomId}</strong></h3>
                        <p style="margin: 0;">
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
                            </c:choose>
                        </p>
                    </div>
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                        <div>
                            <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">
                                Giá phòng
                            </div>
                            <div style="font-size: 20px; font-weight: 700; color: #2e86ab;"><fmt:formatNumber
                                    value="${room.price / 1000000}" maxFractionDigits="1"/>M VND/tháng
                            </div>
                        </div>
                        <div>
                            <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">
                                Diện tích
                            </div>
                            <div style="font-size: 20px; font-weight: 700; color: #2e86ab;">${room.area} m²</div>
                        </div>
                        <div>
                            <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">
                                Tầng
                            </div>
                            <div style="font-size: 20px; font-weight: 700; color: #2e86ab;">Tầng ${room.floor}</div>
                        </div>
                        <div>
                            <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">
                                Số người ở
                            </div>
                            <div style="font-size: 20px; font-weight: 700; color: #2e86ab;">${room.maxOccupants} người
                            </div>
                        </div>
                    </div>
                    <div style="margin-top: 20px; padding-top: 20px; border-top: 1px solid #d4e6f1;">
                        <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 8px;">
                            Mô tả
                        </div>
                        <p style="margin: 0; color: #2c3e50; font-size: 13px;">${room.description}</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tabs -->
        <div class="tabs-container">
            <div class="tab-buttons">
                <button class="tab-btn active" onclick="switchTab('equipment')">
                    <i class="bi bi-tools"></i> Thiết bị
                </button>
                <button class="tab-btn" onclick="switchTab('history')">
                    <i class="bi bi-clock-history"></i> Lịch sử thuê
                </button>
                <button class="tab-btn" onclick="switchTab('contract')">
                    <i class="bi bi-file-earmark-text"></i> Hợp đồng
                </button>
                <button class="tab-btn" onclick="switchTab('invoices')">
                    <i class="bi bi-receipt"></i> Hóa đơn
                </button>
            </div>

            <!-- Equipment Tab -->
            <div id="equipment" class="tab-content active">
                <div class="card-custom">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                        <h5 class="card-title">Danh sách Thiết bị</h5>
                        <button class="btn-custom btn-primary-custom" onclick="openEquipmentModal()">
                            <i class="bi bi-plus-lg"></i> Thêm thiết bị
                        </button>
                    </div>
                    <div class="table-responsive">
                        <table class="table-custom">
                            <thead>
                            <tr>
                                <th>Tên thiết bị</th>
                                <th>Số lượng</th>
                                <th>Ghi chú</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Giường</td>
                                <td>1</td>
                                <td>Giường đôi size king</td>
                                <td>
                                    <div class="action-buttons">
                                        <button class="btn-custom btn-primary-custom" onclick="editEquipment()">Sửa
                                        </button>
                                        <button class="btn-custom btn-danger">Xóa</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Tủ quần áo</td>
                                <td>1</td>
                                <td>Tủ gỗ cao cấp</td>
                                <td>
                                    <div class="action-buttons">
                                        <button class="btn-custom btn-primary-custom" onclick="editEquipment()">Sửa
                                        </button>
                                        <button class="btn-custom btn-danger">Xóa</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Quạt điện</td>
                                <td>2</td>
                                <td>Quạt trần + quạt đứng</td>
                                <td>
                                    <div class="action-buttons">
                                        <button class="btn-custom btn-primary-custom" onclick="editEquipment()">Sửa
                                        </button>
                                        <button class="btn-custom btn-danger">Xóa</button>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- History Tab -->
            <div id="history" class="tab-content">
                <div class="card-custom">
                    <h5 class="card-title" style="margin-bottom: 20px;">Lịch sử Thuê</h5>
                    <div style="display: flex; flex-direction: column; gap: 15px;">
                        <div style="padding-left: 20px; border-left: 3px solid #5dade2; padding-bottom: 15px;">
                            <div style="font-weight: 600; color: #2e86ab;">01/11/2024 - Hiện tại</div>
                            <div style="font-size: 13px; color: #2c3e50; margin-top: 5px;">Khách: Nguyễn Văn A</div>
                            <div style="font-size: 12px; color: #7f8c8d; margin-top: 3px;">Trạng thái: Đang thuê</div>
                        </div>
                        <div style="padding-left: 20px; border-left: 3px solid #95a5a6; padding-bottom: 15px;">
                            <div style="font-weight: 600; color: #7f8c8d;">15/08/2024 - 31/10/2024</div>
                            <div style="font-size: 13px; color: #2c3e50; margin-top: 5px;">Khách: Trần Minh B</div>
                            <div style="font-size: 12px; color: #7f8c8d; margin-top: 3px;">Trạng thái: Đã kết thúc</div>
                        </div>
                        <div style="padding-left: 20px; border-left: 3px solid #95a5a6; padding-bottom: 15px;">
                            <div style="font-weight: 600; color: #7f8c8d;">20/05/2024 - 14/08/2024</div>
                            <div style="font-size: 13px; color: #2c3e50; margin-top: 5px;">Khách: Phạm Thị C</div>
                            <div style="font-size: 12px; color: #7f8c8d; margin-top: 3px;">Trạng thái: Đã kết thúc</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Contract Tab -->
            <div id="contract" class="tab-content">
                <div class="card-custom">
                    <h5 class="card-title" style="margin-bottom: 20px;">Hợp đồng Hiện tại</h5>
                    <div style="display: grid; gap: 15px;">
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                            <div>
                                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">
                                    Mã hợp đồng
                                </div>
                                <div style="font-size: 14px; font-weight: 600; color: #2e86ab;">HĐ001</div>
                            </div>
                            <div>
                                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">
                                    Người thuê
                                </div>
                                <div style="font-size: 14px; font-weight: 600; color: #2e86ab;">Nguyễn Văn A</div>
                            </div>
                            <div>
                                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">
                                    Ngày bắt đầu
                                </div>
                                <div style="font-size: 14px; color: #2c3e50;">01/11/2024</div>
                            </div>
                            <div>
                                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">
                                    Ngày kết thúc
                                </div>
                                <div style="font-size: 14px; color: #2c3e50;">31/10/2025</div>
                            </div>
                            <div>
                                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">
                                    Tiền cọc
                                </div>
                                <div style="font-size: 14px; font-weight: 600; color: #27ae60;">7.0M VND</div>
                            </div>
                            <div>
                                <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600; margin-bottom: 5px;">
                                    Trạng thái
                                </div>
                                <div><span class="badge-custom badge-success">Hiệu lực</span></div>
                            </div>
                        </div>
                        <div style="padding-top: 15px; border-top: 1px solid #d4e6f1;">
                            <a href="contracts.jsp" class="btn-custom btn-outline">
                                <i class="bi bi-file-earmark-text"></i> Xem hợp đồng
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Invoices Tab -->
            <div id="invoices" class="tab-content">
                <div class="card-custom">
                    <h5 class="card-title" style="margin-bottom: 20px;">Hóa đơn Gần đây</h5>
                    <div class="table-responsive">
                        <table class="table-custom">
                            <thead>
                            <tr>
                                <th>Mã HĐ</th>
                                <th>Kỳ</th>
                                <th>Tổng tiền</th>
                                <th>Trạng thái</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><strong>HĐ001</strong></td>
                                <td>01/2025</td>
                                <td>3.5M VND</td>
                                <td><span class="badge-custom badge-success">Đã thu</span></td>
                                <td><a href="invoice-detail.jsp" class="btn-link-custom">Xem</a></td>
                            </tr>
                            <tr>
                                <td><strong>HĐ002</strong></td>
                                <td>12/2024</td>
                                <td>3.5M VND</td>
                                <td><span class="badge-custom badge-success">Đã thu</span></td>
                                <td><a href="invoice-detail.jsp" class="btn-link-custom">Xem</a></td>
                            </tr>
                            <tr>
                                <td><strong>HĐ003</strong></td>
                                <td>11/2024</td>
                                <td>3.5M VND</td>
                                <td><span class="badge-custom badge-success">Đã thu</span></td>
                                <td><a href="invoice-detail.jsp" class="btn-link-custom">Xem</a></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Equipment Modal -->
<div class="modal-overlay" id="equipmentModal">
    <div class="modal-content">
        <div class="modal-header">
            <h5>Thêm Thiết bị</h5>
            <button class="modal-close-btn" onclick="closeEquipmentModal()">×</button>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label class="form-label">Tên thiết bị</label>
                <input type="text" class="form-control" placeholder="Ví dụ: Giường, Tủ...">
            </div>
            <div class="form-group">
                <label class="form-label">Số lượng</label>
                <input type="number" class="form-control" placeholder="1">
            </div>
            <div class="form-group">
                <label class="form-label">Ghi chú</label>
                <textarea class="form-control" rows="3" placeholder="Mô tả chi tiết thiết bị..."></textarea>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn-custom btn-secondary" onclick="closeEquipmentModal()">Hủy</button>
            <button class="btn-custom btn-primary-custom">Lưu</button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function switchTab(tabName) {
        // Hide all tabs
        document.querySelectorAll('.tab-content').forEach(tab => {
            tab.classList.remove('active');
        });
        document.querySelectorAll('.tab-btn').forEach(btn => {
            btn.classList.remove('active');
        });

        // Show selected tab
        document.getElementById(tabName).classList.add('active');
        event.target.classList.add('active');
    }

    function openEquipmentModal() {
        document.getElementById('equipmentModal').classList.add('show');
    }

    function closeEquipmentModal() {
        document.getElementById('equipmentModal').classList.remove('show');
    }

    function editEquipment() {
        openEquipmentModal();
    }

    document.getElementById('equipmentModal').addEventListener('click', function (e) {
        if (e.target === this) {
            closeEquipmentModal();
        }
    });
</script>
</body>
</html>
