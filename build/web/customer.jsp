<%-- 
    Document   : customer
    Created on : Jul 8, 2024, 5:30:40 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- My CSS -->
        <link rel="stylesheet" href="css/styleAdmin.css">

        <title>Traveland Admin</title>
        <style>
            .modal-body .text-center img {
                margin: 0 auto;
            }

            .modal-body {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .modal-body .row {
                width: 100%;
            }

        </style>
    </head>

    <body>


        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="homeAdmin" class="brand">
                <i class='bx bxs-map'></i>
                <span class="text">AdminTraveland</span>
            </a>
            <ul class="side-menu top">
                <li>
                    <a href="homeAdmin">
                        <i class='bx bxs-dashboard'></i>
                        <span class="text">Dashboard</span>
                    </a>
                </li>
                <li class="active">
                    <a href="customerController">
                        <i class='bx bxs-user'></i>
                        <span class="text">Customer</span>
                    </a>
                </li>
                <li>
                    <a href="bookingStaffController">
                        <i class='bx bxs-calendar'></i>
                        <span class="text">Booking</span>
                    </a>
                </li>
                <li>
                    <a href="destinationStaffController">
                        <i class='bx bxs-map-pin'></i>
                        <span class="text">Destination</span>
                    </a>
                </li>
                <li>
                    <a href="packageStaffController">
                        <i class='bx bxs-briefcase-alt-2'></i>
                        <span class="text">Package</span>
                    </a>
                </li>
                <li>
                    <a href="testimonialStaffController">
                        <i class='bx bxs-comment-detail'></i>
                        <span class="text">Testimonial</span>
                    </a>
                </li>
            </ul>
            <ul class="side-menu">
                <li>
                    <a href="#">
                        <i class='bx bxs-cog'></i>
                        <span class="text">Settings</span>
                    </a>
                </li>
                <li>
                    <a href="log_out" class="logout">
                        <i class='bx bxs-log-out-circle'></i>
                        <span class="text">Logout</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- SIDEBAR -->



        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <form action="#">
                    <div class="form-input">                      
                    </div>
                </form>
                <a href="#" class="profile">
                    <img src="${sessionScope.us.getAvatar_url()}">
                </a>
            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Customer</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li><i class='bx bx-chevron-right'></i></li>
                            <li>
                                <a class="active" href="#">Customer</a>
                            </li>
                        </ul>
                    </div>
                    <a href="#" class="btn-download">
                        <i class='bx bxs-cloud-download'></i>
                        <span class="text">Download PDF</span>
                    </a>
                </div>

                <div class="container mt-5">
                    <div class="table-responsive">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h3>List Customers</h3>
                            <div>

                                <!-- Modal Tìm kiếm -->
                                <div class="modal fade" id="searchModal" tabindex="-1" role="dialog"
                                     aria-labelledby="searchModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="searchModalLabel">Search Customers</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="customerController" method="post">
                                                    <div class="form-group">
                                                        <input type="text" name="nameCus" class="form-control" id="searchInput"
                                                               placeholder="Enter search keywords...">
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Search</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Modal Display Information-->
                                <div class="modal fade" id="customerModal" tabindex="-1" role="dialog" aria-labelledby="customerModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="customerModalLabel">Customer Details</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-12 text-center">
                                                        <img id="customerImage" src="path/to/default/image.jpg" alt="Customer Image" class="img-fluid mb-3">
                                                    </div>
                                                    <div class="col-6">
                                                        <p><strong>Full Name:</strong> <span id="customerFullName"></span></p>
                                                        <p><strong>Username:</strong> <span id="customerUsername"></span></p>
                                                        <p><strong>Email:</strong> <span id="customerEmail"></span></p>
                                                        <p><strong>Phone Number:</strong> <span id="customerPhoneNumber"></span></p>
                                                        <p><strong>User ID:</strong> <span id="customerUserID"></span></p>
                                                    </div>
                                                    <div class="col-6">
                                                        <p><i class='bx bx-bookmark'></i> <strong>Bookings Approved:</strong> <span id="bookingsApproved"></span></p>
                                                        <p><i class='bx bx-bookmark-minus'></i> <strong>Bookings Rejected:</strong> <span id="bookingsRejected"></span></p>
                                                        <p><i class='bx bx-comment'></i> <strong>Testimonials Approved:</strong> <span id="testimonialsApproved"></span></p>
                                                        <p><i class='bx bx-comment-minus'></i> <strong>Testimonials Rejected:</strong> <span id="testimonialsRejected"></span></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <i class='bx bx-search' style="font-size: 1.5rem; cursor: pointer;"></i>
                                <a href="sortCustomer" class="filter-link">
                                    <i class='bx bx-filter' style="font-size: 1.5rem; cursor: pointer;"></i>
                                </a>

                            </div>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead class="thead-light">
                                <tr>
                                    <th>Customer ID</th>
                                    <th>Full Name</th>
                                    <th>Email</th>
                                    <th>Username</th>
                                    <th>Phone Number</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="index" begin="0" end="${lengthList}">
                                    <tr
                                        data-toggle="modal" data-target="#customerModal"
                                        data-userid="${cusList.get(index).getUserID()}"
                                        data-fullname="${cusList.get(index).getFullName()}"
                                        data-email="${cusList.get(index).getEmail()}"
                                        data-username="${cusList.get(index).getUsername()}"
                                        data-phonenumber="${cusList.get(index).getPhoneNumber()}"
                                        data-bookings="${numBookApp.get(index)}" 
                                        data-testimonials="${numTesApp.get(index)}" 
                                        data-bookingsrejected="${numBookCan.get(index)}" 
                                        data-testimonialsrejected="${numTesApp.get(index)}"
                                        data-image="${cusList.get(index).getAvatar_url()}"> 
                                        <td>${cusList.get(index).getUserID()}</td>
                                        <td>${cusList.get(index).getFullName()}</td>
                                        <td>${cusList.get(index).getEmail()}</td>
                                        <td>${cusList.get(index).getUsername()}</td>
                                        <td>${cusList.get(index).getPhoneNumber()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>



            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


        <script src="js/script.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script>
            $(document).ready(function () {
                $('.bx-search').click(function () {
                    $('#searchModal').modal('show');
                });
            });

            $(document).ready(function () {
                $('#customerModal').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget); // Button that triggered the modal
                    var userID = button.data('userid');
                    var fullName = button.data('fullname');
                    var email = button.data('email');
                    var username = button.data('username');
                    var phoneNumber = button.data('phonenumber');
                    var bookings = button.data('bookings');
                    var testimonials = button.data('testimonials');
                    var bookingsRejected = button.data('bookingsrejected');
                    var testimonialsRejected = button.data('testimonialsrejected');
                    var image = button.data('image');


                    var modal = $(this);
                    modal.find('#customerUserID').text(userID);
                    modal.find('#customerFullName').text(fullName);
                    modal.find('#customerEmail').text(email);
                    modal.find('#customerUsername').text(username);
                    modal.find('#customerPhoneNumber').text(phoneNumber);
                    modal.find('#bookingsApproved').text(bookings);
                    modal.find('#testimonialsApproved').text(testimonials);
                    modal.find('#bookingsRejected').text(bookingsRejected);
                    modal.find('#testimonialsRejected').text(testimonialsRejected);
                    modal.find('#customerImage').attr('src', image); // Set the image src
                });
            });

        </script>
    </body>

</html>
