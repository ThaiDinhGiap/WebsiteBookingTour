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
                <li class="active">
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
                        <h1>Destination</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li><i class='bx bx-chevron-right'></i></li>
                            <li>
                                <a class="active" href="#">Destination</a>
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
                            <h3>List Destinations</h3>
                            <div>
                                <!-- Nút tìm kiếm -->
                                <i class='bx bx-search' data-toggle="modal" data-target="#searchModal" style="font-size: 1.5rem; cursor: pointer;"></i>
                                <a href="sortDestinationController" class="filter-link">
                                    <i class='bx bx-filter' style="font-size: 1.5rem; cursor: pointer;"></i>
                                </a>
                            </div>
                        </div>

                        <!-- Modal Tìm kiếm -->
                        <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="searchModalLabel">Search Destination</h5>
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
                                    <th>Destination ID</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Location</th>
                                    <th>Actions</th> <!-- Actions column -->
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="des" items="${desList}">
                                    <tr>
                                        <td>${des.getDestination_id()}</td>
                                        <td>${des.getName()}</td>
                                        <td>${des.getDescription()}</td>
                                        <td>${des.getLocation()}</td>
                                        <td>
                                            <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editModal" 
                                                    data-id="${des.getDestination_id()}" data-name="${des.getName()}" 
                                                    data-description="${des.getDescription()}" data-location="${des.getLocation()}">Edit</button>
                                            <form action="processDestination" method="get" style="display:inline;">
                                                <input type="hidden" name="action" value="remove">
                                                <input type="hidden" name="destination_id" value="${des.getDestination_id()}">
                                                <button class="btn btn-danger btn-sm" type="submit" onclick="return confirm('Are you sure you want to remove this destination?');">Remove</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <!-- Nút Insert -->
                        <button class="btn btn-primary" data-toggle="modal" data-target="#insertModal">Insert</button>
                    </div>
                </div>

                <!-- Edit Modal -->
                <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editModalLabel">Edit Destination</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="processDestination" method="post">
                                    <input type="hidden" name="action" value="edit">
                                    <div class="form-group">
                                        <label for="destination_id">Destination ID</label>
                                        <input type="text" class="form-control" id="destination_id" name="destination_id" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Name</label>
                                        <input type="text" class="form-control" id="name" name="name">
                                    </div>
                                    <div class="form-group">
                                        <label for="description">Description</label>
                                        <textarea class="form-control" id="description" name="description"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="location">Location</label>
                                        <input type="text" class="form-control" id="location" name="location">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                </form>
                            </div>
                        </div>
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
                                <form action="controlDestinationController" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <input type="file" id="uploadImage" name="img" accept=".jpg, .jpeg, .png" >
                                    </div>
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
                                                    function editDestination(destinationId) {
                                                        // Xử lý khi nhấn nút Edit
                                                        window.location.href = `editDestinationController?id=${destinationId}`;
                                                    }

                                                    function removeDestination(destinationId) {
                                                        // Xử lý khi nhấn nút Remove
                                                        if (confirm('Are you sure you want to remove this destination?')) {
                                                            window.location.href = `removeDestinationController?id=${destinationId}`;
                                                        }
                                                    }
                                                    $(document).ready(function () {
                                                        $('#editModal').on('show.bs.modal', function (event) {
                                                            var button = $(event.relatedTarget); // Button that triggered the modal
                                                            var id = button.data('id');
                                                            var name = button.data('name');
                                                            var description = button.data('description');
                                                            var location = button.data('location');

                                                            var modal = $(this);
                                                            modal.find('#destination_id').val(id);
                                                            modal.find('#name').val(name);
                                                            modal.find('#description').val(description);
                                                            modal.find('#location').val(location);
                                                        });
                                                    });
        </script>
    </body>

</html>