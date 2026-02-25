<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hóa đơn - Quản Lý Nhà Trọ</title>
    <c:import url="../layout/library.jsp"></c:import>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/owner/assets/styles.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        .add {
            display: flex;
            justify-content: space-around;
        }

    </style>
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
            <a href="dashboard.jsp">Trang chủ</a> / <span>Hóa đơn</span>
        </div>

        <div class="page-header">
            <h1 class="page-title">Quản lý Hóa đơn</h1>
        </div>

        <!-- Filters -->
        <div class="filter-section">
            <form action="${pageContext.request.contextPath}/invoices" method="get"
                  style="display: flex; flex-wrap: wrap; gap: inherit; align-items: flex-end; width: 100%">
                <input type="hidden" name="action" value="filter">
                <div class="filter-group">
                    <label>Tháng/Năm</label>
                    <input type="month" name="searchMonth" class="form-control">
                </div>
                <div class="filter-group">
                    <label>Trạng thái</label>
                    <select id="statusFilter" class="form-control" name="searchStatus">
                        <option value="">-- Chọn trạng thái --</option>
                        <c:forEach items="${statusList}" var="status">
                            <option value="${status}" ${selectedStatus == status ? 'selected' : ''}>
                                <c:choose>
                                    <c:when test="${status == 'paid'}">Đã thu</c:when>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${status == 'unpaid'}">Chưa thu</c:when>
                                </c:choose>
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="filter-group">
                    <label>Phòng</label>
                    <select id="roomFilter" class="form-control" name="searchRoomId">
                        <option value="">-- Chọn phòng --</option>
                        <c:forEach items="${roomIdList}" var="roomId">
                            <option value="${roomId}" ${selectedRoomId == roomId ? 'selected' : ''}>${roomId}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="filter-group">
                    <label>Mã hóa đơn</label>
                    <input type="text" class="form-control" id="invoiceSearch" name="searchInvoiceId"
                           placeholder="Tìm mã HĐ" value="${selectedInvoiceId}">
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
                    <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600;">Mã xác
                        nhận
                    </div>
                    <div style="font-size: 14px; color: #2c3e50;">XN20250120001</div>
                </div>
                <div>
                    <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600;">Ngày xác
                        nhận
                    </div>
                    <div style="font-size: 14px; color: #2c3e50;">20/01/2025</div>
                </div>
                <div>
                    <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600;">Người xác
                        nhận
                    </div>
                    <div style="font-size: 14px; color: #2c3e50;">Chủ trọ</div>
                </div>
                <div>
                    <div style="font-size: 12px; color: #7f8c8d; text-transform: uppercase; font-weight: 600;">Ghi chú
                    </div>
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
    <div class="modal-content" style="max-width: 750px; max-height: 90vh; overflow-y: auto;">
        <form method="post" action="${pageContext.request.contextPath}/invoices" id="createForm">

            <div class="modal-header">
                <h5>Tạo hóa đơn mới</h5>
                <button type="button" class="modal-close-btn" onclick="closeCreateModal()">×</button>
            </div>

            <div class="modal-body">

                <%-- Hiển thị lỗi nếu có --%>
                <c:if test="${not empty errorMsg}">
                    <div class="alert alert-danger mb-3">${errorMsg}</div>
                </c:if>

                <%-- Chọn hợp đồng: khi chọn sẽ tự điền roomId, customerId --%>
                <div class="row mb-2">
                    <div class="col-12">
                        <label class="form-label fw-bold">Hợp đồng <span class="text-danger">*</span></label>
                        <select id="contractSelect" class="form-control"
                                onchange="fillContractInfo(this)" required>
                            <option value="">-- Chọn hợp đồng (phòng - khách thuê) --</option>
                            <c:forEach items="${activeContracts}" var="c">
                                <option value="${c.contractId}"
                                        data-room="${c.roomId}"
                                        data-customer="${c.customerId}">
                                    HĐ#${c.contractId} | Phòng ${c.roomId} | ${c.customerName} (${c.customerId})
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <%-- Hidden fields được điền tự động --%>
                <input type="hidden" name="contractId" id="contractId">
                <input type="hidden" name="roomId"     id="roomId">
                <input type="hidden" name="customerId" id="customerId">

                <%-- Thông tin đã chọn (readonly, chỉ để hiển thị) --%>
                <div class="row mb-2">
                    <div class="col-md-4">
                        <label class="form-label">Phòng</label>
                        <input type="text" class="form-control" id="displayRoom"
                               placeholder="(tự điền)" readonly>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Mã khách thuê</label>
                        <input type="text" class="form-control" id="displayCustomer"
                               placeholder="(tự điền)" readonly>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label">Tháng <span class="text-danger">*</span></label>
                        <input type="number" name="month" id="inputMonth"
                               min="1" max="12" class="form-control" required>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label">Năm <span class="text-danger">*</span></label>
                        <input type="number" name="year" id="inputYear"
                               class="form-control" required>
                    </div>
                </div>

                <hr>

                <%-- Bảng dịch vụ động --%>
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <h6 class="mb-0">Chi tiết dịch vụ</h6>
                    <button type="button" class="btn btn-sm btn-outline-primary"
                            onclick="addServiceRow()">
                        <i class="bi bi-plus-circle"></i> Thêm dịch vụ
                    </button>
                </div>

                <table class="table table-bordered table-sm" id="serviceTable">
                    <thead class="table-light">
                    <tr>
                        <th>Mã dịch vụ</th>
                        <th>Số lượng</th>
                        <th>Đơn giá (VND)</th>
                        <th>Thành tiền</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="serviceBody">
                    <%-- dòng mặc định đầu tiên --%>
                    <tr>
                        <td>
                            <select name="serviceCode" class="form-control form-control-sm"
                                    onchange="onServiceChange(this)">
                                <option value="">-- Chọn --</option>
                                <option value="ELEC"    data-price="3500">Điện (ELEC)</option>
                                <option value="WATER"   data-price="15000">Nước (WATER)</option>
                                <option value="GARBAGE" data-price="30000">Rác (GARBAGE)</option>
                                <option value="WIFI"    data-price="100000">Internet (WIFI)</option>
                                <option value="MANAGE"  data-price="50000">Quản lý (MANAGE)</option>
                            </select>
                        </td>
                        <td><input name="quantity"  type="number" min="1" value="1"
                                   class="form-control form-control-sm qty"
                                   oninput="updateTotal(this)"></td>
                        <td><input name="unitPrice" type="number" min="0" value="0"
                                   class="form-control form-control-sm price"
                                   oninput="updateTotal(this)"></td>
                        <td class="text-end subtotal align-middle">0 đ</td>
                        <td class="text-center align-middle">
                            <button type="button" class="btn btn-sm btn-outline-danger"
                                    onclick="removeRow(this)">
                                <i class="bi bi-trash"></i>
                            </button>
                        </td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr class="table-secondary fw-bold">
                        <td colspan="3" class="text-end">Tổng cộng:</td>
                        <td class="text-end" id="grandTotal">0 đ</td>
                        <td></td>
                    </tr>
                    </tfoot>
                </table>

            </div><%-- end modal-body --%>

            <div class="modal-footer">
                <button type="button" class="btn-custom btn-secondary"
                        onclick="closeCreateModal()">Hủy</button>
                <button type="submit" class="btn-custom btn-primary-custom"
                        onclick="return validateCreateForm()">
                    <i class="bi bi-save"></i> Tạo hóa đơn
                </button>
            </div>

        </form>
    </div>
</div>
<script>
    // ===================== MODAL HELPERS =====================
    function openCreateModal() {
        document.getElementById('createInvoiceModal').classList.add('show');
    }
    function closeCreateModal() {
        document.getElementById('createInvoiceModal').classList.remove('show');
        document.getElementById('createForm').reset();
        resetServiceTable();
        recalcGrandTotal();
    }

    // Tự mở modal lại nếu có lỗi từ server
    <c:if test="${openModal}">
    document.addEventListener('DOMContentLoaded', () => openCreateModal());
    </c:if>

    // ===================== CONTRACT DROPDOWN =====================
    function fillContractInfo(sel) {
        const opt = sel.options[sel.selectedIndex];
        document.getElementById('contractId').value      = opt.value;
        document.getElementById('roomId').value          = opt.dataset.room     || '';
        document.getElementById('customerId').value      = opt.dataset.customer || '';
        document.getElementById('displayRoom').value     = opt.dataset.room     || '';
        document.getElementById('displayCustomer').value = opt.dataset.customer || '';
    }

    // ===================== SERVICE TABLE =====================
    function serviceRowHtml() {
        return `<tr>
        <td>
            <select name="serviceCode" class="form-control form-control-sm"
                    onchange="onServiceChange(this)">
                <option value="">-- Chọn --</option>
                <option value="ELEC"    data-price="3500">Điện (ELEC)</option>
                <option value="WATER"   data-price="15000">Nước (WATER)</option>
                <option value="GARBAGE" data-price="30000">Rác (GARBAGE)</option>
                <option value="WIFI"    data-price="100000">Internet (WIFI)</option>
                <option value="MANAGE"  data-price="50000">Quản lý (MANAGE)</option>
            </select>
        </td>
        <td><input name="quantity"  type="number" min="1" value="1"
                   class="form-control form-control-sm qty"
                   oninput="updateTotal(this)"></td>
        <td><input name="unitPrice" type="number" min="0" value="0"
                   class="form-control form-control-sm price"
                   oninput="updateTotal(this)"></td>
        <td class="text-end subtotal align-middle">0 đ</td>
        <td class="text-center align-middle">
            <button type="button" class="btn btn-sm btn-outline-danger"
                    onclick="removeRow(this)">
                <i class="bi bi-trash"></i>
            </button>
        </td>
    </tr>`;
    }

    function addServiceRow() {
        document.getElementById('serviceBody').insertAdjacentHTML('beforeend', serviceRowHtml());
    }

    function removeRow(btn) {
        const rows = document.querySelectorAll('#serviceBody tr');
        if (rows.length <= 1) { alert('Phải có ít nhất 1 dịch vụ!'); return; }
        btn.closest('tr').remove();
        recalcGrandTotal();
    }

    function resetServiceTable() {
        const tbody = document.getElementById('serviceBody');
        tbody.innerHTML = '';
        tbody.insertAdjacentHTML('beforeend', serviceRowHtml());
    }

    // Khi chọn dịch vụ → tự điền đơn giá mặc định
    function onServiceChange(sel) {
        const opt   = sel.options[sel.selectedIndex];
        const price = opt.dataset.price || 0;
        const row   = sel.closest('tr');
        row.querySelector('.price').value = price;
        updateTotal(sel);
    }

    // Tính thành tiền 1 dòng và cập nhật tổng
    function updateTotal(el) {
        const row   = el.closest('tr');
        const qty   = parseFloat(row.querySelector('.qty').value)   || 0;
        const price = parseFloat(row.querySelector('.price').value) || 0;
        row.querySelector('.subtotal').textContent = formatVnd(qty * price);
        recalcGrandTotal();
    }

    function recalcGrandTotal() {
        let total = 0;
        document.querySelectorAll('#serviceBody .subtotal').forEach(cell => {
            total += parseVnd(cell.textContent);
        });
        document.getElementById('grandTotal').textContent = formatVnd(total);
    }

    function formatVnd(n) {
        return n.toLocaleString('vi-VN') + ' đ';
    }
    function parseVnd(s) {
        return parseFloat(s.replace(/[^\d]/g, '')) || 0;
    }

    // ===================== VALIDATE TRƯỚC KHI SUBMIT =====================
    function validateCreateForm() {
        if (!document.getElementById('contractId').value) {
            alert('Vui lòng chọn hợp đồng!'); return false;
        }
        const rows = document.querySelectorAll('#serviceBody tr');
        for (const row of rows) {
            const code = row.querySelector('select[name="serviceCode"]').value;
            if (!code) { alert('Vui lòng chọn dịch vụ cho tất cả các dòng!'); return false; }
        }
        return true;
    }

    // ===================== PAYMENT MODAL =====================
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

    // ===================== INFO MODAL =====================
    function viewPaymentInfo() { document.getElementById('infoModal').classList.add('show'); }
    function closeInfoModal()  { document.getElementById('infoModal').classList.remove('show'); }

    // ===================== FILTER =====================
    function resetFilters() {
        window.location.href = "${pageContext.request.contextPath}/invoices";
    }

    // Đóng modal khi click ra ngoài
    ['paymentModal','infoModal','createInvoiceModal'].forEach(id => {
        document.getElementById(id).addEventListener('click', function(e) {
            if (e.target === this) this.classList.remove('show');
        });
    });

    // Profile dropdown
    function toggleProfileMenu() {
        document.getElementById('profileMenu').classList.toggle('show');
    }
    document.addEventListener('click', function(e) {
        const menu = document.getElementById('profileMenu');
        const btn  = document.querySelector('.profile-btn');
        if (menu && btn && !menu.contains(e.target) && !btn.contains(e.target)) {
            menu.classList.remove('show');
        }
    });

    // Set năm mặc định = năm hiện tại
    document.getElementById('inputYear').value = new Date().getFullYear();
    document.getElementById('inputMonth').value = new Date().getMonth() + 1;
</script>
</body>
</html>
