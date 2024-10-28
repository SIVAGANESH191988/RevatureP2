<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Authentication Page</title>
<link rel="stylesheet" href="authentication.css">
</head>
<body>

    <div id="alertContainer" class="alert alert-danger alert-dismissible fade" role="alert" style="display: <%=(session.getAttribute("alertMessage") == null) ? "none" : "block" %>;">
        <strong></strong> <span>${sessionScope.alertMessage}</span>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close" onclick="this.parentElement.style.display='none';">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>

        
<div id="container" class="container">
		<!-- FORM SECTION -->
		
		<div class="row">
			<!-- SIGN UP -->
			<div class="col align-items-center flex-col sign-up">
				<div class="form-wrapper align-items-center">
				<form action="${pageContext.request.contextPath}/registerBuyer" method="post">
					<div class="form sign-up">
						<div class="input-group">
							<i class='bx bxs-user'></i>
							<input type="text" placeholder="Username" name= "name">
						</div>
						<div class="input-group">
							<i class='bx bx-mail-send'></i>
							<input type="email" placeholder="Email" name="email">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i>
							<input type="password" placeholder="Password" name="password">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i>
							<input type="password" placeholder="Confirm password">
						</div>
						<div class="input-group">
							<i class='bx bxs-user'></i>
							<input type="text" placeholder="conact" name= "contactNo">
						</div>
						<div class="input-group">
							<i class='bx bxs-user'></i>
							<input type="text" placeholder="city" name= "city">
						</div>
						<button type="submit">
							Sign up
						</button>
						<p>
							<span>
								Already have an account?
							</span>
							<b onclick="toggle()" class="pointer">
								Sign in here
							</b>
						</p>
					</div>
					</form>
				</div>
			</div>
		
			<!-- END SIGN UP -->
			<!-- SIGN IN -->
			<div class="col align-items-center flex-col sign-in">
				<div class="form-wrapper align-items-center">
				<form action="${pageContext.request.contextPath}/loginBuyer" method="post">
					<div class="form sign-in">
						<div class="input-group">
							<i class='bx bxs-user'></i>
							<input type="email" placeholder="Email" name="email">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i>
							<input type="password" placeholder="Password" name="password">
						</div>
						<button>
							Sign in
						</button>
						<p>
							<b>
								Forgot password?
							</b>
						</p>
						<p>
							<span>
								Don't have an account?
							</span>
							<b onclick="toggle()" class="pointer">
								Sign up here
							</b>
						</p>
					</div>
					</form>
				</div>
				<div class="form-wrapper">
		
				</div>
			</div>
			<!-- END SIGN IN -->
		</div>
		<!-- END FORM SECTION -->
		<!-- CONTENT SECTION -->
		<div class="row content-row">
			<!-- SIGN IN CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="text sign-in">
					<h2>				

						Welcome
						
					</h2>
					
	
				</div>
				<div class="img sign-in">
		<img src="IMAGES/LOGO.png">
				</div>
			</div>
			<!-- END SIGN IN CONTENT -->
			<!-- SIGN UP CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="img sign-up">
				<img src="IMAGES/LOGO.png" >
				</div>
				<div class="text sign-up">
					<h2>
					
						Join with us
					</h2>
	
				</div>
			</div>
			<!-- END SIGN UP CONTENT -->
		</div>
		<!-- END CONTENT SECTION -->
	</div>
	<script src="authentication.js"></script>
	<script>
    $(document).ready(function() {
        if ("${not empty sessionScope.alertMessage}") {
            alert("${sessionScope.alertMessage}");
        }
    });
	</script>
</body>
</html>