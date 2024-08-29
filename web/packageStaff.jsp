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
                <li class="active">
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
                        <h1>Package</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li><i class='bx bx-chevron-right'></i></li>
                            <li>
                                <a class="active" href="#">Package</a>
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
                            <h3>List Packages</h3>
                            <div>
                                <!-- Nút tìm kiếm -->
                                <i class='bx bx-search' data-toggle="modal" data-target="#searchModal" style="font-size: 1.5rem; cursor: pointer;"></i>
                                <a href="sortPackageController" class="filter-link">
                                    <i class='bx bx-filter' style="font-size: 1.5rem; cursor: pointer;"></i>
                                </a>
                            </div>
                        </div>

                        <!-- Modal Tìm kiếm -->
                        <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="searchModalLabel">Search Package</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="packageStaffController" method="post">
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
                                    <th>Package ID</th>
                                    <th>Description</th>                                    
                                    <th>Date</th>
                                    <th>Included Services</th>
                                    <th>Number of People</th>
                                    <th>Price</th>
                                    <th>Actions</th> <!-- Thêm cột Actions -->
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="pac" items="${pacList}">
                                    <tr>
                                        <td>${pac.getPackage_id()}</td>
                                        <td>${pac.getDescription()}</td>        
                                        <td>    
                                            <span>${pac.getStart_date()}</span>
                                            <span>/</span>
                                            <span>${pac.getEnd_date()}</span>
                                        </td>
                                        <td>${pac.getIncluded_services()}</td>
                                        <td>${pac.getNumber_of_people()}</td>
                                        <td>${pac.getPrice()}</td>
                                        <td>
                                            <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editModal" 
                                                    data-id="${pac.getPackage_id()}" data-description="${pac.getDescription()}" 
                                                    data-numberofpeople="${pac.getNumber_of_people()}" data-price="${pac.getPrice()}">Edit</button>
                                            <form action="processPackage" method="get" style="display:inline;">
                                                <input type="hidden" name="action" value="remove">
                                                <input type="hidden" name="package_id" value="${pac.getPackage_id()}">
                                                <button class="btn btn-danger btn-sm" type="submit" onclick="return confirm('Are you sure you want to remove this package?');">Remove</button>
                                            </form>
                                        </td>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <!-- Nút Insert -->
                        <button class="btn btn-primary" data-toggle="modal" data-target="#insertPackageModal">Insert</button>
                    </div>
                </div>

                <!-- Modal Insert -->
                <div class="modal fade" id="insertPackageModal" tabindex="-1" role="dialog" aria-labelledby="insertPackageModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="insertPackageModalLabel">Insert New Package</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="addPackage" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <input type="file" id="uploadImage" name="image_url" accept=".jpg, .jpeg, .png" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="packageDescription">Description</label>
                                        <textarea class="form-control" id="packageDescription" name="description" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="packagePrice">Price</label>
                                        <input type="number" class="form-control" id="packagePrice" name="price" step="0.01" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="packageDuration">Duration</label>
                                        <input type="text" class="form-control" id="packageDuration" name="duration" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="packageStartDate">Start Date</label>
                                        <input type="date" class="form-control" id="packageStartDate" name="start_date" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="packageEndDate">End Date</label>
                                        <input type="date" class="form-control" id="packageEndDate" name="end_date" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="packageIncludedServices">Included Services</label>
                                        <textarea class="form-control" id="packageIncludedServices" name="included_services" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="packageItinerary">Itinerary</label>
                                        <textarea class="form-control" id="packageItinerary" name="itinerary" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="packageNumberOfPeople">Number of People</label>
                                        <input type="number" class="form-control" id="packageNumberOfPeople" name="number_of_people" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Insert</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editModalLabel">Edit Package</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="processPackage" method="post">
                                    <div class="form-group">
                                        <label for="package_id">Package ID</label>
                                        <input type="text" class="form-control" id="package_id" name="package_id" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="numberOfPeople">Number Of People</label>
                                        <input type="number" class="form-control" id="numberOfPeople" name="numberOfPeople" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="description">Description</label>
                                        <textarea class="form-control" id="description" name="description" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="price">Price</label>
                                        <input type="number" class="form-control" id="price" name="price" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Update</button>
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
                                                    function editPackage(destinationId) {
                                                        // Xử lý khi nhấn nút Edit
                                                        window.location.href = `editDestinationController?id=${destinationId}`;
                                                    }

                                                    function removePackage(destinationId) {
                                                        // Xử lý khi nhấn nút Remove
                                                        if (confirm('Are you sure you want to remove this destination?')) {
                                                            window.location.href = `removeDestinationController?id=${destinationId}`;
                                                        }
                                                    }

                                                    $(document).ready(function () {
                                                        $('#editModal').on('show.bs.modal', function (event) {
                                                            var button = $(event.relatedTarget); // Button that triggered the modal
                                                            var id = button.data('id');
                                                            var numberOfPeople = button.data('numberofpeople'); // Corrected data attribute
                                                            var description = button.data('description');
                                                            var price = button.data('price');

                                                            var modal = $(this);
                                                            modal.find('#package_id').val(id);
                                                            modal.find('#numberOfPeople').val(numberOfPeople);
                                                            modal.find('#description').val(description);
                                                            modal.find('#price').val(price);
                                                        });
                                                    });


        </script>
    </body>

</html>