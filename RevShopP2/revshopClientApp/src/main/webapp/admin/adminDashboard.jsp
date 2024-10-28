<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.revshop.revshopClientApp.dto.Buyer" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REVSHOP - ADMIN DASHBOARD</title>
    <link rel="stylesheet" href="adminDashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="responsive.css">
     <link rel="icon" href="IMAGES/LOGO.png" type="image/png" sizes="64x64">
    <!-- Load jQuery before your custom scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

    <!-- Header Section -->
    <header>
        <div class="logosec">
            <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182541/Untitled-design-(30).png" 
                 class="icn menuicn" id="menuicn" alt="menu-icon">
        </div>
        <div class="logo">REVSHOP</div>
        <div class="message">
            <div class="dp">
                <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210180014/profile-removebg-preview.png" 
                     class="dpicn" alt="dp">
            </div>
            <div class="admin-email">
                <span><%= session.getAttribute("adminEmail") != null ? session.getAttribute("adminEmail") : "Not logged in" %></span>
            </div>
        </div>
    </header>

    <div class="main-container">
        <!-- Navigation Section -->
        <div class="navcontainer">
            <nav class="nav">
                <div class="nav-upper-options">
                    <div class="nav-option option1" onclick="showSection('dashboard')">
                        <i class="fab fa-dashcube" style="font-size:30px; color: #fff;"></i>
                        <h3>Dashboard</h3>
                    </div>
                    <div class="nav-option logout" onclick="logout()">
                      <i class="fa fa-sign-out" style="font-size:24px"></i>
                        <h3>Logout</h3>
                    </div>
                </div>
            </nav>
        </div>

        <!-- Main Content Section -->
        <div class="main">
            <!-- Dashboard Section -->
            <div id="dashboard" class="content-section">
                <div class="box-container">
                    <form action="${pageContext.request.contextPath}/viewBuyers" method="get">
                        <div class="box box1">
                            <div class="text">
                               <h2 id="buyers-count" class="topic-heading"></h2>
                                <h2 class="topic">Buyers</h2>
                            </div>
                            <button type="submit" class="btn btn-primary" style="background:none; border:none;">
                                <i class="fa-solid fa-users" style="font-size:38px; color: #fff;"></i>
                            </button>
                        </div>
                    </form>

                    <form action="${pageContext.request.contextPath}/viewRetailers" method="get">
                        <div class="box box2">
                            <div class="text">
                                <h2 class="topic-heading"></h2>
                                <h2 class="topic">New Retailer Requests</h2>
                            </div>
                             <button type="submit" class="btn btn-primary" style="background:none; border:none;">
                            <i class="fa fa-bell" style="font-size:38px; color: #fff;"></i>
                            </button>
                        </div>
                    </form>

                    <form action="${pageContext.request.contextPath}/viewComplaints" method="get">
                        <div class="box box3">
                            <div class="text">
                                <h2 class="topic-heading"></h2>
                                <h2 class="topic">Complaints</h2>
                            </div>
                             <button type="submit" class="btn btn-primary" style="background:none; border:none;">
                            <i class="fa fa-comments" style="font-size:38px; color: #fff;  aria-hidden="true"></i>
                                 </button>
                        </div>
                    </form>
                    
                    
                     <form action="${pageContext.request.contextPath}/viewOrders" method="get">
                        <div class="box box5">
                            <div class="text">
                                <h2 class="topic-heading"></h2>
                                <h2 class="topic">Orders</h2>
                            </div>
                             <button type="submit" class="btn btn-primary" style="background:none; border:none;">
                           <i class="fa-solid fa-cart-shopping" style="font-size:38px; color: #fff;"></i>
                                 </button>
                        </div>
                    </form>

                    <form action="${pageContext.request.contextPath}/viewApprovedRetailers" method="get">
                        <div class="box box4">
                            <div class="text">
                                <h2 class="topic-heading"></h2>
                                <h2 class="topic">Approved Retailers</h2>
                            </div>
                           <button type="submit" class="btn btn-primary" style="background:none; border:none;">
                            <i class="fa fa-check" style="font-size:38px; color: #fff;"></i>
                            </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Buyers Section -->
            <div id="buyers" class="content-section" style="display: none;">
                <h2>Buyers</h2>
                <button id="viewAllBuyersBtn" class="btn btn-primary">View All Buyers</button>
                <br/>
                <h2>List of Buyers</h2>
                <table border="1" class="table" id="buyersTable">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Password</th> <!-- For security, consider not displaying the password -->
                            <th>Contact</th>
                            <th>City</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Buyers will be dynamically added here -->
                    </tbody>
                </table>
            </div>

            <!-- Additional Sections -->
            <div id="newRetailers" class="content-section" style="display: none;">
                <h2>New Retailer Requests</h2>
                <p>New Retailer Requests content goes here...</p>
            </div>
            <div id="approvedRetailers" class="content-section" style="display: none;">
                <h2>Approved Retailers</h2>
                <p>Approved Retailers content goes here...</p>
            </div>
            <div id="manageBuyers" class="content-section" style="display: none;">
                <h2>Manage Buyers</h2>
                <p>Manage Buyers content goes here...</p>
            </div>
            <div id="manageRetailers" class="content-section" style="display: none;">
                <h2>Manage Retailers</h2>
                <p>Manage Retailers content goes here...</p>
            </div>
        </div>
    </div>


    <!-- Load your custom scripts after jQuery -->
    <script>
    function logout() {
        if (confirm('You have been logged out.')) {
            window.location.href = 'adminLogin.jsp'; 
        }
    }
    </script>
</body>
</html>
