<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
/* Reset some default browser styling */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body styling */
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f8f9fa;
    color: #333;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 20px;
background: radial-gradient(circle, rgba(225,192,72,1) 7%, rgba(231,233,127,0.34234943977591037) 27%);
}

/* Main container */
.container {
    background-color: #fff;
    padding: 40px 50px;
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    text-align: left; /* Align text to the left */
    width: 100%;
    max-width: 500px;
    position: relative;
    animation: fadeIn 0.6s ease-in-out;
}

/* Subtle fade-in animation */
@keyframes fadeIn {
    0% {
        opacity: 0;
        transform: translateY(20px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Profile icon above the container */
.container::before {
    content: '\f007';
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    font-size: 60px;
    color: #007bff;
    position: absolute;
    top: -40px;
    left: 50%;
    transform: translateX(-50%);
    background-color: #fff;
    padding: 10px;
    border-radius: 50%;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* User details */
.container p {
    font-size: 1.2rem;
    margin-bottom: 20px; /* Margin for spacing between rows */
    font-weight: 500;
    color: #555;
    display: block; /* Use block display for a straightforward row layout */
}

/* Adding label style for better separation */
.container p label {
    font-weight: bold; /* Make the label bold for emphasis */
    color: #333; /* Darker color for labels */
}

.container p span {
    color: #007bff; /* Highlight color for values */
    font-weight: 600;
    margin-left: 10px; /* Space between label and value */
}


/* Stylish Divider */
hr {
    margin: 20px 0;
    border: none;
    height: 1px;
    background-color: #e9ecef;
}

/* Logout Button */
button {
    background-color: #007bff;
    color: #fff;
    padding: 14px 25px;
    border: none;
    border-radius: 50px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.3s ease;
    width: 100%;
    margin-top: 20px;
}

button:hover {
    background-color: #0056b3;
    transform: translateY(-3px);
}

/* Responsive Design */
@media (max-width: 768px) {
    .container {
        padding: 30px 20px;
    }

    .container p {
        font-size: 1rem;
    }

    button {
        padding: 12px;
    }
}

</style>
</head>
<body>
    <div class="container">
        <p>Name: <span>${sessionScope.name}</span></p>
        <p>Email: <span>${sessionScope.email}</span></p>
        <p>Password: <span>${sessionScope.password}</span></p>
        <p>Contact No: <span>${sessionScope.contactNo}</span></p>
        <p>City: <span>${sessionScope.city}</span></p>
        <hr>
        <form action="${pageContext.request.contextPath}/buyer/logout" method="post">
            <button type="submit">Logout</button>
        </form>
    </div>
</body>
</html>
