<%@ page import="java.util.List"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.revshop.revshopClientApp.dto.Buyer"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>REVSHOP - Customers</title>
<link rel="stylesheet" href="adminDashboard.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="responsive.css">
<link rel="icon" href="IMAGES/LOGO.png" type="image/png" sizes="64x64">
<style>
@charset "UTF-8";
/* Main CSS Here */
@import url(
"https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

:root {
	--background-color1: #fafaff;
	--background-color2: #ffffff;
	--background-color3: #ededed;
	--background-color4: #cad7fda4;
	--primary-color: #4b49ac;
	--secondary-color: #0c007d;
	--Border-color: #3f0097;
	--one-use-color: #3f0097;
	--two-use-color: #5500cb;
}

body {
	background-color: var(--background-color4);
	max-width: 100%;
	overflow-x: hidden;
}

header {
	height: 70px;
	width: 100vw;
	padding: 0 30px;
	background-color: var(--background-color1);
	position: fixed;
	z-index: 100;
	box-shadow: 1px 1px 15px rgba(161, 182, 253, 0.825);
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	font-size: 27px;
	font-weight: 600;
	color: #ac914a;
}

.icn {
	height: 30px;
}

.menuicn {
	cursor: pointer;
}

.searchbar, .message, .logosec {
	display: flex;
	align-items: center;
	justify-content: center;
}

.searchbar2 {
	display: none;
}

.logosec {
	gap: 60px;
}

.searchbar input {
	width: 250px;
	height: 42px;
	border-radius: 50px 0 0 50px;
	background-color: var(--background-color3);
	padding: 0 20px;
	font-size: 15px;
	outline: none;
	border: none;
}

.searchbtn {
	width: 50px;
	height: 42px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 0px 50px 50px 0px;
	background-color: var(--secondary-color);
	cursor: pointer;
}

.message {
	gap: 40px;
	position: relative;
	cursor: pointer;
}

.circle {
	height: 7px;
	width: 7px;
	position: absolute;
	background-color: #fa7bb4;
	border-radius: 50%;
	left: 19px;
	top: 8px;
}

.dp {
	height: 40px;
	width: 40px;
	background-color: #626262;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}

.main-container {
	display: flex;
	width: 100vw;
	position: relative;
	top: 70px;
	z-index: 1;
}

.dpicn {
	height: 42px;
}

.main {
	height: calc(100vh - 70px);
	width: 100%;
	overflow-y: scroll;
	overflow-x: hidden;
	padding: 40px 30px 30px 30px;
}

.main::-webkit-scrollbar-thumb {
	background-image: linear-gradient(to bottom, rgb(0, 0, 85),
		rgb(0, 0, 50));
}

.main::-webkit-scrollbar {
	width: 5px;
}

.main::-webkit-scrollbar-track {
	background-color: #9e9e9eb2;
}

.box-container {
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	flex-wrap: wrap;
	gap: 50px;
}

.nav {
	min-height: 91vh;
	width: 250px;
	background-color: var(--background-color2);
	position: absolute;
	top: 0px;
	left: 00;
	box-shadow: 1px 1px 10px rgba(198, 189, 248, 0.825);
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	overflow: hidden;
	padding: 30px 0 20px 10px;
}

.navcontainer {
	height: calc(100vh - 70px);
	width: 250px;
	position: relative;
	overflow-y: scroll;
	overflow-x: hidden;
	transition: all 0.5s ease-in-out;
}

.navcontainer::-webkit-scrollbar {
	display: none;
}

.navclose {
	width: 80px;
}

.nav-option {
	width: 250px;
	height: 60px;
	display: flex;
	align-items: center;
	padding: 0 30px 0 20px;
	gap: 20px;
	transition: all 0.1s ease-in-out;
}

.nav-option:hover {
	border-left: 5px solid #a2a2a2;
	background-color: #ac914a;
	cursor: pointer;
}

.nav-img {
	height: 30px;
}

.nav-upper-options {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 30px;
}

.option1 {
	border-left: 5px solid #010058af;
	background-color: #ac914a;
	color: #000;
	cursor: pointer;
}

.option1:hover {
	border-left: 5px solid #000;
	background-color: #ac914a;
}

.box {
	height: 130px;
	width: 230px;
	border-radius: 20px;
	box-shadow: 3px 3px 10px rgba(0, 30, 87, 0.751);
	padding: 20px;
	display: flex;
	align-items: center;
	justify-content: space-around;
	cursor: pointer;
	transition: transform 0.3s ease-in-out;
}

.box:hover {
	transform: scale(1.08);
}

.box:nth-child(1) {
	background-color: var(--one-use-color);
}

.box:nth-child(2) {
	background-color: var(--two-use-color);
}

.box:nth-child(3) {
	background-color: var(--one-use-color);
}

.box:nth-child(4) {
	background-color: var(--two-use-color);
}

.box img {
	height: 50px;
}

.box .text {
	color: white;
}

.topic {
	font-size: 13px;
	font-weight: 400;
	letter-spacing: 1px;
}

.topic-heading {
	font-size: 30px;
	letter-spacing: 3px;
}

.report-container {
	min-height: 300px;
	max-width: 1200px;
	margin: 70px auto 0px auto;
	background-color: #ac914a;
	border-radius: 30px;
	box-shadow: 3px 3px 10px rgb(188, 188, 188);
	padding: 0px 20px 20px 20px;
}

.report-header {
	height: 80px;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 20px 20px 10px 20px;
	border-bottom: 2px solid rgba(0, 20, 151, 0.59);
}

.recent-Articles {
	font-size: 30px;
	font-weight: 600;
	color: #5500cb;
}

.view {
	height: 35px;
	width: 90px;
	border-radius: 8px;
	background-color: #ac914a;
	color: white;
	font-size: 15px;
	border: none;
	cursor: pointer;
}

.report-body {
	max-width: 1160px;
	overflow-x: auto;
	padding: 20px;
}

.report-topic-heading, .item1 {
	width: 1120px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.t-op {
	font-size: 18px;
	letter-spacing: 0px;
}

.items {
	width: 1120px;
	margin-top: 15px;
}

.item1 {
	margin-top: 20px;
}

.t-op-nextlvl {
	font-size: 14px;
	letter-spacing: 0px;
	font-weight: 600;
}

.label-tag {
	width: 100px;
	text-align: center;
	background-color: rgb(0, 177, 0);
	color: white;
	border-radius: 4px;
}
/* Responsive CSS Here */
@media screen and (max-width: 950px) {
	.nav-img {
		height: 25px;
	}
	.nav-option {
		gap: 30px;
	}
	.nav-option h3 {
		font-size: 15px;
	}
	.report-topic-heading, .item1, .items {
		width: 800px;
	}
}

@media screen and (max-width: 850px) {
	.nav-img {
		height: 30px;
	}
	.nav-option {
		gap: 30px;
	}
	.nav-option h3 {
		font-size: 20px;
	}
	.report-topic-heading, .item1, .items {
		width: 700px;
	}
	.navcontainer {
		width: 100vw;
		position: absolute;
		transition: all 0.6s ease-in-out;
		top: 0;
		left: -100vw;
	}
	.nav {
		width: 100%;
		position: absolute;
	}
	.navclose {
		left: 00px;
	}
	.searchbar {
		display: none;
	}
	.main {
		padding: 40px 30px 30px 30px;
	}
	.searchbar2 {
		width: 100%;
		display: flex;
		margin: 0 0 40px 0;
		justify-content: center;
	}
	.searchbar2 input {
		width: 250px;
		height: 42px;
		border-radius: 50px 0 0 50px;
		background-color: var(--background-color3);
		padding: 0 20px;
		font-size: 15px;
		border: 2px solid var(--secondary-color);
	}
}

@media screen and (max-width: 490px) {
	.message {
		display: none;
	}
	.logosec {
		width: 100%;
		justify-content: space-between;
	}
	.logo {
		font-size: 20px;
	}
	.menuicn {
		height: 25px;
	}
	.nav-img {
		height: 25px;
	}
	.nav-option {
		gap: 25px;
	}
	.nav-option h3 {
		font-size: 12px;
	}
	.nav-upper-options {
		gap: 15px;
	}
	.recent-Articles {
		font-size: 20px;
	}
	.report-topic-heading, .item1, .items {
		width: 550px;
	}
}

@media screen and (max-width: 400px) {
	.recent-Articles {
		font-size: 17px;
	}
	.view {
		width: 60px;
		font-size: 10px;
		height: 27px;
	}
	.report-header {
		height: 60px;
		padding: 10px 10px 5px 10px;
	}
	.searchbtn img {
		height: 20px;
	}
}

@media screen and (max-width: 320px) {
	.recent-Articles {
		font-size: 12px;
	}
	.view {
		width: 50px;
		font-size: 8px;
		height: 27px;
	}
	.report-header {
		height: 60px;
		padding: 10px 5px 5px 5px;
	}
	.t-op {
		font-size: 12px;
	}
	.t-op-nextlvl {
		font-size: 10px;
	}
	.report-topic-heading, .item1, .items {
		width: 300px;
	}
	.report-body {
		padding: 10px;
	}
	.label-tag {
		width: 70px;
	}
	.searchbtn {
		width: 40px;
	}
	.searchbar2 input {
		width: 180px;
	}
}

:root {
	--primary-color: #ac914a; /* Adjust this color to match your theme */
	--border-color: #ddd;
	--odd-row-bg-color: #f9f9f9;
	--text-color: #333;
	--font-size-base: 16px;
	--padding-base: 12px;
}

.table {
	width: 100%;
	border-collapse: collapse;
	margin: 50px 0;
	font-size: var(--font-size-base);
	color: var(--text-color);
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.table thead {
	background-color: var(--primary-color);
	color: #fff;
}

.table th, .table td {
	padding: var(--padding-base);
	border: 1px solid var(--border-color);
	text-align: left;
}

.table th {
	font-size: 1.125rem; /* 18px */
	font-weight: bold;
}

.table tr:nth-child(even) {
	background-color: var(--odd-row-bg-color);
}

.table td {
	font-size: 0.875rem; /* 14px */
}

.toggle-block-btn {
   background: transparent;
    color: #000; /* Text color */
    border: none; /* Remove default border */
    padding: 10px 15px; /* Padding for better size */
    border-radius: 5px; /* Rounded corners */
    font-size: 16px; /* Font size */
    cursor: pointer; /* Pointer cursor on hover */
    transition:  0.3s, transform 0.2s; /* Smooth transitions */
}




/* Responsive Design */
@media screen and (max-width: 768px) {
	.table {
		font-size: 0.875rem; /* 14px */
	}
	.table th, .table td {
		padding: 10px;
	}
}

@media screen and (max-width: 480px) {
	.table {
		font-size: 0.75rem; /* 12px */
	}
	.table th, .table td {
		padding: 8px;
	}
}
</style>
</head>
<body>


	<header>
		<div class="logosec">
			<img
				src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182541/Untitled-design-(30).png"
				class="icn menuicn" id="menuicn" alt="menu-icon">
		</div>
		<div class="logo">REVSHOP</div>
		<div class="message">
			<div class="dp">
				<img
					src="https://media.geeksforgeeks.org/wp-content/uploads/20221210180014/profile-removebg-preview.png"
					class="dpicn" alt="dp">
			</div>
			<div class="admin-email">
				<span><%=session.getAttribute("adminEmail") != null ? session.getAttribute("adminEmail") : "Not logged in"%></span>
			</div>
		</div>
	</header>

	<div class="main-container">

		<div class="navcontainer">
			<nav class="nav">
				<div class="nav-upper-options">
					<div class="nav-option option1" onclick="showSection('dashboard')">
						<i class="fas fa-users" style="font-size: 28px"></i>
						<h3>Buyers</h3>
					</div>
					<div class="nav-option logout" onclick="logout()">
						<i class="fa fa-sign-out" style="font-size: 24px"></i>
						<h3>Logout</h3>
					</div>
				</div>
			</nav>
		</div>

<div class="main">
    <div id="dashboard" class="content-section">
        <div class="box-container">
            <div class="container">
                <h2>List of Buyers</h2>
                <table border="1" class="table">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Contact</th>
                            <th>City</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty buyersList}">
                                <c:forEach var="buyer" items="${buyersList}">
                                    <tr>
                                        <td>${buyer.buyerId}</td>
                                        <td>${buyer.name}</td>
                                        <td>${buyer.email}</td>
                                        <td>${buyer.password}</td> <!-- Consider not displaying the password for security reasons -->
                                        <td>${buyer.contactNo}</td>
                                        <td>${buyer.city}</td>
                                        <td>
                                            <form action="${pageContext.request.contextPath}/${buyer.blocked ? 'unblockBuyer' : 'blockBuyer'}" method="POST" style="display: inline;">
                                                <input type="hidden" name="buyerId" value="${buyer.buyerId}">
                                                <button type="submit" class="toggle-block-btn">
                                                    ${buyer.blocked ? 'Unblock' : 'Block'}
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="7">No buyers found.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>

                <div class="button-container">
                    <a href="${pageContext.request.contextPath}/admin/adminDashboard.jsp" class="btn">Go to Admin Dashboard</a>
                </div>

            </div>
        </div>
    </div>
</div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function logout() {
    if (confirm('You have been logged out.')) {
        window.location.href = 'adminLogin.jsp'; 
    }
}</script>
</html>
