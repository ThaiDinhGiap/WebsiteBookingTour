<%-- 
    Document   : booking
    Created on : Jul 4, 2024, 1:38:33 AM
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
            .edit-icon {
                cursor: pointer;
            }
            .save-btn {
                display: none;
                margin-top: 20px;
                text-align: center;
            }
            .booking-card {
                margin-bottom: 20px;
            }
            .action-buttons {
                display: flex;
                justify-content: space-around;
            }
            .action-buttons button {
                margin-right: 5px;
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
                    <h1 class="text-primary m-0"><i class="fa fa-map-marker-alt me-3"></i>Tourist</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="home" class="nav-item nav-link">Home</a>
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
                            <h1 class="display-3 text-white animated slideInDown">ACCOUNT</h1>
                        </div>             
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Process Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center pb-4 wow fadeInUp" data-wow-delay="0.1s">
                    <div style="position: relative; display: inline-block;">
                        <img id="avatarImage" src="${avatar_url}" alt="Avatar" class="img-fluid rounded-circle" style="width: 150px; height: 150px;">
                        <i class="fas fa-edit" id="editIcon" style="position: absolute; bottom: 10px; right: 10px; font-size: 24px; background: white; border-radius: 50%; padding: 5px; cursor: pointer;"></i>
                        <form id="uploadForm" action="avatarController" method="post" enctype="multipart/form-data">
                            <input type="file" id="uploadImage" name="img" accept=".jpg, .jpeg, .png" style="display: none;">
                        </form>
                    </div>
                    <br><br>
                    <h4 class="section-title bg-white text-center text-primary px-3">YOUR ACCOUNT</h4>
                    <br><br>
                </div>

                <div class="row gy-5 gx-4 justify-content-center">
                    <div class="col-lg-4 col-sm-6 text-center pt-4 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="position-relative border border-primary pt-5 pb-4 px-4">
                            <div class="d-inline-flex align-items-center justify-content-center bg-primary rounded-circle position-absolute top-0 start-50 translate-middle shadow" style="width: 100px; height: 100px;">
                                <i class="fa fa-user fa-3x text-white"></i>
                            </div>
                            <h3 class="mt-4">Profile</h3>
                            <hr class="w-25 mx-auto bg-primary mb-1">
                            <hr class="w-50 mx-auto bg-primary mt-0">
                            <div class="container mt-5">
                                <div class="card mb-4 shadow-sm">
                                    <div class="card-body">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                                            <input type="text" id="fullName" class="form-control" value="${us.getFullName()}" readonly>
                                            <span class="input-group-text edit-icon" onclick="editField('fullName')"><i class="fas fa-edit"></i></span>
                                        </div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                            <input type="text" id="email" class="form-control" value="${us.getEmail()}" readonly>
                                            <span class="input-group-text edit-icon" onclick="editField('email')"><i class="fas fa-edit"></i></span>
                                        </div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><i class="fas fa-user-circle"></i></span>
                                            <input type="text" id="username" class="form-control" value="${us.getUsername()}" readonly>
                                            <span class="input-group-text edit-icon" onclick="editField('username')"><i class="fas fa-edit"></i></span>
                                        </div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                            <input type="text" id="phoneNumber" class="form-control" value="${us.getPhoneNumber()}" readonly>
                                            <span class="input-group-text edit-icon" onclick="editField('phoneNumber')"><i class="fas fa-edit"></i></span>
                                        </div>
                                        <div class="save-btn">
                                            <button class="btn btn-primary" onclick="saveChanges()">Save</button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 text-center pt-4 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="position-relative border border-primary pt-5 pb-4 px-4">
                            <div class="d-inline-flex align-items-center justify-content-center bg-primary rounded-circle position-absolute top-0 start-50 translate-middle shadow" style="width: 100px; height: 100px;">
                                <i class="fa fa-comment fa-3x text-white"></i>
                            </div>
                            <h3 class="mt-4">Your Testimonial</h3>
                            <hr class="w-25 mx-auto bg-primary mb-1">
                            <hr class="w-50 mx-auto bg-primary mt-0">
                            <div class="container mt-5">
                                <c:forEach var="testimonial" items="${tes}">
                                    <div id="testimonial-${testimonial.getTestimonialID()}" class="card testimonial-card shadow-sm">
                                        <div class="card-body">
                                            <div class="input-group mb-3">
                                                <span class="input-group-text"><i class="fas fa-quote-left"></i></span>
                                                <input type="text" id="content-${testimonial.getTestimonialID()}" class="form-control" value="${testimonial.getContent()}" readonly>
                                            </div>

                                            <div class="input-group mb-3">
                                                <span class="input-group-text"><i class="fas fa-info-circle"></i></span>
                                                <input type="text" id="status-${testimonial.getTestimonialID()}" class="form-control" value="${testimonial.getStatus()}" readonly>
                                            </div>        

                                            <c:if test="${testimonial.getStatus() == 'Pending'}">
                                                <div class="action-buttons">
                                                    <button class="btn btn-primary save-btn-${testimonial.getTestimonialID()}" onclick="saveChanges2(${testimonial.getTestimonialID()})" style="display: none;">Save</button>
                                                    <button class="btn btn-warning" onclick="editTestimonial(${testimonial.getTestimonialID()})"><i class="fas fa-edit"></i> Edit</button>
                                                    <button class="btn btn-danger" onclick="deleteTestimonial(${testimonial.getTestimonialID()})"><i class="fas fa-trash"></i> Delete</button>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 text-center pt-4 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="position-relative border border-primary pt-5 pb-4 px-4">
                            <div class="d-inline-flex align-items-center justify-content-center bg-primary rounded-circle position-absolute top-0 start-50 translate-middle shadow" style="width: 100px; height: 100px;">
                                <i class="fa fa-book fa-3x text-white"></i>
                            </div>
                            <h3 class="mt-4">Your Booking</h3>
                            <hr class="w-25 mx-auto bg-primary mb-1">
                            <hr class="w-50 mx-auto bg-primary mt-0">
                            <div class="container mt-5">
                                <c:forEach var="booking" items="${bok}">
                                    <div id="booking-${booking.bookingID}" class="card booking-card shadow-sm">
                                        <div class="card-body">
                                            <c:forEach var="pac" items="${pac}">
                                                <c:if test="${pac.package_id == booking.packageID}">
                                                    <h5 class="card-title">
                                                        ${pac.description}
                                                    </h5>
                                                </c:if>
                                            </c:forEach>
                                            <p class="card-text"><strong>Booking Date:</strong> ${booking.bookingDate}</p>
                                            <p class="card-text"><strong>Status:</strong> ${booking.bookingStatus}</p>
                                            <c:if test="${booking.bookingStatus == 'Pending'}">
                                                <div class="action-buttons">        
                                                    <button class="btn btn-danger" onclick="deleteBooking(${booking.bookingID})"><i class="fas fa-trash"></i> Delete</button>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center pb-4 wow fadeInUp" data-wow-delay="0.1s">
            <a href="changePass.jsp"><h5><button class="mt-4"><i>CHANGE PASS</i></button></h5></a>
        </div>        
        <!-- Process Start -->

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
        <script>
                                                        function editField(fieldId) {
                                                            var inputField = document.getElementById(fieldId);
                                                            inputField.removeAttribute('readonly');
                                                            inputField.focus();
                                                            document.querySelector('.save-btn').style.display = 'block';
                                                        }

                                                        function saveChanges() {
                                                            var fields = ['fullName', 'email', 'username', 'phoneNumber'];
                                                            var data = {};

                                                            fields.forEach(function (fieldId) {
                                                                var inputField = document.getElementById(fieldId);
                                                                data[fieldId] = inputField.value;
                                                                inputField.setAttribute('readonly', 'readonly');
                                                            });

                                                            fetch('profile', {
                                                                method: 'POST',
                                                                headers: {
                                                                    'Content-Type': 'application/json'
                                                                },
                                                                body: JSON.stringify(data)
                                                            })
                                                                    .then(response => response.json())
                                                                    .then(data => {
                                                                        console.log('Success:', data);
                                                                        document.querySelector('.save-btn').style.display = 'none';
                                                                        alert('Changes saved!');
                                                                    })
                                                                    .catch((error) => {
                                                                        console.error('Error:', error);
                                                                        alert('An error occurred while saving changes.');
                                                                    });
                                                        }

                                                        function deleteBooking(bookingId) {
                                                            // Confirm deletion
                                                            if (confirm('Are you sure you want to delete this Booking?')) {
                                                                // Call servlet to delete testimonial
                                                                fetch('delete_booking', {
                                                                    method: 'POST',
                                                                    headers: {
                                                                        'Content-Type': 'application/json'
                                                                    },
                                                                    body: JSON.stringify({
                                                                        action: 'delete',
                                                                        id: bookingId
                                                                    })
                                                                })
                                                                        .then(response => {
                                                                            if (response.ok) {
                                                                                var divElement = document.getElementById("booking-" + bookingId);
                                                                                divElement.remove();
                                                                                alert('Booking deleted successfully!');
                                                                            } else {
                                                                                throw new Error('Failed to delete bookinh');
                                                                            }
                                                                        })
                                                            }
                                                        }

                                                        function editTestimonial(testimonialId) {
                                                            var contentInput = document.getElementById('content-' + testimonialId);
                                                            var saveBtn = document.querySelector('.save-btn-' + testimonialId);

                                                            contentInput.removeAttribute('readonly');
                                                            contentInput.focus();
                                                            saveBtn.style.display = 'block';
                                                        }

                                                        function saveChanges2(testimonialId) {
                                                            var contentInput = document.getElementById('content-' + testimonialId);
                                                            var statusInput = document.getElementById('status-' + testimonialId);
                                                            var saveBtn = document.querySelector('.save-btn-' + testimonialId);

                                                            // Lấy giá trị mới từ input
                                                            var newContent = contentInput.value;

                                                            // Gửi dữ liệu mới lên server thông qua fetch API
                                                            fetch('edit_testimonial', {
                                                                method: 'POST',
                                                                headers: {
                                                                    'Content-Type': 'application/json'
                                                                },
                                                                body: JSON.stringify({
                                                                    content: newContent,
                                                                    status: statusInput.value,
                                                                    testi: testimonialId
                                                                })
                                                            })
                                                                    .then(response => response.json())
                                                                    .then(data => {
                                                                        console.log('Success:', data);
                                                                        // Cập nhật giao diện sau khi lưu thành công
                                                                        contentInput.setAttribute('readonly', 'readonly');
                                                                        statusInput.setAttribute('readonly', 'readonly');
                                                                        saveBtn.style.display = 'none'; // Ẩn nút Save

                                                                        alert('Changes saved!');
                                                                    })
                                                                    .catch((error) => {
                                                                        console.error('Error:', error);
                                                                        alert('An error occurred while saving changes.');
                                                                    });
                                                        }

                                                        function deleteTestimonial(testimonialId) {
                                                            // Confirm deletion
                                                            if (confirm('Are you sure you want to delete this testimonial?')) {
                                                                // Call servlet to delete testimonial
                                                                fetch('delete_testimonial', {
                                                                    method: 'POST',
                                                                    headers: {
                                                                        'Content-Type': 'application/json'
                                                                    },
                                                                    body: JSON.stringify({
                                                                        action: 'delete',
                                                                        id: testimonialId
                                                                    })
                                                                })
                                                                        .then(response => {
                                                                            if (response.ok) {
                                                                                // Remove the deleted testimonial from UI
                                                                                var divElement = document.getElementById("testimonial-" + testimonialId);
                                                                                divElement.remove();
                                                                                alert('Testimonial deleted successfully!');
                                                                            } else {
                                                                                throw new Error('Failed to delete testimonial');
                                                                            }
                                                                        });
                                                            }
                                                        }
                                                        // Bắt sự kiện click vào icon để mở hộp thoại chọn file
                                                        document.getElementById('editIcon').addEventListener('click', function () {
                                                            document.getElementById('uploadImage').click();
                                                        });

                                                        // Bắt sự kiện change khi người dùng chọn file
                                                        document.getElementById('uploadImage').addEventListener('change', function () {
                                                            // Tự động submit form
                                                            document.getElementById('uploadForm').submit();
                                                        });
        </script>

    </body>

</html>
