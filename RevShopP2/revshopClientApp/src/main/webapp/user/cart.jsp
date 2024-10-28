<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Your Cart</title>
    <link rel="stylesheet" type="text/css" href="path/to/your/styles.css"> <!-- Link to your CSS file -->
</head>
<body>
    <h1>Your Shopping Cart</h1>

    <c:if test="${not empty cartItems}">
        <table border="1">
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
            </tr>
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.quantity}</td>
                    <td>${item.price}</td>
                    <td>${item.quantity * item.price}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty cartItems}">
        <p>Your cart is empty.</p>
    </c:if>
    
    <a href="someOtherPage.jsp">Continue Shopping</a> <!-- Link to continue shopping -->
</body>
</html>
