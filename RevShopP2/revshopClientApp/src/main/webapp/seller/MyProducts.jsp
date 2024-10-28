<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Products</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<!-- Added Google Fonts -->
<style>
/* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Navigation Styles */
nav {
    background-color: #f8f9fa; /* Softer light grey background */
    padding: 15px 50px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
    font-family: 'Poppins', sans-serif;
    position: sticky;
    top: 0;
    z-index: 1000;
}

nav div {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

nav ul {
    list-style: none;
    display: flex;
    gap: 50px; /* Increased space between items for better navigation */
}

nav ul li {
    position: relative;
}

nav ul li a {
    color: #333;
    text-decoration: none;
    font-weight: 600;
    padding: 10px 15px;
    transition: all 0.3s ease;
    border-radius: 8px; /* Slightly more rounded corners */
}


nav ul li ul {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    background-color: #ffffff;
    list-style: none;
    padding: 10px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
    border-radius: 10px; /* Soft rounded dropdown */
    z-index: 100;
    width: 220px; /* Increase this width as needed */
}

nav ul li:hover ul {
    display: block;
}

nav ul li ul li a {
    padding: 10px 20px;
    font-weight: 400;
}



/* Footer Styles */
footer {
    background-color: #343a40; /* Darker footer background */
    color: #f2f2f2;
    padding: 25px 0; /* Increased footer padding */
    text-align: center;
    font-size: 14px;
    border-top: 4px solid #ac914a; /* Added a gold top border for style */
}

footer p {
    margin: 0;
    font-size: 16px;
}

/* Body Styles */
body, html {
    font-family: 'Poppins', sans-serif;
    font-size: 16px;
    color: #333;
    background-color: #f3f4f7; /* Light grey background */
    margin: 0;
    padding: 0;
}

h1 {
    text-align: center;
    margin-bottom: 30px;
    font-weight: 700; /* Increased font-weight for heading */
    color: #333;
    font-size: 36px; /* Larger heading */
}

/* Content Container */
.content-container {

    padding: 30px;
    margin: 40px auto;
    max-width: 1200px; /* Content container is now limited to 1200px */
}

/* Card Container */
.card-container {
    display: flex;
    flex-wrap: wrap;
    max-width: 2000px;
    justify-content: space-between;
    gap: 30px; /* More space between cards */
}

/* Individual Card */
.card {
    background-color: #ffffff;
    border: 1px solid #ddd;
    border-radius: 15px; /* More rounded corners */
    padding: 20px;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1); /* Larger shadow for more depth */
    flex: 1 1 calc(33.333% - 30px);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: translateY(-5px); /* More subtle lift on hover */
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
}

.card img {
    max-width: 100%;
    height: auto;
    border-radius: 15px; /* More rounded corners */
    margin-bottom: 15px; /* Added margin between image and content */
}

.card h5 {
    margin-top: 15px;
    font-weight: 600;
    color: #333;
    font-size: 22px; /* Slightly larger card title */
}

.card p {
    font-size: 14px; /* Slightly smaller text for descriptions */
    color: #555; /* Softer text color */
    line-height: 1.6; /* Better line spacing */
}

/* Card Actions */
.card-actions {
    margin-top: 15px; /* Increased margin for better spacing */
    display: flex; /* Flexbox to align buttons/links */
    justify-content: space-between; /* Space between the action items */
    align-items: center; /* Align items vertically in the center */
}

.card-actions a {
    display: inline-block; /* Ensure links behave like buttons */
    padding: 8px 16px; /* Add padding for button-like appearance */
    color: #ffffff; /* Changed text color to white */
    background-color: #343a40; /* Button background color */
    border-radius: 5px; /* Rounded corners for the buttons */
    font-weight: 500; /* Medium weight for better readability */
    text-decoration: none; /* Remove underline */
    transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transitions */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15); /* Subtle shadow for depth */
}

.card-actions a:hover {
    background-color: #926f34; /* Darker hover effect */
    transform: translateY(-2px); /* Lift effect on hover */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Larger shadow on hover */
}

.card-actions a:first-child {
    margin-right: 10px; /* Small space between the first and second action buttons */
}

.card a {
    color: #ac914a;
    font-weight: 500;
    text-decoration: none;
    transition: color 0.3s ease;
}

.card a:hover {
    color: #333;
}

/* Responsive Styles */
@media (max-width: 768px) {
    .card {
        flex: 1 1 calc(50% - 20px);
    }
}

@media (max-width: 480px) {
    .card {
        flex: 1 1 100%;
    }

    nav ul {
        flex-direction: column; /* Stack menu items vertically on small screens */
        gap: 20px; /* Reduced space between items for mobile */
    }
}

</style>
</head>
<body>
	<nav>
		<div>
			<a href="#"><img src="IMAGES/LOGO.png" alt="Logo" height="50"></a>
			<ul>
				<li><a href="${pageContext.request.contextPath}/seller/dashboard">Home</a></li>
				<li><a href="#" id="productsDropdown">My Products</a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/products">All
								Products</a></li>
						<li><a href="/revshopClientApp/seller/AddNewProduct.jsp">Add
								New Product</a></li>
					</ul></li>
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

	<div class="content-container">
		<h1>My Products</h1>

		<c:if test="${not empty products}">
			<div class="card-container">
				<c:forEach var="product" items="${products}">
					<div class="card">
						<img src="${pageContext.request.contextPath}/IMAGES/${product.image}" class="img-fluid" alt="Product Image">
						<h5 class="card-title">${product.productName}</h5>
						<p class="card-text">
							<strong>Description:</strong> ${product.description}
						</p>
						<p class="card-text">
							<strong>Price:</strong> $${product.price}
						</p>
						<strong>Stock:</strong>
						<form action="${pageContext.request.contextPath}/manage-inventory"
							method="post" style="display: inline;">
							<input type="hidden" name="productId"
								value="${product.productId}"> <input type="number"
								name="newStockQuantity" value="${product.stockQuantity}"
								required style="width: 70px;">
							<button type="submit" class="far fa-edit"
								onclick="return confirm('Are you sure you want to update this stock?')">
								<i class="fas fa-sync-alt"></i> Update
							</button>
						</form>
						<p class="card-text">
							<strong>Category:</strong> ${product.category}
						</p>
						<div class="card-actions">
							<a href="${pageContext.request.contextPath}/seller/EditProduct.jsp?productId=${product.productId}">Edit</a> 
							<a href="#"
								onclick="event.preventDefault(); 
							   if(confirm('Are you sure you want to delete this product?')) { 
							       fetch('${pageContext.request.contextPath}/deleteProduct?productId=${product.productId}', {
							           method: 'DELETE'
							       })
							       .then(response => {
							           if (response.ok || !response.ok) {
							               alert('Product deleted successfully.');
							               location.reload(); // Refresh the page
							           }
							       })
							       .catch(error => {
							           console.error('Error deleting product:', error);
							           alert('An error occurred while deleting the product. Please try again.');
							       });
							   }">Delete</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>

		<c:if test="${empty products}">
			<p>No products found for this retailer.</p>
		</c:if>
	</div>

	<footer>
		<p>&copy; 2024 REVSHOP. All Rights Reserved.</p>
	</footer>
</body>
</html>
