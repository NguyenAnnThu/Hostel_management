<%--
  Created by IntelliJ IDEA.
  User: hieuvannguyen
  Date: 6/2/26
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Untree.co">
    <link rel="shortcut icon" href="house.png">

    <meta name="description" content=""/>
    <meta name="keywords" content="bootstrap, bootstrap4"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/home/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/home/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/home/css/style.css">
    <!-- Bootstrap CSS -->

    <title>Tìm nhà giá rẻ có Hiếu lo</title>
</head>


<body>

<!-- Start Header/Navigation -->
<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

    <div class="container">
        <a class="navbar-brand" href="index.html">Nhà của Bột<span>.</span></a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni"
                aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsFurni">
            <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                <li><a class="nav-link" href="${pageContext.request.contextPath}/view/home/home.jsp">Trang chủ</a></li>
                <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/view/home/room.jsp">Phòng trọ</a></li>
                <li><a class="nav-link" href="${pageContext.request.contextPath}/view/home/details_room.jsp">Chi tiết phòng</a></li>
                <li><a class="nav-link" href="${pageContext.request.contextPath}/view/home/contact.jsp">Liên hệ</a></li>
            </ul>

            <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                <li><a class="nav-link" href="#"><img
                        src="${pageContext.request.contextPath}/view/home/images/user.svg"></a></li>
                <li><a class="nav-link" href="cart.html"><img
                        src="${pageContext.request.contextPath}/view/home/images/cart.svg"></a></li>
            </ul>
        </div>
    </div>

</nav>


<div class="untree_co-section product-section before-footer-section">
    <div class="container">
        <div class="row">

            <!-- 101 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong101.jpg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 101</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>

            <!-- 102 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong102.jpg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 102</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>

            <!-- 103 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong103.jpg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 103</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>

            <!-- 104 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong104.jpg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 104</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>

            <!-- 105 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong105.jpeg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 105</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>

            <!-- 201 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong201.jpg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 201</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>

            <!-- 202 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong202.jpeg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 202</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>

            <!-- 203 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong203.jpeg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 203</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>

            <!-- 204 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong204.jpeg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 204</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>

            <!-- 205 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong205.jpeg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 205</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>

            <!-- 301 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong301.jpeg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 301</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>

            <!-- 302 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong302.jpeg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 302</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>

            <!-- 303 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong303.jpeg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 303</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>

            <!-- 304 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong304.jpeg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 304</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>

            <!-- 305 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="#">
                    <img src="img_house/phong305.jpg" class="img-fluid product-thumbnail">
                    <h3 class="product-title">Phòng 305</h3>
                    <strong class="product-price">3.000.000 VND</strong>
                    <span class="icon-cross">
						<img src="images/cross.svg" class="img-fluid">
						</span>
                </a>
            </div>
        </div>
    </div>
</div>



<!-- Start Footer Section -->
<footer class="footer-section">
    <div class="container relative">

        <div class="sofa-img">
            <img src="${pageContext.request.contextPath}/view/home/img_house/house2.png" alt="Image" class="img-fluid">
        </div>

        <div class="row">
            <div class="col-lg-8">
                <div class="subscription-form">
                    <h3 class="d-flex align-items-center"><span class="me-1"><img
                            src="${pageContext.request.contextPath}/view/home/images/envelope-outline.svg"
                            alt="Image" class="img-fluid"></span><span>Đăng ký nhận thông tin phòng mới
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
                <div class="mb-4 footer-logo-wrap"><a href="#" class="footer-logo">NhaTro247<span>.</span></a></div>
                <p class="mb-4">Nền tảng hỗ trợ bạn tìm và thuê phòng trọ nhanh chóng, minh bạch và an toàn.
                    Cập nhật phòng mới mỗi ngày, dễ dàng đặt lịch xem phòng và liên hệ chủ trọ trực tiếp</p>

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
<script src="${pageContext.request.contextPath}/view/home/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/view/home/js/tiny-slider.js"></script>
<script src="${pageContext.request.contextPath}/view/home/js/custom.js"></script>

</body>

</html>

