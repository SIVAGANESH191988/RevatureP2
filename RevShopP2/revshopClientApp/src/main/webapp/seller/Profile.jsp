<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Seller Details - REVSHOP</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="details.css">
<style>
body {
	font-family: 'Poppins', sans-serif;
	background-color: #f0f2f5; /* Light background similar to Instagram */
	margin: 0;
	padding: 20px;
}

h1 {
	color: #333;
	text-align: center;
	margin-bottom: 30px;
	font-size: 2.5em;
	font-weight: 700;
}

.card {
	margin: 20px auto;
	max-width: 600px;
	border-radius: 15px; /* More rounded corners */
	overflow: hidden; /* For smoother border radius */
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Softer shadow */
}

.card-body {
	background-color: #fff;
	border-radius: 15px;
	padding: 20px;
}

.card-title {
	font-weight: 600;
	color: #555;
	margin-bottom: 15px; /* Spacing between titles */
}

.badge {
	font-size: 0.9em;
	padding: 0.4em 0.6em;
	border-radius: 10px; /* Rounder badges */
}

.bg-success {
	background-color: #1da1f2; /* Instagram-like blue for approved */
	color: white;
}

.bg-danger {
	background-color: #ff3b30; /* Instagram-like red for blocked */
	color: white;
}

.btn {
	width: 48%;
	border-radius: 25px; /* Rounded buttons */
	font-weight: 600;
}

.btn-primary {
	background-color: #0095f6; /* Instagram-like blue */
	border: none;
	transition: background-color 0.3s;
}

.btn-secondary {
	background-color: #e0e0e0; /* Light gray for secondary actions */
	border: none;
	transition: background-color 0.3s;
}

.btn-primary:hover {
	background-color: #007bbd; /* Darker blue on hover */
}

.btn-secondary:hover {
	background-color: #d1d1d1; /* Darker gray on hover */
}

/* Responsive Design */
@media ( max-width : 768px) {
	.card {
		width: 90%; /* Full width on smaller screens */
	}
	h1 {
		font-size: 2em; /* Adjusted heading size */
	}
}
</style>
</head>
<body>

	<h1>Seller Profile</h1>

	<div class="card">
		<div class="card-body">
			<h5 class="card-title">Business Details</h5>
			<p class="card-text">
				<strong>Business Name:</strong> ${sessionScope.businessName}
			</p>
			<p class="card-text">
				<strong>Email:</strong> ${sessionScope.email}
			</p>
			<p class="card-text">
				<strong>Contact Number:</strong> ${sessionScope.contactNo}
			</p>
			<p class="card-text">
				<strong>Account Status:</strong> <span
					class="badge ${sessionScope.isApproved ? 'bg-success' : 'bg-danger'}">
					${sessionScope.isApproved ? 'Approved' : 'Not Approved'} </span>
			</p>
			<p class="card-text">
				<strong>Account Blocked:</strong> <span
					class="badge ${sessionScope.isBlocked ? 'bg-danger' : 'bg-success'}">
					${sessionScope.isBlocked ? 'Yes' : 'No'} </span>
			</p>
			<div class="d-flex justify-content-between mt-4">
					<a href="${pageContext.request.contextPath}/seller/dashboard"
					class="btn btn-secondary">Back to Dashboard</a>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
