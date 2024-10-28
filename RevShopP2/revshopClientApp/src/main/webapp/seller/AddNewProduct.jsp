<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Viewport for responsiveness -->
<title>Add New Product</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">
<style>
footer {
	background-color: #343a40; 
	color: #f2f2f2;
	padding: 20px 0;
	text-align: center;
	font-size: 14px;
	border-top: 4px solid #ac914a; 
}

footer p {
	margin: 0;
	font-size: 16px;
}

.alert {
	margin-bottom: 20px;
}

.container {
	margin-bottom: 50px; 
}
</style>
</head>
<body>
	<div class="container mt-5">
		<h1 class="mb-4">Add New Product</h1>

		<c:if test="${not empty sessionScope.message}">
			<div class="alert alert-warning">
				<c:out value="${sessionScope.message}" />
			</div>
			<c:remove var="message" scope="session" />
		</c:if>

		<form action="<c:url value='/addProduct' />" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="retailerId">Retailer ID (optional):</label> <input
					type="text" id="retailerId" name="retailerId" class="form-control"
					value="${sessionScope.retailerId}" readonly />
			</div>
			<div class="form-group">
				<label for="name">Product Name:</label> <input type="text" id="name"
					name="productName" class="form-control" required />
			</div>
			<div class="form-group">
				<label for="description">Description:</label>
				<textarea id="description" name="description" class="form-control"
					required></textarea>
			</div>
			<div class="form-group">
				<label for="price">Price:</label> <input type="number" id="price"
					name="price" class="form-control" step="0.01" required />
			</div>
			<div class="form-group">
				<label for="stockQuantity">Stock Quantity:</label> <input
					type="number" id="stockQuantity" name="stockQuantity"
					class="form-control" required />
			</div>
			<div class="form-group">
				<label for="image">Image:</label> <input type="file" id="image"
					name="imageFile" class="form-control-file" accept="image/*"
					required />
			</div>
			<div class="form-group">
				<label for="category">Category:</label> <select id="category"
					name="category" class="form-control" required
					onchange="toggleOtherCategory(this.value)">
					<option value="">Select a category</option>
					<option value="Electronics">Electronics</option>
					<option value="Clothing">Clothing</option>
					<option value="Home Appliances">Home Appliances</option>
					<option value="Books">Books</option>
					<option value="Toys">Toys</option>
					<option value="Health & Beauty">Health & Beauty</option>
					<option value="Other">Other</option>
				</select>
			</div>

			<!-- Hidden field for custom category input -->
			<div id="otherCategoryDiv" class="form-group" style="display: none;">
				<label for="otherCategory">Please specify the category:</label> <input
					type="text" id="otherCategory" name="category"
					class="form-control" placeholder="Enter your category">
			</div>
			<button type="submit" class="btn btn-primary">Add Product</button>
			<a href="<c:url value='/seller/dashboard' />"
				class="btn btn-secondary">Back to Dashboard</a>
		</form>
	</div>

	<footer>
		<p>&copy; 2024 REVSHOP. All Rights Reserved.</p>
	</footer>

	<!-- Bootstrap JS and dependencies (optional) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
	function toggleOtherCategory(selectedValue) {
        var otherCategoryDiv = document.getElementById('otherCategoryDiv');
        if (selectedValue === 'Other') {
            otherCategoryDiv.style.display = 'block'; 
            document.getElementById('otherCategory').required = true; 
        } else {
            otherCategoryDiv.style.display = 'none'; 
            document.getElementById('otherCategory').required = false;
        }
    }
	</script>
</body>
</html>