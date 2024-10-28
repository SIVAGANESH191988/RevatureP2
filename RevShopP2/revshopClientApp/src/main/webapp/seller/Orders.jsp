<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order List</title>
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
	line-height: 1.6; /* Improve text readability */
}

/* Navbar */
nav {
	background-color: #fff; /* White background for navbar */
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
	color: #333; /* Text color for navbar links */
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

/* Main Content */
h1 {
	text-align: center;
	color: #333;
	margin: 20px 0; /* Add spacing above and below the header */
}

/* Table Styles */
table {
	width: 90%; /* Slightly narrower for better aesthetics */
	margin: 20px auto; /* Center the table and add spacing */
	background-color: #ffffff; /* White background for table */
	border-radius: 8px; /* Rounded corners */
	overflow: hidden; /* Round the corners of the table */
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Soft shadow effect */
	border-spacing: 0; /* Eliminate gaps between cells */
}

th, td {
	padding: 15px; /* Increased padding for better spacing */
	border: 1px solid #ddd; /* Light border for table cells */
	text-align: left;
	transition: background-color 0.3s ease;
	/* Smooth background transition */
}

th {
	background-color: #f2f2f2; /* Light gray background for headers */
	font-weight: 600; /* Slightly bolder font */
	color: #555; /* Darker text for headers */
}

tr:nth-child(even) {
	background-color: #f9f9f9; /* Zebra stripe effect */
}

tr:hover {
	background-color: #f1f1f1; /* Highlight row on hover */
}

/* Update button styles */
button {
	background-color: #ac914a; /* Button background color */
	color: white; /* White text */
	border: none; /* No border */
	padding: 8px 12px; /* Padding */
	border-radius: 5px; /* Rounded corners */
	cursor: pointer; /* Pointer cursor */
	transition: background-color 0.3s ease;
	/* Smooth background transition */
}

button:hover {
	background-color: #947b3b; /* Darker shade on hover */
}

/* Footer */
footer {
	background-color: #343a40; /* Darker footer background */
	color: #f2f2f2;
	padding: 20px 0;
	text-align: center;
	font-size: 14px;
	border-top: 4px solid #ac914a; /* Added a gold top border for style */
}

footer p {
	margin: 0;
	font-size: 16px;
}

/* Spacing Adjustments */
p {
	margin: 20px;
	text-align: center; /* Center-align text for better presentation */
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

	<h1>Your Orders</h1>

	<c:if test="${not empty orders}">
		<table>
			<thead>
				<tr>
					<th>Order ID</th>
					<th>Order Status</th>
					<th>Shipping Address</th>
					<th>Billing Address</th>
					<th>Total Amount</th>
					<th>Buyer Name</th>
					<th>Product Name</th>
					<th>Quantity</th>
					<th>Update Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${orders}">
					<c:forEach var="item" items="${order.orderItems}">
						<tr>
							<td>${order.orderId}</td>
							<td>${order.orderStatus}</td>
							<td>${order.shippingAddress}</td>
							<td>${order.billingAddress}</td>
							<td>${order.totalAmount}</td>
							<td>${order.buyerName}</td>
							<td>${item.productName}</td>
							<td>${item.quantity}</td>
							<td>
								<form
									action="${pageContext.request.contextPath}/updateOrderStatus"
									method="post">
									<input type="hidden" name="orderId" value="${order.orderId}">
									<select name="newStatus">
										<option value="Pending"
											${order.orderStatus == 'Pending' ? 'selected' : ''}>Pending</option>
										<option value="Shipped"
											${order.orderStatus == 'Shipped' ? 'selected' : ''}>Shipped</option>
										<option value="Delivered"
											${order.orderStatus == 'Delivered' ? 'selected' : ''}>Delivered</option>
										<option value="Cancelled"
											${order.orderStatus == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
									</select>
									<button type="submit">Update Status</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</c:if>

	<c:if test="${empty orders}">
		<p>No orders found.</p>
	</c:if>

	<!-- Footer -->
	<footer>
		<p>&copy; 2024 REVSHOP. All Rights Reserved.</p>
	</footer>

</body>
</html>
