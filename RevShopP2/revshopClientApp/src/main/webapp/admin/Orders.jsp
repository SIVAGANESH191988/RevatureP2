<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REVSHOP - Orders</title>
    <style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f0f2f5; /* Light gray background for contrast */
    color: #343a40; /* Dark text color */
    margin: 0;
    padding: 20px;
}

h1 {
    text-align: center;
    color: #000; /* Blue color for headings */
    margin-bottom: 30px; /* Space below heading */
    font-size: 2.5em; /* Increased font size */
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2); /* Soft shadow for depth */
}

table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Deeper shadow for a lifted effect */
    border-radius: 8px; /* Rounded corners for the table */
    overflow: hidden; /* Ensures rounded corners are respected */
}

table, th, td {
    border: none; /* Removed borders for a cleaner look */
}

th, td {
    padding: 15px; /* Increased padding for more space */
    text-align: left;
    vertical-align: middle;
    transition: background-color 0.3s, color 0.3s; /* Smooth transition for hover effects */
}

th {
    background-color: #ac914a; /* Table header background color */
    color: white;
    font-weight: bold;
    font-size: 1.2em; /* Increased header font size */
}

tr:nth-child(even) {
    background-color: #f9f9f9; /* Slightly darker shade for even rows */
}

tr:hover {
    background-color: #e9ecef; /* Highlight on row hover */
    transform: scale(1.02); /* Slight scaling effect on hover */
    transition: transform 0.2s; /* Smooth scaling transition */
}

td {
    position: relative; /* Position for data labels */
}

ul {
    list-style-type: none; /* Remove default bullet points */
    padding: 0;
    margin: 0;
}

li {
    padding: 8px 0; /* Vertical padding for list items */
    border-bottom: 1px solid #dee2e6; /* Light border between items */
}

li:last-child {
    border-bottom: none; /* Remove border for last item */
}

/* Responsive Design */
@media (max-width: 768px) {
    table, thead, tbody, th, td, tr {
        display: block; /* Block display for mobile */
    }

    th {
        display: none; /* Hide header on small screens */
    }

    tr {
        margin-bottom: 15px; /* Space between rows */
    }

    td {
        text-align: right; /* Align text to the right */
        position: relative;
        padding-left: 50%; /* Padding for labels */
    }

    td:before {
        content: attr(data-label); /* Data-label for screen readers */
        position: absolute;
        left: 10px;
        width: 45%; /* Width for labels */
        padding-right: 10px;
        text-align: left; /* Align labels to the left */
        font-weight: bold;
        color: #007bff; /* Blue color for labels */
    }
}

/* Additional enhancements */
.button {
    display: inline-block; /* Ensure button is inline */
    background-color: #28a745; /* Green button */
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 5px; /* Rounded corners */
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s; /* Smooth background transition */
    text-decoration: none; /* Remove underline from link */
    font-size: 1.1em; /* Slightly larger font for button */
}

.button:hover {
    background-color: #218838; /* Darker green on hover */
    transform: scale(1.05); /* Slight scaling effect on hover */
}

/* Add styles for the "Go to Admin Dashboard" button */
a.btn {
    display: block; /* Full width button */
    width: 200px; /* Fixed width for button */
    margin: 30px auto; /* Center the button */
    text-align: center; /* Center the text inside button */
    font-weight: bold; /* Bold text for emphasis */
}

    </style>
</head>
<body>

<h1>Orders List</h1>

<!-- Check if there are any orders to display -->
<c:choose>
    <c:when test="${not empty ordersList}">
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Order Status</th>
                    <th>Shipping Address</th>
                    <th>Billing Address</th>
                    <th>Total Amount</th>
                    <th>Buyer</th>
                    <th>Order Items</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterate through each order in the ordersList -->
                <c:forEach var="order" items="${ordersList}">
                    <tr>
<td data-label="Order ID">${order.orderId}</td>
<td data-label="Order Status">${order.orderStatus}</td>
<td data-label="Shipping Address">${order.shippingAddress}</td>
<td data-label="Billing Address">${order.billingAddress}</td>
<td data-label="Total Amount">${order.totalAmount}</td>
<td data-label="Buyer Name">${order.buyerName}</td>
<td data-label="Order Items">
    <ul>
        <c:forEach var="item" items="${order.orderItems}">
            <li>
                Product: ${item.product.productName}, 
                Quantity: ${item.quantity}, 
                Price: ${item.product.price}
            </li>
        </c:forEach>
    </ul>
</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <p>No orders available to display.</p>
    </c:otherwise>
</c:choose>

  <a href="${pageContext.request.contextPath}/admin/adminDashboard.jsp" class="btn">Go to Admin Dashboard</a>
</body>
<script>
function logout() {
    if (confirm('You have been logged out.')) {
        window.location.href = 'adminLogin.jsp'; 
    }
}</script>
</html>
