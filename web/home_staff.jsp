<%-- 
    Document   : home_staff
    Created on : Jul 8, 2024, 1:37:59 AM
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
        <!-- My CSS -->
        <link rel="stylesheet" href="css/styleAdmin.css">

        <title>Traveland Admin</title>

        <style>
            .box-item {
                background-color: white;
                padding: 15px;
                border-radius: 8px;
                margin-bottom: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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
                <li class="active">
                    <a href="homeAdmin">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="customerController">
                        <i class='bx bxs-user' ></i>
                        <span class="text">Customer</span>
                    </a>
                </li>
                <li>
                    <a href="bookingStaffController">
                        <i class='bx bxs-calendar' ></i>
                        <span class="text">Booking</span>
                    </a>
                </li>
                <li>
                    <a href="destinationStaffController">
                        <i class='bx bxs-map-pin' ></i>
                        <span class="text">Destination</span>
                    </a>
                </li>
                <li>
                    <a href="packageStaffController">
                        <i class='bx bxs-briefcase-alt-2' ></i>
                        <span class="text">Package</span>
                    </a>
                </li>
                <li>
                    <a href="testimonialStaffController">
                        <i class='bx bxs-comment-detail' ></i>
                        <span class="text">Testimonial</span>
                    </a>
                </li>
            </ul>
            <ul class="side-menu">
                <li>
                    <a href="#">
                        <i class='bx bxs-cog' ></i>
                        <span class="text">Settings</span>
                    </a>
                </li>
                <li>
                    <a href="log_out" class="logout">
                        <i class='bx bxs-log-out-circle' ></i>
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
                        <h1>Dashboard</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="#">Home</a>
                            </li>
                        </ul>
                    </div>
                </div>


                <div class="table-data">
                    <div class="order">
                        <ul class="box-info">
                            <li class="box-item">
                                <i class='bx bxs-calendar-check'></i>
                                <span class="text">
                                    <h3>${numBook}</h3>
                                    <a href="sortBookingController?statusFilter=Pending&priceFilter=null">New Booking</a>
                                </span>
                            </li>
                            <li class="box-item">
                                <i class='bx bxs-comment-detail' ></i>
                                <span class="text">
                                    <h3>${numTes}</h3>
                                    <a href="sortTestimonialStaff?statusFilter=Pending">New Testimonial</a>
                                </span>
                            </li>
                            <li class="box-item">
                                <i class='bx bxs-dollar-circle' ></i>
                                <span class="text">
                                    <h3>${totalMoney}</h3>
                                    <a href="listSales">Total Sales</a>
                                </span>
                            </li>
                        </ul>
                    </div>

                    <div class="todo">
                        <div class="head">
                            <h3>Task daily</h3>
                            <button id="refresh-button" class='bx bx-refresh'></button>
                        </div>
                        <ul class="todo-list">
                            <li data-id="task1" class="completed">
                                <p>Process new Bookings</p>
                                <button class='toggle-status bx bx-check'></button>
                            </li>
                            <li data-id="task2" class="not-completed">
                                <p>Process new Testimonial</p>
                                <button class='toggle-status bx bx-check'></button>
                            </li>
                            <li data-id="task3" class="completed">
                                <p>Add new Destination</p>
                                <button class='toggle-status bx bx-check'></button>
                            </li>
                            <li data-id="task4" class="not-completed">
                                <p>Add new Package</p>
                                <button class='toggle-status bx bx-check'></button>
                            </li>
                        </ul>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


        <script src="js/script.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const toggleButtons = document.querySelectorAll('.toggle-status');
                const refreshButton = document.getElementById('refresh-button');

                // Load tasks state from cookies
                loadTasksState();

                toggleButtons.forEach(button => {
                    button.addEventListener('click', function () {
                        const listItem = this.parentElement;
                        const taskId = listItem.getAttribute('data-id');

                        if (listItem.classList.contains('completed')) {
                            listItem.classList.remove('completed');
                            listItem.classList.add('not-completed');
                            setCookie(taskId, 'not-completed', 1);
                        } else {
                            listItem.classList.remove('not-completed');
                            listItem.classList.add('completed');
                            setCookie(taskId, 'completed', 1);
                        }
                    });
                });

                refreshButton.addEventListener('click', function () {
                    const listItems = document.querySelectorAll('.todo-list li');
                    listItems.forEach(item => {
                        const taskId = item.getAttribute('data-id');
                        item.classList.remove('completed');
                        item.classList.add('not-completed');
                        setCookie(taskId, 'not-completed', 1);
                    });
                });

                function setCookie(name, value, days) {
                    const d = new Date();
                    d.setTime(d.getTime() + (days * 24 * 60 * 60 * 1000));
                    const expires = "expires=" + d.toUTCString();
                    document.cookie = name + "=" + value + ";" + expires + ";path=/";
                }

                function getCookie(name) {
                    const nameEQ = name + "=";
                    const ca = document.cookie.split(';');
                    for (let i = 0; i < ca.length; i++) {
                        let c = ca[i];
                        while (c.charAt(0) === ' ')
                            c = c.substring(1, c.length);
                        if (c.indexOf(nameEQ) === 0)
                            return c.substring(nameEQ.length, c.length);
                    }
                    return null;
                }

                function loadTasksState() {
                    const listItems = document.querySelectorAll('.todo-list li');
                    listItems.forEach(item => {
                        const taskId = item.getAttribute('data-id');
                        const taskState = getCookie(taskId);
                        if (taskState) {
                            item.classList.remove('completed', 'not-completed');
                            item.classList.add(taskState);
                        }
                    });
                }
            });

        </script>
    </body>
</html>