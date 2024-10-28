<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Account - REVSHOP</title>
<link rel="stylesheet" href="createAccount.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
	<main>
		<div class="content-container">
			<!-- Left side: Logo -->
			<div class="left-column">
				<img src="IMAGES/LOGO.png" alt="Logo" class="left-logo">
			</div>

			<!-- Right side: Form Section -->
			<section class="form-section">
				<div class="progress-indicators"
					style="display: flex; justify-content: center; margin-bottom: 20px;">
					<div class="indicator active"
						style="text-align: center; flex: 1; font-size: 24px; color: black; font-weight: bold;">
						<span>Registration</span>
					</div>
				</div>

				<div class="form-container">
					<form action="${pageContext.request.contextPath}/register"
						method="post">
						<input type="text" id="contactNo" name="contactNo"
							placeholder="Enter Mobile Number" onkeyup="validateContactNo()"
							required> <span id="contactNoError" class="error-message"></span>
						<input type="email" id="email" name="email"
							placeholder="Enter your email" onkeyup="validateEmail()" required>
						<span id="emailError" class="error-message"></span> <input
							type="text" id="businessName" name="businessName"
							placeholder="Enter Business Name" required> <input
							type="password" id="password" name="password"
							placeholder="Create password" onkeyup="validatePassword()"
							required> <span id="passwordError" class="error-message"></span>

						<input type="text" readonly id="capt"> <input type="text"
							id="captcha-input" placeholder="Enter above CAPTCHA" required>
						<span id="captchaError" class="error-message"></span>

						<div class="captcha-container">
							<button type="button" onclick="refreshCaptcha()">
								CAPTCHA Not Visible?... <i class="fa fa-refresh"
									aria-hidden="true"></i>
							</button>
						</div>

						<div class="checkbox">
							<input id="checkbox" type="checkbox" required> <label
								for="checkbox"> I agree to these <a href="#"
								onclick="openTermsModal(); return false;">Terms and
									Conditions</a>.
							</label>
						</div>

						<button type="submit" id="register">
							<b>Register</b>
						</button>
					</form>

					<p class="login-link">
						Already have an account? <a href="mainpage.jsp">Login</a>
					</p>
				</div>
			</section>
		</div>
	</main>

	<!-- Why Sell on Revshop Section (unchanged) -->
	<section class="why-sell">
		<h2 class="title">Why sell on Revshop?</h2>
		<div class="benefits">
			<div class="benefit">
				<div class="icon-container">
					<div class="circle">
						<i class="fa-solid fa-truck-fast"></i>
					</div>
				</div>
				<h3>Sell Across India</h3>
				<p>Reach over 50 crore+ customers across 27000+ pincodes</p>
			</div>
			<div class="benefit">
				<div class="circle">
					<span class="percentage-symbol">%</span>
				</div>
				<h3>Higher Profits</h3>
				<p>With 0% commission*, you take 100% profits with you</p>
			</div>
			<div class="benefit">
				<div class="icon-container">
					<div class="circle">
						<i class="fa-solid fa-user-tie"></i>
						<!-- Account Management Icon -->
					</div>
				</div>
				<h3>Account Management</h3>
				<p>Our Dedicated managers will help your business on Flipkart</p>
			</div>
			<div class="benefit">
				<div class="icon-container">
					<div class="circle">
						<div class="down-arrow">
							<span class="double-arrow">&#8659;</span>
							<!-- Double Line Down Arrow -->
						</div>
					</div>
				</div>
				<h3>Lower Return Charges</h3>
				<p>With our flat and low return charges, ship your products
					stress-free</p>
			</div>
			<div class="benefit">
				<div class="icon-container">
					<div class="circle">
						<i class="fa-solid fa-headset"></i>
						<!-- 24x7 Support Icon -->
					</div>
				</div>
				<h3>24x7 Support</h3>
				<p>All your queries and issues are answered by our dedicated
					Seller Support Team</p>
			</div>
			<div class="benefit">
				<div class="icon-container">
					<div class="circle">
						<span class="rupee-symbol">&#8377;</span>
						<!-- Indian Rupee Symbol -->
					</div>
				</div>
				<h3>Fast & Regular Payments</h3>
				<p>Get payments as fast as 7-10 days from the date of dispatch</p>
			</div>
		</div>
	</section>

	<!-- Terms and Conditions Modal (unchanged) -->
	<div id="termsModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2>Terms and Conditions</h2>
			<p>
				Welcome to REVSHOP! By creating an account and using our platform,
				you agree to the following terms and conditions: <br> <br>
				<strong>1. User Agreement:</strong><br> By registering on
				REVSHOP, you acknowledge that all the information provided is
				accurate and up-to-date. You are responsible for maintaining the
				confidentiality of your account and password. <br> <br> <strong>2.
					Business Responsibilities:</strong><br> As a seller on REVSHOP, you are
				responsible for ensuring that all products listed comply with all
				applicable laws and regulations. REVSHOP is not liable for any
				disputes or legal issues that may arise from the sale of your
				products. <br> <br> <strong>3. Payment and
					Commission:</strong><br> REVSHOP offers a 0% commission structure;
				however, payment processing and delivery fees may apply based on the
				shipping destination and payment method. Sellers will receive their
				payments within 7-10 business days from the date of dispatch. <br>
				<br> <strong>4. Shipping and Returns:</strong><br> You are
				responsible for shipping your products to customers promptly.
				REVSHOP provides a streamlined shipping process with low return
				charges to ensure smooth transactions. In case of any issues with
				product returns, sellers must handle the process with the customer
				directly. <br> <br> <strong>5. Data Protection:</strong><br>
				We take privacy and data security seriously. REVSHOP will not share
				your personal or business information with third parties without
				your consent, except as required by law. <br> <br> <strong>6.
					Account Termination:</strong><br> REVSHOP reserves the right to
				terminate or suspend any account that violates our terms of service,
				engages in fraudulent activity, or provides false information. <br>
				<br> <strong>7. Support:</strong><br> Our dedicated seller
				support team is available 24/7 to help with any queries or issues
				you may face while using the platform. <br> <br> By
				clicking "I Agree," you confirm that you have read, understood, and
				agreed to these terms and conditions. You also acknowledge that
				these terms may be updated periodically, and it is your
				responsibility to stay informed of any changes.
			</p>
			<button id="agreeButton">I Agree</button>
		</div>
	</div>

	<%
	String message = (String) request.getSession().getAttribute("message");
	if (message != null) {
		request.getSession().removeAttribute("message"); // Remove it after retrieving
	}
	%>

	<script type="text/javascript">
    var sessionMessage = "<%=message != null ? message.replace("\"", "\\\"") : ""%>";
	</script>

	<script src="createAccount.js"></script>
</body>

</html>
