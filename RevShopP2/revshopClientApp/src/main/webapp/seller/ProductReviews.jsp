<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Reviews</title>
<style>
@charset "UTF-8";

@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700;800&display=swap')
	;

/* Global Styles */
body, html {
	font-family: 'Poppins', sans-serif;
	font-size: 16px;
	color: #333;
	background-color: #f8f9fa; /* Light background */
	margin: 0;
	padding: 0;
}

/* Navbar */
nav {
	background-color: #f8f9fa; /* Dark background for navbar */
	padding: 15px 50px; /* Increased left/right padding */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

nav div {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 100%; /* Ensure the navbar occupies full width */
}

nav ul {
	list-style: none;
	display: flex;
	gap: 20px;
}

nav ul li {
	position: relative;
}

nav ul li a {
	color: #333; /* White text for navbar links */
	text-decoration: none;
	font-weight: 500;
	padding: 10px 15px;
}

nav ul li a:hover {
	color: #ac914a; /* Hover effect color */
	transition: color 0.3s ease-in-out;
}

nav ul li ul {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	background-color: #FFF;
	list-style: none;
	padding: 0;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Dropdown shadow */
}

nav ul li:hover ul {
	display: block;
}

nav ul li ul li a {
	padding: 10px 15px;
	white-space: nowrap;
}

/* Main Heading */
h1 {
	text-align: center;
	font-size: 2.5rem;
	font-weight: 700;
	margin: 40px 0;
	color: #2C3E50;
}

/* Review Cards */
.reviews-container {
	display: grid;
	grid-template-columns: repeat(4, 1fr); /* 4 cards in a row */
	gap: 20px;
	padding: 20px;
}

.review-card {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	padding: 20px; /* Increased padding for better spacing */
	transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
	position: relative;
}

.review-card:hover {
	transform: translateY(-5px); /* Slight lift effect */
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
	/* Enhanced shadow on hover */
}

.review-card h2 {
	font-size: 1.5rem; /* Increased font size for card title */
	color: #2C3E50;
	margin-bottom: 10px;
}

.review-card p {
	font-size: 1rem; /* Standard font size for card text */
	margin-bottom: 10px;
}

.review-card a {
	color: #ac914a; /* Link color */
	text-decoration: none;
	font-weight: bold;
	position: absolute; /* Position Delete link */
	bottom: 15px; /* Align at the bottom of the card */
	right: 15px; /* Align at the right of the card */
}

.review-card a:hover {
	text-decoration: underline; /* Underline on hover */
	transition: color 0.3s ease-in-out;
}

/* Star Rating */
.stars {
	font-size: 1.2rem;
	color: gold;
}

/* Back to Dashboard Button */
.back-button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #2C3E50;
	color: #FFF;
	text-decoration: none;
	border-radius: 5px;
	font-weight: 500;
	margin: 20px auto;
	text-align: center;
}

.back-button:hover {
	background-color: #ac914a; /* Hover color for button */
	transition: background-color 0.3s ease-in-out;
}

/* Footer */
footer {
	background-color: #333; /* Dark background */
	color: #FFF; /* White text */
	padding: 20px;
	text-align: center;
	font-size: 14px;
}

footer p {
	margin: 0;
}

/* Responsive Adjustments */
@media screen and (max-width: 1200px) {
	.reviews-container {
		grid-template-columns: repeat(3, 1fr);
		/* 3 cards for medium screens */
	}
}

@media screen and (max-width: 768px) {
	.reviews-container {
		grid-template-columns: repeat(2, 1fr); /* 2 cards for small screens */
	}
	h1 {
		font-size: 2rem;
	}
}

@media screen and (max-width: 480px) {
	.reviews-container {
		grid-template-columns: 1fr;
		/* 1 card per row for very small screens */
	}
	nav {
		padding: 10px; /* Reduce padding on mobile */
	}
}
</style>
</head>
<body>
	<!-- Navbar -->
	<nav>
		<div>
			<a href="#"><img src="IMAGES/LOGO.png" alt="Logo" height="50"></a>
			<ul>
				<li><a href="${pageContext.request.contextPath}/seller/dashboard">Home</a></li>
				<!-- My Products Dropdown -->
				<li><a href="#" id="productsDropdown">My Products</a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/products">All
								Products</a></li>
						<li><a href="/revshopClientApp/seller/AddNewProduct.jsp">Add
								New Product</a></li>
					</ul></li>

				<!-- Other Links -->
				<li><a href="${pageContext.request.contextPath}/orders">Orders</a></li>
				<li><a href="#" id="profileDropdown">Profile</a>
					<ul>
						<li><a href="/revshopClientApp/seller/Profile.jsp">View
								Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>

	<!-- Main Heading -->
	<h1>Product Reviews</h1>

	<!-- Review Cards -->
	<div class="reviews-container">
		<c:if test="${not empty reviews}">
			<c:forEach var="review" items="${reviews}">
				<div class="review-card">
					<img src="${pageContext.request.contextPath}/IMAGES/${review.product.image}" class="img-fluid" alt="Product Image">
					<h2>Review ID: ${review.reviewId}</h2>
					<p>
						<strong>Product Name:</strong> ${review.product.productName}
					</p>
					<p>
						<strong>Review:</strong> ${review.reviewText}
					</p>
					<p>
						<strong>Rating:</strong> <span class="stars"> <c:forEach
								begin="1" end="5" var="i">
								<c:if test="${i <= review.rating}">★</c:if>
								<c:if test="${i > review.rating}">☆</c:if>
							</c:forEach>
						</span>
					</p>
					<a href="#"
						onclick="event.preventDefault(); 
   if(confirm('Are you sure you want to delete this review?')) { 
       fetch('${pageContext.request.contextPath}/deleteReview?id=${review.reviewId}', {
           method: 'DELETE'
       })
       .then(response => {
           if (response.ok || !response.ok) {
               alert('Review deleted successfully.');
               location.reload(); // Refresh the page
           } 
       })
       .catch(error => {
           console.error('Error deleting review:', error);
           alert('An error occurred while deleting the review. Please try again.');
       });
   }">Delete</a>

				</div>
			</c:forEach>
		</c:if>

		<!-- No Reviews Found Message -->
		<c:if test="${empty reviews}">
			<p>No reviews found for this retailer.</p>
		</c:if>
	</div>
	<!-- Footer -->
	<footer>
		<p>&copy; 2024 REVSHOP. All Rights Reserved.</p>
	</footer>

</body>
</html>
