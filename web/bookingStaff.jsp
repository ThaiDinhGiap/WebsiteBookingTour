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
                <li class="active">
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
                        <h1>Booking</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li><i class='bx bx-chevron-right'></i></li>
                            <li>
                                <a class="active" href="#">Booking</a>
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
                            <h3>List Bookings</h3>
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
                                        <h5 class="modal-title" id="filterModalLabel">Filter Bookings</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="filterForm" action="sortBookingController" method="get">
                                            <div class="form-group">
                                                <label for="statusFilter">Booking Status</label>
                                                <select class="form-control" id="statusFilter" name="statusFilter">
                                                    <option value="">All</option>
                                                    <option value="Approved">Approved</option>
                                                    <option value="Pending">Pending</option>
                                                    <option value="Cancelled">Cancelled</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="priceFilter">Price</label>
                                                <select class="form-control" id="priceFilter" name="priceFilter">
                                                    <option value="">No Filter</option>
                                                    <option value="lowToHigh">Low to High</option>
                                                    <option value="highToLow">High to Low</option>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Apply Filters</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Bảng dữ liệu -->
                        <table class="table table-hover table-bordered">
                            <thead class="thead-light">
                                <tr>
                                    <th>Booking ID</th>
                                    <th>Email</th>
                                    <th>Description</th>
                                    <th>Booking Date</th>
                                    <th>Created Date</th>
                                    <th>Special Request</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="index" begin="0" end="${lengthList}">
                                    <tr 
                                        data-bookingid="${bookList.get(index).getBookingID()}" 
                                        data-customer="${cusList.get(index).getEmail()}"
                                        >
                                        <td>${bookList.get(index).getBookingID()}</td>
                                        <td>${cusList.get(index).getEmail()}</td>
                                        <td>${pacList.get(index).getDescription()}</td>
                                        <td>${bookList.get(index).getBookingDate()}</td>
                                        <td>${bookList.get(index).getCreatedDate()}</td>
                                        <td>${bookList.get(index).getSpecialRequest()}</td>
                                        <td>${pacList.get(index).getPrice()}</td>

                                        <!-- Hiển thị trạng thái Booking -->
                                        <td>
                                            <c:choose>
                                                <c:when test="${bookList.get(index).getBookingStatus() eq 'Approved'}">
                                                    <span class="badge badge-success">${bookList.get(index).getBookingStatus()}</span>
                                                </c:when>
                                                <c:when test="${bookList.get(index).getBookingStatus() eq 'Pending'}">
                                                    <span class="badge badge-warning">${bookList.get(index).getBookingStatus()}</span>
                                                </c:when>
                                                <c:when test="${bookList.get(index).getBookingStatus() eq 'Cancelled'}">
                                                    <span class="badge badge-danger">${bookList.get(index).getBookingStatus()}</span>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <!-- Modal -->
                                <div class="modal fade" id="bookingModal${bookList.get(index).getBookingID()}" tabindex="-1" role="dialog" aria-labelledby="bookingModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="bookingModalLabel">Processing Booking</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p id="bookingDetails"></p>
                                                <form action="processBooking" method="post">
                                                    <input type="hidden" name="bookingID" value="${bookList.get(index).getBookingID()}"/>
                                                    <div class="row">
                                                        <div class="col">
                                                            <button class="btn btn-success btn-block" id="approveButton" name="buttonBook" value="Approve">Approve</button>
                                                        </div>
                                                        <div class="col">
                                                            <button class="btn btn-danger btn-block" id="cancelButton" name="buttonBook" value="Reject">Reject</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

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
                // Hiển thị modal tìm kiếm
                $('.bx-search').click(function () {
                    $('#searchModal').modal('show');
                });

                // Hiển thị modal booking với thông tin và các hành động
                $('.modal').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget); // Button that triggered the modal
                    var bookingID = button.data('bookingid');
                    var customer = button.data('customer');

                    var modal = $(this);

                    $('#approveButton').off('click').on('click', function () {
                        // Call your function to approve the booking
                        approveBooking(bookingID);
                        modal.modal('hide');
                    });

                    $('#cancelButton').off('click').on('click', function () {
                        // Call your function to cancel the booking
                        cancelBooking(bookingID);
                        modal.modal('hide');
                    });
                });

                // Thêm sự kiện nhấp vào các hàng booking có trạng thái "Pending"
                $('tbody tr').each(function () {
                    var status = $(this).find('td:nth-child(8) .badge').text();
                    if (status === 'Pending') {
                        $(this).css('cursor', 'pointer');
                        $(this).click(function () {
                            var bookingID = $(this).data('bookingid');
                            var customer = $(this).data('customer');

                            // Tìm modal cụ thể dựa trên bookingID và hiển thị nó
                            $('#bookingModal' + bookingID).data('bookingid', bookingID).data('customer', customer).modal('show');
                        });
                    }
                });
            });

        </script>
    </body>

</html>