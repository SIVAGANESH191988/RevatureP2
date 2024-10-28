<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Account - REVSHOP</title>
    <link rel="stylesheet" href="createAccount.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script>
        // Function to display alert message if session message exists
        function showAlert() {
            var message = '${sessionScope.message}'; // Get the message
            if (message) {
                alert(message); // Show alert
            }
        }
    </script>
</head>
<body onload="showAlert()"> <!-- Call showAlert on page load -->

<main>
    <div class="content-container">
        <!-- Left side: Logo -->
        <div class="left-column">
            <img src="IMAGES/LOGO.png" alt="Logo" class="left-logo">
        </div>

        <!-- Right side: Form Section -->
        <section class="form-section">
            <div class="progress-indicators" style="display: flex; justify-content: center; margin-bottom: 20px;">
                <div class="indicator active" style="text-align: center; flex: 1; font-size: 24px; color: black; font-weight: bold;">
                    <span>Login</span>
                </div>
            </div>

            <div class="form-container">
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <input type="email" id="email" name="email" placeholder="Enter your email" onkeyup="validateEmail()" required>
                    <span id="emailError" class="error-message"></span>
                    <input type="password" id="password" name="password" placeholder="Password" required>
                    <button type="submit" id="login" class="btn btn-primary btn-block">
                        <b>Login</b>
                    </button>
                </form>
                <p class="login-link">
                    Don't have an account? <a href="createAccount.jsp">Create Account</a>
                </p>
            </div>
        </section>
    </div>
</main>

<script src="createAccount.js"></script>

</body>
</html>
