<%-- 
    Document   : index
    Created on : Jul 4, 2024, 1:37:35 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Tourist - Travel Agency HTML Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <style>
            .chat-btn {
                position: fixed;
                bottom: 20px;
                left: 20px;
                z-index: 1000;
            }

            #chatbox {
                position: fixed;
                bottom: 80px; /* Tạo khoảng cách giữa button và chat box */
                left: 20px;
                width: 350px; /* Tăng kích thước box chat */
                height: 450px; /* Tăng kích thước box chat */
                border: 1px solid #ccc;
                background: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                display: none;
                z-index: 1000;
            }

            .chat-header {
                padding: 10px;
                background: #98C33A;
                color: white;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .chat-header .h-child {
                display: flex;
                align-items: center;
            }
            .chat-header img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                margin-right: 10px;
                border: 1px solid rgb(231, 231, 231);
                padding: 5px;
            }
            .chat-body {
                padding: 10px;
                overflow-y: auto; /* Bật cuộn dọc */
                height: calc(100% - 50px); /* Chiều cao cố định cho phần body */
                max-height: 350px; /* Đảm bảo phần chat-body có chiều cao cố định */
            }
            .msg {
                background: white;
                padding: 5px 15px;
                width: auto; /* Cho phép tin nhắn dài tự điều chỉnh độ rộng */
                max-width: 90%; /* Giới hạn độ rộng tối đa */
                font-size: 14px;
                color: lightslategrey;
                box-shadow: 0 0 5px rgb(226, 226, 226);
                text-align: left;
                word-wrap: break-word; /* Cho phép xuống dòng khi tin nhắn dài */
            }
            .test {
                text-align: right;
                margin: 20px 0;
            }
            .rep {
                background: rgb(253, 243, 224);
                color: lightslategray;
                padding: 5px 15px;
                border-radius: 0; /* Xóa border-radius */
                font-size: 14px;
                box-shadow: 0 0 5px rgb(211, 211, 211);
                word-wrap: break-word; /* Cho phép xuống dòng khi tin nhắn dài */
            }
            .opt {
                padding: 5px 20px;
                border: 1px solid blueviolet;
                border-radius: 1rem;
                margin: 0.3rem 0.5rem;
                display: inline-block;
                cursor: pointer;
                font-weight: 500;
                background: white;
                text-align: center;
                font-size: 14px;
                color: blueviolet;
            }
            .link {
                text-decoration: none;
                display: block;
                text-align: center;
                color: aliceblue !important;
                background: blueviolet;
            }
            .m-link {
                text-decoration: none;
            }
            .link:active {
                background: white;
                border: 1px solid blueviolet;
                color: blueviolet;
            }
        </style>
    </head>

    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Topbar Start -->
        <div class="container-fluid bg-dark px-5 d-none d-lg-block">
            <div class="row gx-0">
                <div class="col-lg-8 text-center text-lg-start mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center" style="height: 45px;">
                        <small class="me-3 text-light"><i class="fa fa-map-marker-alt me-2"></i>FPT University, Hoa Lac, Ha Noi</small>
                        <small class="me-3 text-light"><i class="fa fa-phone-alt me-2"></i>0123 456 789</small>
                        <small class="text-light"><i class="fa fa-envelope-open me-2"></i>traveland@gmail.com</small>
                    </div>
                </div>
                <div class="col-lg-4 text-center text-lg-end">
                    <div class="d-inline-flex align-items-center" style="height: 45px;">
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href="https://www.twitter.com/" target="_blank"><i class="fab fa-twitter fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin-in fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle" href="https://www.youtube.com/" target="_blank"><i class="fab fa-youtube fw-normal"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar & Hero Start -->
        <div class="container-fluid position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                <a href="" class="navbar-brand p-0">
                    <h1 class="text-primary m-0"><i class="fa fa-map-marker-alt me-3"></i>Traveland</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="home" class="nav-item nav-link active">Home</a>
                        <a href="about.jsp" class="nav-item nav-link">About</a>
                        <a href="destination" class="nav-item nav-link">Destination</a>
                        <a href="packageController" class="nav-item nav-link">Packages</a>
                        <a href="TestimonialController" class="nav-item nav-link">Testimonial</a>
                        <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                    </div>
                    <c:choose>
                        <c:when test="${sessionScope.name == null}">
                            <a href="register.jsp" class="btn btn-primary rounded-pill py-2 px-4">Register</a>
                        </c:when>
                        <c:otherwise>
                            <a href="AccountController" class="btn btn-primary rounded-pill py-2 px-4">Profile</a>
                            <a href="log_out" class="btn btn-primary rounded-pill py-2 px-4">Log Out</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </nav>

            <div class="container-fluid bg-primary py-5 mb-5 hero-header">
                <div class="container py-5">
                    <div class="row justify-content-center py-5">
                        <div class="col-lg-10 pt-lg-5 mt-lg-5 text-center">
                            <h1 class="display-3 text-white mb-3 animated slideInDown">Enjoy Your Vacation With Us</h1>
                            <p class="fs-4 text-white mb-4 animated slideInDown">Tempor erat elitr rebum at clita diam amet diam et eos erat ipsum lorem sit</p>
                            <div class="position-relative w-75 mx-auto animated slideInDown">
                                <form method="get" action="SearchController">
                                    <input name="destination" class="form-control border-0 rounded-pill w-100 py-3 ps-4 pe-5" type="text" placeholder="Eg: Thailand">
                                    <button type="submit" class="btn btn-primary rounded-pill py-2 px-4 position-absolute top-0 end-0 me-2" style="margin-top: 7px;">Search</button>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->

        <!<!-- Start Chat Bot -->
        <div id="chatbox">
            <div class="chat-header">
                <div class="h-child">
                    <img src="img/chatbot (1).png" alt="avatar" id="avatar">
                    <div>
                        <span class="name">Chatbot</span>
                        <br>
                        <span style="color:#0808FF">online</span>
                    </div>
                </div>
                <div>
                    <button class="btn btn-sm btn-light refBtn"><i class="fas fa-sync-alt" onclick="initChat()"></i></button>
                </div>
            </div>
            <div class="chat-body" id="chat-box">
                <!-- Chat content goes here -->
            </div>
        </div>
        <button id="init" class="btn btn-primary chat-btn">START CHAT</button>
        <!-<!-- End Chat Bot -->


        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s" style="min-height: 400px;">
                        <div class="position-relative h-100">
                            <img class="img-fluid position-absolute w-100 h-100" src="img/about.jpg" alt="" style="object-fit: cover;">
                        </div>
                    </div>
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
                        <h6 class="section-title bg-white text-start text-primary pe-3">About Us</h6>
                        <h1 class="mb-4">Welcome to <span class="text-primary">Tourist</span></h1>
                        <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit.</p>
                        <p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>
                        <div class="row gy-2 gx-4 mb-4">
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>First Class Flights</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Handpicked Hotels</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>5 Star Accommodations</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Latest Model Vehicles</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>150 Premium City Tours</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>24/7 Service</p>
                            </div>
                        </div>
                        <a class="btn btn-primary py-3 px-5 mt-2" href="">Read More</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- Destination Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="text-center">
                    <h6 class="section-title bg-white text-center text-primary px-3">DESTINATION</h6>
                    <h1 class="mb-5">Popular Destination</h1>
                </div>
                <div class="owl-carousel testimonial-carousel position-relative">
                    <c:forEach var="destination" items="${listDes}">
                        <div class="testimonial-item bg-white text-center border p-4">
                            <img class="bg-white rounded-circle shadow p-1 mx-auto mb-3" src="img/${destination.image_url}" style="width: 80px; height: 80px;">
                            <h5 class="mb-0">${destination.name}</h5>
                            <p>${destination.location}</p>
                            <p class="mb-0">${destination.description}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Destination Start -->


        <!-- Package Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="text-center">
                    <h6 class="section-title bg-white text-center text-primary px-3">PACKAGES</h6>
                    <h1 class="mb-5">Awesome Packages</h1>
                </div>
                <div class="owl-carousel testimonial-carousel position-relative">
                    <c:forEach var="pac" items="${listPac}">
                        <div class="package-item">
                            <div class="overflow-hidden">
                                <img class="img-fluid" src="img/${pac.image_url}" alt="" style="width: 400px; height: 160px;">
                            </div>
                            <div class="d-flex border-bottom">
                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-calendar-alt text-primary me-2"></i>${pac.duration}</small>
                                <small class="flex-fill text-center py-2"><i class="fa fa-user text-primary me-2"></i>${pac.number_of_people} Person</small>
                            </div>
                            <div class="text-center p-4">
                                <h3 class="mb-0">$${pac.price}</h3>
                                <p>${pac.description}</p>
                                <div class="d-flex justify-content-center mb-2">
                                    <a href="#" class="btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                    <a href="#" class="btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Book Now</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Package End -->
        

        <!-- Testimonial Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="text-center">
                    <h6 class="section-title bg-white text-center text-primary px-3">Testimonial</h6>
                    <h1 class="mb-5">Our Clients Say!!!</h1>
                </div>
                <div class="owl-carousel testimonial-carousel position-relative">
                    <c:forEach items="${listTes}" var="tes" >
                        <div class="testimonial-item bg-white text-center border p-4">
                            <img class="bg-white rounded-circle shadow p-1 mx-auto mb-3" src="img/testimonial-1.jpg"
                                 style="width: 80px; height: 80px;">
                            <c:forEach items="${listCus}" var="cus" >
                                <c:if test="${cus.getUserID() eq tes.getCustomerID()}">
                                    <h5 class="mb-0">${cus.getFullName()}</h5>
                                </c:if>
                            </c:forEach>
                            <p class="mb-0">${tes.getContent()}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-white mb-3">Company</h4>
                        <a class="btn btn-link" href="about.jsp">About Us</a>
                        <a class="btn btn-link" href="contact.jsp">Contact Us</a>
                        <a class="btn btn-link" href="">Privacy Policy</a>
                        <a class="btn btn-link" href="">Terms & Condition</a>
                        <a class="btn btn-link" href="">FAQs & Help</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-white mb-3">Contact</h4>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>FPT University, Hoa Lac, Ha Noi</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>0123 456 789</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>traveland@gmail.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href="https://www.twitter.com/" target="_blank"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href="https://www.youtube.com/" target="_blank"><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-white mb-3">Gallery</h4>
                        <div class="row g-2 pt-2">
                            <div class="col-4">
                                <img class="img-fluid bg-light p-1" src="img/package-1.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid bg-light p-1" src="img/package-2.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid bg-light p-1" src="img/package-3.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid bg-light p-1" src="img/package-2.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid bg-light p-1" src="img/package-3.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid bg-light p-1" src="img/package-1.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-white mb-3">Newsletter</h4>
                        <p>Sign up for email to immediately receive the latest news and offers from us.</p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control border-primary w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Traveland.</a>

                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Belong to <a class="border-bottom" href="https://htmlcodex.com">GiapTDHE186094</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="home">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script src="js/index.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    </body>

</html>
