<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Product</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-color: #f8f9fa; /* Light background color */
}

.container {
	margin-top: 20px;
	margin-bottom: 40px;
	/* Added margin to create space between the container and footer */
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

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

.alert {
	margin-bottom: 20px;
}

.form-actions {
	margin-top: 20px;
}

.form-actions a {
	margin-left: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="text-center">Edit Product</h1>
		<!-- Start Form to Update Product -->
		<form action="${pageContext.request.contextPath}/updateProduct"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="retailerId">Retailer ID (optional):</label> <input
					type="text" id="retailerId" name="retailerId" class="form-control"
					value="${sessionScope.retailerId}" readonly />
			</div>
			<div class="form-group">
				<label for="productId">Product ID:</label> <input type="text"
					id="productId" name="productId" class="form-control"
					value="${param.productId}" readonly />
			</div>
			<div class="form-group">
				<label for="name">Product Name:</label> <input type="text" id="name"
					name="name" class="form-control" value="${product.productName}"
					required />
			</div>
			<div class="form-group">
				<label for="description">Description:</label>
				<textarea id="description" name="description" class="form-control"
					required>${product.description}</textarea>
			</div>
			<div class="form-group">
				<label for="category">Category:</label> <select id="category"
					name="category" class="form-control" required>
					<option value="">Select a category</option>
					<option value="Electronics">Electronics</option>
					<option value="Clothing">Clothing</option>
					<option value="Home Appliances">Home Appliances</option>
					<option value="Books">Books</option>
					<option value="Toys">Toys</option>
					<option value="Health & Beauty">Health & Beauty</option>
				</select>
			</div>
			<div class="form-group">
				<label for="price">Price:</label> <input type="number" id="price"
					name="price" class="form-control" value="${product.price}"
					step="0.01" required />
			</div>
			<div class="form-group">
				<label for="stockQuantity">Stock Quantity:</label> <input
					type="number" id="stockQuantity" name="stockQuantity"
					class="form-control" value="${product.stockQuantity}" required />
			</div>
			<div class="form-group">
				<label for="imageFile">Product Image:</label> <input type="file"
					id="imageFile" name="imageFile" class="form-control" />
			</div>

			<!-- Form Actions -->
			<div class="form-actions text-center">
				<button type="submit" class="btn btn-primary">Update
					Product</button>
				<a href="${pageContext.request.contextPath}/products"
					class="btn btn-secondary">Cancel</a>
			</div>
		</form>
	</div>

	<footer>
		<p>&copy; 2024 REVSHOP. All Rights Reserved.</p>
	</footer>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
