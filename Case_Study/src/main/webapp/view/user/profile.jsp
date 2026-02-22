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

      <div class="container my-5">
        <div class="row">

          <!-- LEFT: AVATAR + BASIC INFO -->
          <div class="col-md-4">
            <div class="card shadow-sm text-center">
              <div class="card-body">

                <img src="${pageContext.request.contextPath}/view/user/images/user.svg"
                     class="rounded-circle mb-3"
                     width="120">

                <h5 class="mb-1"><%= user.getFullName() %></h5>

                <%
                  String roleText = "Người thuê";
                  if ("ADMIN".equals(account.getRole())) roleText = "Quản trị viên";
                  else if ("OWNER".equals(account.getRole())) roleText = "Chủ trọ";
                %>

                <small class="text-muted"><%= roleText %></small>

                <hr>

                <% if ("active".equalsIgnoreCase(user.getStatus())) { %>
                <span class="badge bg-success">Đang hoạt động</span>
                <% } else { %>
                <span class="badge bg-danger">Bị khóa</span>
                <% } %>

              </div>
            </div>
          </div>

          <!-- RIGHT: DETAIL INFO -->
          <div class="col-md-8">
            <div class="card shadow-sm">
              <div class="card-header bg-dark text-white">
                <i class="fa fa-id-card me-2"></i> Thông tin cá nhân
              </div>

              <div class="card-body">

                <!-- ROW 1 -->
                <div class="row mb-3">
                  <div class="col-md-6">
                    <strong>Họ và tên</strong>
                    <p><%= user.getFullName() %></p>
                  </div>

                  <div class="col-md-6">
                    <strong>Email</strong>
                    <p><%= user.getEmail() %></p>
                  </div>
                </div>

                <!-- ROW 2 -->
                <div class="row mb-3">
                  <div class="col-md-6">
                    <strong>Số điện thoại</strong>
                    <p><%= account.getPhone() %></p>
                  </div>

                  <div class="col-md-6">
                    <strong>Vai trò</strong>
                    <p>
                      <span class="badge bg-primary"><%= account.getRole() %></span>
                    </p>
                  </div>
                </div>

                <!-- ROW 3 -->
                <div class="row mb-3">
                  <div class="col-md-12">
                    <strong>Địa chỉ</strong>
                    <p><%= user.getAddress() %></p>
                  </div>
                </div>

                <!-- ROW 4 -->
                <div class="row mb-3">
                  <div class="col-md-6">
                    <strong>Mã người dùng</strong>
                    <p><%= user.getUserId() %></p>
                  </div>

                  <div class="col-md-6">
                    <strong>Trạng thái tài khoản</strong>
                    <p>
                      <% if ("active".equalsIgnoreCase(user.getStatus())) { %>
                      <span class="badge bg-success">Hoạt động</span>
                      <% } else { %>
                      <span class="badge bg-danger">Bị khóa</span>
                      <% } %>
                    </p>
                  </div>
                </div>

                <hr>

                <!-- ACTION -->
                <div class="d-flex justify-content-end gap-2">
                  <a href="#" class="btn btn-outline-primary">
                    <i class="fa fa-edit"></i> Cập nhật thông tin
                  </a>

                  <a href="${pageContext.request.contextPath}/account?action=logout"
                     class="btn btn-outline-danger">
                    <i class="fa fa-sign-out-alt"></i> Đăng xuất
                  </a>
                </div>

              </div>
            </div>
          </div>

        </div>
      </div>


    </div>
  </div>
</div>
<!-- End Product Section -->


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