<%-- Created by IntelliJ IDEA. User: hieuvannguyen Date: 6/2/26 Time: 12:10 To change this template use File | Settings
    | File Templates. --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <meta name="author" content="Untree.co">
                <link rel="shortcut icon" href="house.png">

                <meta name="description" content="" />
                <meta name="keywords" content="bootstrap, bootstrap4" />
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/css/bootstrap.min.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/css/tiny-slider.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/css/style.css">
                <!-- Bootstrap CSS -->

                <title>Tìm nhà giá rẻ có Hiếu lo</title>
            </head>


            <body>

                <!-- Start Header/Navigation -->
                <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark"
                    arial-label="Furni navigation bar">

                    <div class="container">
                        <a class="navbar-brand" href="index.html">Nhà của Bột<span>.</span></a>

                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarsFurni">
                            <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                                <li><a class="nav-link"
                                        href="${pageContext.request.contextPath}/view/user/home.jsp">Trang chủ</a></li>
<%--                                <li class="nav-item active"><a class="nav-link"--%>
<%--                                        href="${pageContext.request.contextPath}/view/user/room.jsp">Phòng trọ</a></li>--%>
                                <li class="nav-item active"><a class="nav-link"
                                        href="${pageContext.request.contextPath}/room?action=listRooms">Phòng trọ</a></li>
                                <li><a class="nav-link"
                                        href="${pageContext.request.contextPath}/view/user/detailsRoom.jsp">Chi tiết
                                        phòng</a></li>
                                <li><a class="nav-link"
                                        href="${pageContext.request.contextPath}/view/user/contact.jsp">Liên hệ</a></li>
                            </ul>

                            <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                                <li><a class="nav-link" href="#"><img
                                            src="${pageContext.request.contextPath}/view/user/images/user.svg"></a></li>
                                <li><a class="nav-link" href="cart.html"><img
                                            src="${pageContext.request.contextPath}/view/user/images/cart.svg"></a></li>
                            </ul>
                        </div>
                    </div>

                </nav>


                <div class="untree_co-section product-section before-footer-section">
                    <div class="container">
                        <!-- Search Section -->
                        <div class="row mb-5">
                            <div class="col-12">
                                <div class="card shadow">
                                    <div class="card-header bg-primary text-white">
                                        <h5 class="mb-0">🔍 Tìm kiếm phòng trọ</h5>
                                    </div>
                                    <div class="card-body">
                                        <form method="GET" action="${pageContext.request.contextPath}/room"
                                            class="row g-3">
                                            <input type="hidden" name="action" value="search">

                                            <div class="col-md-5">
                                                <label for="roomName" class="form-label">Tên phòng (gần đúng)</label>
                                                <input type="text" class="form-control" id="roomName" name="roomName"
                                                    placeholder="Nhập tên phòng (vd: P101, A02...)"
                                                    value="${searchRoomName}">
                                            </div>

                                            <div class="col-md-3">
                                                <label for="floor" class="form-label">Tầng</label>
                                                <input type="number" class="form-control" id="floor" name="floor"
                                                    placeholder="Nhập tầng" min="0" value="${searchFloor}">
                                            </div>

                                            <div class="col-md-2 d-flex align-items-end">
                                                <button type="submit" class="btn btn-primary w-100">
                                                    <i class="fa fa-search"></i> Tìm kiếm
                                                </button>
                                            </div>

                                            <div class="col-md-2 d-flex align-items-end">
                                                <a href="${pageContext.request.contextPath}/room"
                                                    class="btn btn-secondary w-100">
                                                    <i class="fa fa-refresh"></i> Xóa tìm
                                                </a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Results Count -->
                        <div class="row mb-3">
                            <div class="col-12">
                                <p class="text-muted">
                                    <strong>Tổng phòng trọ:</strong> <span
                                        class="badge bg-info">${roomList.size()}</span> phòng
                                </p>
                            </div>
                        </div>

                        <!-- Rooms Display -->
                        <div class="row">
                            <c:if test="${empty roomList}">
                                <div class="col-12">
                                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                        <i class="fa fa-info-circle"></i> <strong>Không tìm thấy phòng trọ</strong> phù
                                        hợp với tiêu chí tìm kiếm của bạn.
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                    </div>
                                </div>
                            </c:if>

                            <c:forEach var="rooms" items="${roomList}">
                                <div class="col-12 col-md-6 col-lg-4 mb-4">
                                    <div class="card h-100 shadow-sm hover-shadow" style="transition: all 0.3s ease;">
                                        <div class="card-body">
                                            <!-- Room ID/Name -->
                                            <h5 class="card-title text-primary">
                                                <i class="fa fa-door-open"></i> ${rooms.roomId}
                                            </h5>

                                            <!-- Room Details -->
                                            <ul class="list-unstyled small">
                                                <li class="mb-2">
                                                    <i class="fa fa-layer-group text-info"></i>
                                                    <strong>Tầng:</strong> ${rooms.floor}
                                                </li>
                                                <li class="mb-2">
                                                    <i class="fa fa-ruler text-success"></i>
                                                    <strong>Diện tích:</strong> ${rooms.area} m²
                                                </li>
                                                <li class="mb-2">
                                                    <i class="fa fa-users text-warning"></i>
                                                    <strong>Sức chứa:</strong> ${rooms.maxOccupants} người
                                                </li>
                                                <li class="mb-2">
                                                    <i class="fa fa-tag text-danger"></i>
                                                    <strong>Giá:</strong> <span
                                                        class="badge bg-danger">${String.format("%,.0f", rooms.price)}
                                                        VND/tháng</span>
                                                </li>
                                                <li class="mb-2">
                                                    <i class="fa fa-home"></i>
                                                    <strong>Trạng thái:</strong>
                                                    <c:choose>
                                                        <c:when test="${rooms.status == 'AVAILABLE'}">
                                                            <span class="badge bg-success">Còn trống</span>
                                                        </c:when>
                                                        <c:when test="${rooms.status == 'OCCUPIED'}">
                                                            <span class="badge bg-warning">Đã cho thuê</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-secondary">${rooms.status}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </li>
                                            </ul>

                                            <!-- Description -->
                                            <c:if test="${not empty rooms.description}">
                                                <p class="card-text small text-muted mt-2">
                                                    ${rooms.description}
                                                </p>
                                            </c:if>
                                        </div>

                                        <!-- Card Footer -->
                                        <div class="card-footer bg-light">
                                            <a href="#" class="btn btn-sm btn-primary w-100">
                                                <i class="fa fa-eye"></i> Xem chi tiết
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <!-- Add CSS for hover effect -->
                <style>
                    .hover-shadow:hover {
                        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15) !important;
                        transform: translateY(-5px);
                    }

                    .card {
                        border: 1px solid #e0e0e0;
                        border-radius: 8px;
                    }

                    .card-header {
                        border-radius: 8px 8px 0 0;
                    }
                </style>



                <!-- Start Footer Section -->
                <footer class="footer-section">
                    <div class="container relative">

                        <div class="sofa-img">
                            <img src="${pageContext.request.contextPath}/view/user/img_house/house2.png" alt="Image"
                                class="img-fluid">
                        </div>

                        <div class="row">
                            <div class="col-lg-8">
                                <div class="subscription-form">
                                    <h3 class="d-flex align-items-center"><span class="me-1"><img
                                                src="${pageContext.request.contextPath}/view/user/images/envelope-outline.svg"
                                                alt="Image" class="img-fluid"></span><span>Đăng ký nhận thông tin phòng
                                            mới
                                        </span>
                                    </h3>

                                    <form action="#" class="row g-3">
                                        <div class="col-auto">
                                            <input type="text" class="form-control" placeholder="Nhập tên của bạn">
                                        </div>
                                        <div class="col-auto">
                                            <input type="email" class="form-control" placeholder="Nhập email của bạn">
                                        </div>
                                        <div class="col-auto">
                                            <button class="btn btn-primary">
                                                <span class="fa fa-paper-plane"></span>
                                            </button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>

                        <div class="row g-5 mb-5">
                            <div class="col-lg-4">
                                <div class="mb-4 footer-logo-wrap"><a href="#"
                                        class="footer-logo">NhaTro247<span>.</span></a></div>
                                <p class="mb-4">Nền tảng hỗ trợ bạn tìm và thuê phòng trọ nhanh chóng, minh bạch và an
                                    toàn.
                                    Cập nhật phòng mới mỗi ngày, dễ dàng đặt lịch xem phòng và liên hệ chủ trọ trực tiếp
                                </p>

                                <ul class="list-unstyled custom-social">
                                    <li><a href="#"><span class="fa fa-brands fa-facebook-f"></span></a></li>
                                    <li><a href="#"><span class="fa fa-brands fa-twitter"></span></a></li>
                                    <li><a href="#"><span class="fa fa-brands fa-instagram"></span></a></li>
                                    <li><a href="#"><span class="fa fa-brands fa-linkedin"></span></a></li>
                                </ul>
                            </div>

                            <div class="col-lg-8">
                                <div class="row links-wrap">
                                    <div class="col-6 col-sm-6 col-md-3">
                                        <ul class="list-unstyled">
                                            <li><a href="#">Giới thiệu</a></li>
                                            <li><a href="#">Dịch vụ</a></li>
                                            <li><a href="#">Blog</a></li>
                                            <li><a href="#">Liên hệ</a></li>
                                        </ul>
                                    </div>

                                    <div class="col-6 col-sm-6 col-md-3">
                                        <ul class="list-unstyled">
                                            <li><a href="#">Trung tâm hỗ trợ</a></li>
                                            <li><a href="#">Hướng dẫn thuê phòng</a></li>
                                            <li><a href="#">Chat hỗ trợ</a></li>
                                        </ul>
                                    </div>

                                    <div class="col-6 col-sm-6 col-md-3">
                                        <ul class="list-unstyled">
                                            <li><a href="#">Tuyển dụng</a></li>
                                            <li><a href="#">Đội ngũ</a></li>
                                            <li><a href="#">Chính sách bản mật</a></li>
                                        </ul>
                                    </div>

                                    <div class="col-6 col-sm-6 col-md-3">
                                        <ul class="list-unstyled">
                                            <li><a href="#">Phòng trọ giá rẻ</a></li>
                                            <li><a href="#">Căn hộ mini</a></li>
                                            <li><a href="#">Phòng trị gần trường</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="border-top copyright">
                            <div class="row pt-4">
                                <div class="col-lg-6">
                                    <p class="mb-2 text-center text-lg-start">© 2026 TroNhanh
                                        — Designed by Hieu Nguyen.
                                    </p>
                                </div>

                                <div class="col-lg-6 text-center text-lg-end">
                                    <ul class="list-unstyled d-inline-flex ms-auto">
                                        <li class="me-4"><a href="#">Điều khoản sử dụng</a></li>
                                        <li><a href="#">Chính sách bảo mật</a></li>
                                    </ul>
                                </div>

                            </div>
                        </div>

                    </div>
                </footer>
                <!-- End Footer Section -->
                <script src="${pageContext.request.contextPath}/view/user/js/bootstrap.bundle.min.js"></script>
                <script src="${pageContext.request.contextPath}/view/user/js/tiny-slider.js"></script>
                <script src="${pageContext.request.contextPath}/view/user/js/custom.js"></script>

            </body>

            </html>