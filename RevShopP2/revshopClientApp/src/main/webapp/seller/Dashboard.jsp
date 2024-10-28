<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.revshop.revshopClientApp.entity.Retailer"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Seller Dashboard - REVSHOP</title>
<link rel="stylesheet" href="Dashboard.css">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">


<!-- FontAwesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="#"> <img src="IMAGES/LOGO.png" alt="Logo" class="logo"> </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Home</a></li>
                    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="myProductsDropdown" role="button" data-bs-toggle="dropdown">My Products</a>
                        <ul class="dropdown-menu" aria-labelledby="myProductsDropdown">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/products">All Products</a></li>
                            <li><a class="dropdown-item" href="AddNewProduct.jsp">Add New Product</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/orders">Orders</a></li>
                    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-bs-toggle="dropdown">Profile</a>
                        <ul class="dropdown-menu" aria-labelledby="profileDropdown">
                            <li><a class="dropdown-item" href="Profile.jsp">View Profile</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Welcome Section -->
    <section class="welcome-section text-center bg-light py-5">
        <div class="container">
            <h1 class="display-5">Welcome back, <strong>${sessionScope.email}</strong>!</h1>
        </div>
    </section>

    <!-- Analytics Section -->
    <section id="analytics" class="py-5">
        <div class="container">
            <h2 class="text-center mb-4">Products Analytics</h2>
            <div class="row text-center g-4">

                <!-- Total Orders Card (Clickable) -->
                <div class="col-md-4">
                    <a href="${pageContext.request.contextPath}/orders" class="text-decoration-none">
                        <div class="card h-100 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title">Total Orders</h5>
                                <p class="card-text display-6">${salesCount}</p>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Total Product Reviews Card (Clickable) -->
                <div class="col-md-4">
                    <a href="${pageContext.request.contextPath}/reviews" class="text-decoration-none">
                        <div class="card h-100 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title">Total Product Reviews</h5>
                                <p class="card-text display-6">${productReviewsCount}</p>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Total Products Card (Clickable) -->
                <div class="col-md-4">
                    <a href="${pageContext.request.contextPath}/products" class="text-decoration-none">
                        <div class="card h-100 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title">Total Products</h5>
                                <p class="card-text display-6">${productsCount}</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
    
        <!-- Pie Chart Section -->
    <section class="py-5">
        <div class="pie-chart-container">
            <canvas id="pieChart"></canvas>
        </div>
    </section>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Chart.js -->
<script>
//Sample data
const salesCount = ${salesCount};
const productReviewsCount = ${productReviewsCount};
const productsCount = ${productsCount};

// Create the pie chart
const ctxPie = document.getElementById('pieChart').getContext('2d');

// Create radial gradient for the pie chart
const gradient1 = ctxPie.createLinearGradient(0, 0, 0, 400);
gradient1.addColorStop(0, 'rgba(75, 192, 192, 1)');
gradient1.addColorStop(1, 'rgba(75, 192, 192, 0.3)');

const gradient2 = ctxPie.createLinearGradient(0, 0, 0, 400);
gradient2.addColorStop(0, 'rgba(255, 99, 132, 1)');
gradient2.addColorStop(1, 'rgba(255, 99, 132, 0.3)');

const gradient3 = ctxPie.createLinearGradient(0, 0, 0, 400);
gradient3.addColorStop(0, 'rgba(54, 162, 235, 1)');
gradient3.addColorStop(1, 'rgba(54, 162, 235, 0.3)');

// Initialize the pie chart
const pieChart = new Chart(ctxPie, {
    type: 'pie',
    data: {
        labels: ['Orders Count', 'Product Reviews Count', 'Products Count'],
        datasets: [{
            label: 'Counts',
            data: [salesCount, productReviewsCount, productsCount],
            backgroundColor: [gradient1, gradient2, gradient3],
            borderColor: ['rgba(75, 192, 192, 1)', 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)'],
            borderWidth: 1,
            hoverOffset: 15, // Increased hover offset for more visual pop
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            tooltip: {
                enabled: true,
                backgroundColor: 'rgba(0, 0, 0, 0.7)',
                titleColor: '#fff',
                bodyColor: '#fff'
            },
            legend: {
                display: true,
                position: 'bottom',
                labels: {
                    font: {
                        size: 16, // Make the legend font larger and clearer
                        weight: 'bold'
                    },
                    color: '#333',
                    padding: 20, // Adds spacing between legend items
                }
            }
        },
        animation: {
            animateRotate: true,
            animateScale: true,
            duration: 1500, // Smooth animation over 1.5 seconds
            easing: 'easeInOutQuart', // Elegant easing for smoothness
        },
        layout: {
            padding: {
                top: 20,
                bottom: 20
            }
        },
        elements: {
            arc: {
                borderWidth: 1, // Thicker arcs for a more distinct look
                hoverBorderColor: 'rgba(0, 0, 0, 0.8)', // Highlight on hover
                hoverBorderWidth: 3, // Thicker border on hover for emphasis
            }
        },
        onClick: (evt, activeElements) => {
            if (activeElements.length) {
                const chartIndex = activeElements[0].index;
                const datasetIndex = activeElements[0].datasetIndex;
                const dataset = pieChart.data.datasets[datasetIndex];
                const clickedValue = dataset.data[chartIndex];

                console.log(`You clicked on: ${clickedValue}`);
            }
        }
    }
});
</script>

</body>
</html>
