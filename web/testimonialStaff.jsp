<%-- 
    Document   : bookingStaff
    Created on : Jul 8, 2024, 9:55:16 PM
    Author     : admin
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </head>

    <body>


        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="#" class="brand">
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
                <li>
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
                <li class="active">
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
                        <h1>Testimonial</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li><i class='bx bx-chevron-right'></i></li>
                            <li>
                                <a class="active" href="#">Testimonial</a>
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
                            <h3>List Testimonials</h3>
                            <div>
                                <!-- Nút tìm kiếm -->
                                <i class='bx bx-filter' data-toggle="modal" data-target="#filterModal" style="font-size: 1.5rem; cursor: pointer;"></i>
                            </div>
                        </div>

                        <!-- Modal Filter -->
                        <div class="modal fade" id="filterModal" tabindex="-1" role="dialog" aria-labelledby="filterModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="filterModalLabel">Filter Testimonial</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="filterForm" action="sortTestimonialStaff" method="get">
                                            <div class="form-group">
                                                <label for="statusFilter">Testimonial Status</label>
                                                <select class="form-control" id="statusFilter" name="statusFilter">
                                                    <option value="">All</option>
                                                    <option value="Approved">Approved</option>
                                                    <option value="Pending">Pending</option>
                                                    <option value="Cancelled">Rejected</option>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Apply Filters</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal Tìm kiếm -->
                        <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="searchModalLabel">Search Testimonial</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="destinationStaffController" method="post">
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

                        <!-- Bảng dữ liệu -->
                        <table class="table table-bordered table-hover">
                            <thead class="thead-light">
                                <tr>
                                    <th>Testimonial ID</th>
                                    <th>Customer</th>
                                    <th>Content</th>
                                    <th>CreateDate</th>
                                    <th>Status</h>
                                    <th>Actions</th> <!-- Thêm cột Actions -->
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="index" begin="0" end="${lengthList}">
                                    <tr>
                                        <td>${tesList.get(index).getTestimonialID()}</td>
                                        <td>${cusList.get(index).getFullName()}</td>
                                        <td>${tesList.get(index).getContent()}</td>
                                        <td>${tesList.get(index).getCreateDate()}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${tesList.get(index).getStatus() eq 'Approved'}">
                                                    <span class="badge badge-success">${tesList.get(index).getStatus()}</span>
                                                </c:when>
                                                <c:when test="${tesList.get(index).getStatus() eq 'Pending'}">
                                                    <span class="badge badge-warning">${tesList.get(index).getStatus()}</span>
                                                </c:when>
                                                <c:when test="${tesList.get(index).getStatus() eq 'Rejected'}">
                                                    <span class="badge badge-danger">${tesList.get(index).getStatus()}</span>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:if test="${tesList.get(index).getStatus() eq 'Pending'}">
                                                <div class="d-flex">
                                                    <!-- Approve Button -->
                                                    <button class="btn btn-warning btn-sm mr-2" onclick="approveTestimonial(${tesList.get(index).getTestimonialID()})">Approve</button>
                                                    <!-- Hidden Approve Form -->
                                                    <form id="approveForm" action="processTestimonial" method="post" style="display:none;">
                                                        <input type="hidden" name="id" id="approveTestimonialID" value="">
                                                    </form>

                                                    <!-- Reject Button -->
                                                    <button class="btn btn-danger btn-sm" onclick="rejectTestimonial(${tesList.get(index).getTestimonialID()})">Reject</button>
                                                    <!-- Hidden Reject Form -->
                                                    <form id="rejectForm" action="processTestimonial" method="get" style="display:none;">
                                                        <input type="hidden" name="id" id="rejectTestimonialID" value="">
                                                    </form>

                                                </div>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Modal Insert -->
                <div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="insertModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="insertModalLabel">Insert New Destination</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="insertDestinationController" method="post">
                                    <div class="form-group">
                                        <label for="destinationName">Name</label>
                                        <input type="text" class="form-control" id="destinationName" name="destinationName" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="destinationDescription">Description</label>
                                        <textarea class="form-control" id="destinationDescription" name="destinationDescription" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="destinationLocation">Location</label>
                                        <input type="text" class="form-control" id="destinationLocation" name="destinationLocation" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Insert</button>
                                </form>
                            </div>
                        </div>
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

                                                        function approveTestimonial(testimonialID) {
                                                            if (confirm('Are you sure you want to approve this Testimonial?')) {
                                                                document.getElementById('approveTestimonialID').value = testimonialID;
                                                                document.getElementById('approveForm').submit();
                                                            }
                                                        }

                                                        function rejectTestimonial(testimonialID) {
                                                            if (confirm('Are you sure you want to reject this Testimonial?')) {
                                                                document.getElementById('rejectTestimonialID').value = testimonialID;
                                                                document.getElementById('rejectForm').submit();
                                                            }
                                                        }

        </script>
    </body>

</html>