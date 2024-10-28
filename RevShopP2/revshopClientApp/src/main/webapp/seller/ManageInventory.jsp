<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Inventory - REVSHOP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="manageInventory.css">
</head>
<body>

<div class="container mt-5">
    <h1 class="text-center">Manage Inventory</h1>
    <form action="${pageContext.request.contextPath}/manage-inventory" method="post">
        <div class="mb-3">
            <label for="productId" class="form-label">Product ID</label>
            <input type="number" class="form-control" id="productId" name="productId" required>
        </div>

        <div class="mb-3">
            <label for="stockQuantity" class="form-label">New Stock Quantity</label>
            <input type="number" class="form-control" id="stockQuantity" name="newStockQuantity" required>
        </div>
        <button type="submit" class="btn btn-primary" style="background-color: #ac914a; color:#000; margin-top:0px;  margin-bottom:30px; ">Update Stock</button>
        <a  onclick="window.location.href='Dashboard.jsp'" class="btn btn-secondary" style="marign-top: 10px; margin-bottom:30px;">Back to Product List</a>
    </form>
</div>

</body>
</html>
