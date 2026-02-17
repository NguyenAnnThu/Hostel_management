<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.case_study.entity.Account" %>
<%@ page import="com.example.case_study.entity.User" %>

<%
    Account account = (Account) session.getAttribute("account");
    User user = null;
    if (account != null) {
        user = account.getUser();
    }
%>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/user/css/style.css">
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
                <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/view/user/home.jsp">Trang chủ</a></li>
                <li><a class="nav-link" href="${pageContext.request.contextPath}/view/user/room.jsp">Phòng trọ</a></li>
                <li><a class="nav-link" href="${pageContext.request.contextPath}/view/user/detailsRoom.jsp">Chi tiết phòng</a></li>
                <li><a class="nav-link" href="${pageContext.request.contextPath}/view/user/contact.jsp">Liên hệ</a></li>
            </ul>

            <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                <li class="nav-item dropdown">
                    <%
                        if (user == null) {
                    %>
                    <!-- CHƯA LOGIN -->
                    <a class="nav-link" href="${pageContext.request.contextPath}/view/owner/login.jsp"><img
                        src="${pageContext.request.contextPath}/view/user/images/user.svg">
                    </a>
                    <%
                    } else {
                    %>
                    <!-- ĐÃ LOGIN -->
                    <a class="nav-link dropdown-toggle d-flex align-items-center"
                       href="#"
                       id="userDropdown"
                       role="button"
                       data-bs-toggle="dropdown"
                       aria-expanded="false">

                        <img src="${pageContext.request.contextPath}/view/user/images/user.svg"
                             style="width:20px; margin-right:6px;">
                        <span style="color:white; font-size:14px;">
                <%= user.getFullName() %>
            </span>
                    </a>

                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                        <li>
                            <a class="dropdown-item"
                               href="${pageContext.request.contextPath}/account?action=profile">
                                <i class="fa fa-user me-2"></i> Hồ sơ cá nhân
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item"
                               href="${pageContext.request.contextPath}/account?action=logout">
                                <i class="fa fa-sign-out-alt me-2"></i> Đăng xuất
                            </a>
                        </li>
                    </ul>
                    <%
                        }
                    %>
                </li>
                <li><a class="nav-link" href="cart.html"><img
                        src="${pageContext.request.contextPath}/view/user/images/cart.svg"></a></li>
            </ul>
        </div>
    </div>

</nav>
<!-- End Header/Navigation -->

<!-- Start Hero Section -->
<div class="hero">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-5">
                <div class="intro-excerpt">
                    <h1>Một nơi ở tốt <span clsas="d-block"><br>Là khởi đầu của cuộc sống an tâm</span></h1>
                    <p class="mb-4">Chúng tôi giúp bạn tìm được phòng trọ sạch sẽ, an toàn, đúng ngân sách – để bạn
                        yên
                        tâm học tập và làm việc mỗi ngày.</p>
                    <p><a href="shop.html" class="btn btn-secondary me-2">Xem phòng ngay</a><a href="contact.html"
                                                                                               class="btn btn-white-outline">Tìm
                        hiểu thêm</a></p>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="">
                    <img src="${pageContext.request.contextPath}/view/user/img_house/home1.png"
                         style="padding: 0% 20% 0% 20%; width: 130%;">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Hero Section -->

<!-- Start Product Section -->
<div class="product-section" style="margin-top: 2%;">
    <div class="container">
        <div class="row">

            <!-- Start Column 1 -->
            <div class="col-md-12 col-lg-3 mb-5 mb-lg-0">
                <h2 class="mb-4 section-title">Phòng trọ dành cho sinh viên.</h2>
                <p class="mb-4">Giá thuê phù hợp, gần trường học, giờ giấc tự do. Môi trường yên tĩnh, hỗ trợ tốt
                    cho
                    việc học tập và sinh hoạt. </p>
                <p><a href="shop.html" class="btn">Xem thêm</a></p>
            </div>
            <!-- End Column 1 -->

            <!-- Start Column 2 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                <a class="product-item" href="cart.html">
                    <img src="${pageContext.request.contextPath}/view/user/img_house/phong101.jpg"
                         class="img-fluid product-thumbnail">
                    <h3 class="product-title">Tầng 1</h3>
                    <strong class="product-price">3.000.000 VND</strong>

                    <span class="icon-cross">
                            <img src="${pageContext.request.contextPath}/view/user/images/cross.svg" class="img-fluid">
                        </span>
                </a>
            </div>
            <!-- End Column 2 -->

            <!-- Start Column 3 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                <a class="product-item" href="cart.html">
                    <img src="${pageContext.request.contextPath}/view/user/img_house/phong201.jpg"
                         class="img-fluid product-thumbnail">
                    <h3 class="product-title">Tầng 3</h3>
                    <strong class="product-price">3.500.000</strong>

                    <span class="icon-cross">
                            <img src="${pageContext.request.contextPath}/view/user/images/cross.svg" class="img-fluid">
                        </span>
                </a>
            </div>
            <!-- End Column 3 -->

            <!-- Start Column 4 -->
            <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                <a class="product-item" href="cart.html">
                    <img src="${pageContext.request.contextPath}/view/user/img_house/phong303.jpeg"
                         class="img-fluid product-thumbnail">
                    <h3 class="product-title">Tầng 4</h3>
                    <strong class="product-price">3.700.000</strong>

                    <span class="icon-cross">
                            <img src="${pageContext.request.contextPath}/view/user/images/cross.svg" class="img-fluid">
                        </span>
                </a>
            </div>
            <!-- End Column 4 -->

        </div>
    </div>
</div>
<!-- End Product Section -->

<!-- Start Why Choose Us Section -->
<div class="why-choose-section">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-6">
                <h2 class="section-title">Hãy chọn chúng tôi</h2>
                <p>Chúng tôi cung cấp hệ thống tìm kiếm và thuê phòng trọ nhanh chóng, minh bạch và an toàn.
                    Dễ dàng xem phòng, đặt lịch hẹn, ký hợp đồng và thanh toán ngay trên nền tảng.</p>

                <div class="row my-5">
                    <div class="col-6 col-md-6">
                        <div class="feature">
                            <div class="icon">
                                <img src="${pageContext.request.contextPath}/view/user/images/truck.svg" alt="Image"
                                     class="imf-fluid">
                            </div>
                            <h3>Xem phòng nhanh – Đặt lịch dễ dàng</h3>
                            <p>Chọn phòng phù hợp, xem hình ảnh chi tiết và đặt lịch xem phòng chỉ trong vài phút.
                            </p>
                        </div>
                    </div>

                    <div class="col-6 col-md-6">
                        <div class="feature">
                            <div class="icon">
                                <img src="${pageContext.request.contextPath}/view/user/images/bag.svg" alt="Image"
                                     class="imf-fluid">
                            </div>
                            <h3>Giá rõ ràng – Không phí ẩn</h3>
                            <p>Thông tin giá thuê, tiền cọc và chi phí dịch vụ được công khai minh bạch, giúp bạn
                                yên tâm lựa chọn.
                            </p>
                        </div>
                    </div>

                    <div class="col-6 col-md-6">
                        <div class="feature">
                            <div class="icon">
                                <img src="${pageContext.request.contextPath}/view/user/images/return.svg" alt="Image"
                                     class="imf-fluid">
                            </div>
                            <h3>Hỗ trợ 24/7</h3>
                            <p>Đội ngũ chăm sóc luôn sẵn sàng hỗ trợ bạn từ lúc tìm phòng đến khi chuyển vào ở.
                            </p>
                        </div>
                    </div>

                    <div class="col-6 col-md-6">
                        <div class="feature">
                            <div class="icon">
                                <img src="${pageContext.request.contextPath}/view/user/images/return.svg" alt="Image"
                                     class="imf-fluid">
                            </div>
                            <h3>Hợp đồng rõ ràng – An tâm thuê ở</h3>
                            <p>Quy trình thuê phòng rõ ràng, hợp đồng minh bạch, bảo vệ quyền lợi cho cả người thuê
                                và
                                chủ trọ.</p>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-lg-5">
                <div class="img-wrap">
                    <img style="width: 90%;"
                         src="https://images.pexels.com/photos/17181946/pexels-photo-17181946.jpeg" alt="Image"
                         class="img-fluid">
                </div>
            </div>

        </div>
    </div>
</div>
<!-- End Why Choose Us Section -->

<!-- Start We Help Section -->
<div class="we-help-section">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-7 mb-5 mb-lg-0">
                <div class="imgs-grid">
                    <div class="grid grid-1"><img
                            src="https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg"
                            alt="Untree.co"></div>
                    <div class="grid grid-2"><img
                            src="https://images.pexels.com/photos/27453081/pexels-photo-27453081.jpeg"
                            alt="Untree.co"></div>
                    <div class="grid grid-3"><img
                            src="https://images.pexels.com/photos/2471189/pexels-photo-2471189.jpeg"
                            alt="Untree.co"></div>
                </div>
            </div>
            <div class="col-lg-5 ps-lg-5">
                <h2 class="section-title mb-4">Chúng tôi giúp bạn tìm phòng trọ đúng nhu cầu</h2>
                <p>Tìm phòng trọ chưa bao giờ dễ đến vậy.
                    Bạn có thể xem hình ảnh thực tế, so sánh giá thuê, tiện ích và vị trí ngay trên một nền tảng.
                    Đặt lịch xem phòng nhanh chóng, liên hệ chủ trọ trực tiếp và thuê an tâm với thông tin minh
                    bạch.</p>

                <ul class="list-unstyled custom-list my-4">
                    <li>Hình ảnh thật – thông tin rõ ràng</li>
                    <br>
                    <li>Lọc theo giá, khu vực, tiện ích</li>
                    <br>
                    <li>Đặt lịch xem phòng chỉ 1 phút</li>
                    <br>
                    <li>Hỗ trợ nhanh, thuê an tâm</li>
                    <br>
                </ul>
                <p><a herf="#" class="btn">Xem thêm</a></p>
            </div>
        </div>
    </div>
</div>
<!-- End We Help Section -->

<!-- Start Popular Product -->
<div class="popular-product">
    <div class="container">
        <div class="row">

            <div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
                <div class="product-item-sm d-flex">
                    <div class="thumbnail">
                        <img src="https://cdn-icons-png.flaticon.com/128/1040/1040993.png " alt="Image"
                             class="img-fluid">
                    </div>
                    <div class="pt-3">
                        <h3>Phòng trọ giá tốt</h3>
                        <p>Xem phòng phù hợp ngân sách, đầy đủ thông tin giá thuê, tiền cọc, chi phí dịch vụ. </p>
                        <p><a href="#">Xem chi tiết</a></p>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
                <div class="product-item-sm d-flex">
                    <div class="thumbnail">
                        <img src="https://cdn-icons-png.flaticon.com/128/12942/12942653.png" alt="Image"
                             class="img-fluid">
                    </div>
                    <div class="pt-3">
                        <h3>Căn hộ mini tiện nghi</h3>
                        <p>Phòng đẹp, nội thất cơ bản, phù hợp người đi làm hoặc ở lâu dài.</p>
                        <p><a href="#">Xem chi tiết</a></p>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
                <div class="product-item-sm d-flex">
                    <div class="thumbnail">
                        <img src="https://cdn-icons-png.flaticon.com/128/10826/10826419.png" alt="Image"
                             class="img-fluid">
                    </div>
                    <div class="pt-3">
                        <h3>Phòng trọ gần trường / trung tâm</h3>
                        <p>Ưu tiên vị trí thuận tiện đi học, đi làm, dễ di chuyển và an ninh tốt. </p>
                        <p><a href="#">Xem chi tiết</a></p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- End Popular Product -->

<!-- Start Testimonial Slider -->
<div class="testimonial-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 mx-auto text-center">
                <h2 class="section-title">Khách hàng nói gì về chúng tôi</h2>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="testimonial-slider-wrap text-center">

                    <div id="testimonial-nav">
                        <span class="prev" data-controls="prev"><span class="fa fa-chevron-left"></span></span>
                        <span class="next" data-controls="next"><span class="fa fa-chevron-right"></span></span>
                    </div>

                    <div class="testimonial-slider">

                        <div class="item">
                            <div class="row justify-content-center">
                                <div class="col-lg-8 mx-auto">

                                    <div class="testimonial-block text-center">
                                        <blockquote class="mb-5">
                                            <p>“Mình tìm phòng rất nhanh, ảnh đúng thực tế và giá rõ ràng. Đặt lịch
                                                xem phòng tiện, chủ trọ phản hồi nhanh nên mình chốt phòng trong 1
                                                ngày. Trải nghiệm rất ổn!”</p>
                                        </blockquote>

                                        <div class="author-info">
                                            <div class="author-pic">
                                                <img src="${pageContext.request.contextPath}/view/user/images/person-1.png"
                                                     alt="Maria Jones" class="img-fluid">
                                            </div>
                                            <h3 class="font-weight-bold">Van Hieu</h3>
                                            <span class="position d-block mb-3">CEO, FSoft.</span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- END item -->

                        <div class="item">
                            <div class="row justify-content-center">
                                <div class="col-lg-8 mx-auto">

                                    <div class="testimonial-block text-center">
                                        <blockquote class="mb-5">
                                            <p>“Mình tìm phòng rất nhanh, ảnh đúng thực tế và giá rõ ràng. Đặt lịch
                                                xem phòng tiện, chủ trọ phản hồi nhanh nên mình chốt phòng trong 1
                                                ngày. Trải nghiệm rất ổn!
                                                Mình thích nhất là thông tin phòng đầy đủ, xem là hiểu ngay, không
                                                phải hỏi đi hỏi lại.
                                                Hỗ trợ cũng nhiệt tình, hướng dẫn kỹ nên mình thuê rất yên tâm.”</p>
                                        </blockquote>

                                        <div class="author-info">
                                            <div class="author-pic">
                                                <img src="${pageContext.request.contextPath}/view/user/images/person-1.png"
                                                     alt="Maria Jones" class="img-fluid">
                                            </div>
                                            <h3 class="font-weight-bold">Trung Hiếu</h3>
                                            <span class="position d-block mb-3">Sinh Viên, Đà Nẵng.</span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- END item -->

                        <div class="item">
                            <div class="row justify-content-center">
                                <div class="col-lg-8 mx-auto">

                                    <div class="testimonial-block text-center">
                                        <blockquote class="mb-5">
                                            <p>“Mình tìm phòng rất nhanh, ảnh đúng thực tế và giá rõ ràng. Đặt lịch
                                                xem phòng tiện, chủ trọ phản hồi nhanh nên mình chốt phòng trong 1
                                                ngày. Trải nghiệm rất ổn!
                                                Mình thích nhất là thông tin phòng đầy đủ, xem là hiểu ngay, không
                                                phải hỏi đi hỏi lại.
                                                Hỗ trợ cũng nhiệt tình, hướng dẫn kỹ nên mình thuê rất yên tâm.
                                                Phòng nhận được đúng như mô tả, sạch sẽ và an ninh tốt.
                                                Nhờ có bộ lọc theo khu vực và mức giá nên mình tiết kiệm được rất
                                                nhiều thời gian tìm kiếm.”</p>
                                        </blockquote>

                                        <div class="author-info">
                                            <div class="author-pic">
                                                <img src="${pageContext.request.contextPath}/view/user/images/person-1.png"
                                                     alt="Maria Jones" class="img-fluid">
                                            </div>
                                            <h3 class="font-weight-bold">Anh Thư</h3>
                                            <span class="position d-block mb-3">Sinh Viên, Đà Nẵng.</span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- END item -->

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Testimonial Slider -->

<!-- Start Blog Section -->
<div class="blog-section">
    <div class="container">
        <div class="row mb-5">
            <div class="col-md-6">
                <h2 class="section-title">Blog</h2>
            </div>
            <div class="col-md-6 text-start text-md-end">
                <a href="#" class="more">Xem tất cả</a>
            </div>
        </div>

        <div class="row">

            <div class="col-12 col-sm-6 col-md-4 mb-4 mb-md-0">
                <div class="post-entry">
                    <a href="#" class="post-thumbnail"><img
                            src="${pageContext.request.contextPath}/view/user/img_house/p401.png" alt="Image"
                            class="img-fluid"></a>
                    <div class="post-content-entry">
                        <h3><a href="#">Kinh nghiệm thuê trọ lần đầu (tránh bị “hớ”)</a></h3>
                        <div class="meta">
                            <span><a href="#">Ronaldo</a></span> <span> - <a href="#">Dec 19, 2025</a></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-md-4 mb-4 mb-md-0">
                <div class="post-entry">
                    <a href="#" class="post-thumbnail"><img
                            src="${pageContext.request.contextPath}/view/user/img_house/p402.png" alt="Image"
                            class="img-fluid"></a>
                    <div class="post-content-entry">
                        <h3><a href="#">Checklist xem phòng trọ: 10 điều phải kiểm tra trước khi chốt</a></h3>
                        <div class="meta">
                            <span><a href="#">Messi</a></span> <span> - <a href="#">Dec 15, 2025</a></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-md-4 mb-4 mb-md-0">
                <div class="post-entry">
                    <a href="#" class="post-thumbnail"><img
                            src="${pageContext.request.contextPath}/view/user/img_house/p403.png" alt="Image"
                            class="img-fluid"></a>
                    <div class="post-content-entry">
                        <h3><a href="#">Phòng nhỏ vẫn tiện nghi: mẹo sắp xếp gọn đẹp, tiết kiệm diện tích</a></h3>
                        <div class="meta">
                            <span><a href="#">Lisa</a></span> <span> - <a href="#">Dec 12, 2024</a></span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- End Blog Section -->

<!-- Start Footer Section -->
<footer class="footer-section">
    <div class="container relative">

        <div class="sofa-img">
            <img src="${pageContext.request.contextPath}/view/user/img_house/house2.png" alt="Image" class="img-fluid">
        </div>

        <div class="row">
            <div class="col-lg-8">
                <div class="subscription-form">
                    <h3 class="d-flex align-items-center"><span class="me-1"><img
                            src="${pageContext.request.contextPath}/view/user/images/envelope-outline.svg"
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
<script src="${pageContext.request.contextPath}/view/user/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/view/user/js/tiny-slider.js"></script>
<script src="${pageContext.request.contextPath}/view/user/js/custom.js"></script>

</body>

</html>