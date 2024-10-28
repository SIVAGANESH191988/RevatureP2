<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Seller - REVSHOP</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link href="assets/img/LOGO.png" rel="icon">
<link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet" href="mainpage.css">
</head>
<body class="index-page">
	<header id="header" class="header d-flex align-items-center sticky-top">
		<div
			class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">
			<a href="index.html" class="logo d-flex align-items-center">
				<h1 class="sitename">REVSHOP</h1>
			</a>
			<nav id="navmenu" class="navmenu">
				<ul>
					<li><a href="#sellOnline" class="active">Sell Online</a></li>
					<li><a href="#aboutREVSHOP">About</a></li>
					<li><a href="#topClients">Clients</a></li>
					<li><a href="#services">Services</a></li>
					<!--    <li><a onclick="window.location.href='login.jsp'">Login</a></li> -->
					<li><a href="login.jsp" class="btn btn-primary"
						style="background-color: transparent; border-color: #fff; margin-top: -7px;">Login</a></li>
				</ul>
				<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
			</nav>
		</div>
	</header>



	<main class="main">
		<section id="sellOnline" class="hero section light-background">
			<div class="container">
				<div class="row gy-4">
					<div
						class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center text-center text-md-start"
						data-aos="fade-up">
						<h2>Boost Your Sales with Revshop</h2>
						<p>Join a vibrant community of sellers and unlock your
							business potential. Our platform simplifies online selling,
							making it easier than ever to reach customers and grow your
							brand.</p>
						<div
							class="d-flex mt-4 justify-content-center justify-content-md-start">
							<a href="#about"
								onclick="window.location.href='createAccount.jsp'"
								class="cta-btn">Start Selling Today</a> <a href="#services"
								class="cta-btn-outline ms-3">Explore Our Services</a>
						</div>
					</div>
					<div class="col-lg-6 order-1 order-lg-2 hero-img"
						data-aos="zoom-out" data-aos-delay="100">
						<img src="IMAGES/hero-img.png" class="img-fluid animated"
							alt="Revshop Selling Platform">
					</div>
				</div>
			</div>
		</section>
		<section id="Grow" class="stats section light-background">

			<img src="IMAGES/stats-bg.png" alt="" data-aos="fade-in">

			<div class="container position-relative" data-aos="fade-up"
				data-aos-delay="100">

				<div class="row gy-4">

					<div class="col-lg-3 col-md-6">
						<div class="stats-item text-center w-100 h-100">
							<i class="fas fa-handshake"
								style="font-size: 3rem; color: #ac914a; margin-bottom: 10px;"></i>
							<p>
								<b>7 days secure & regular payments</b>
							</p>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="stats-item text-center w-100 h-100">
							<i class="fa fa-angle-double-down"
								style="font-size: 3rem; color: #ac914a; margin-bottom: 10px;"></i>
							<p></p>
							<p>
								<b>Low cost of doing projects</b>
							</p>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="stats-item text-center w-100 h-100">
							<i class="fas fa-phone-volume"
								style="font-size: 3rem; color: #ac914a; margin-bottom: 10px;"></i>
							<p>
								<b>One click Seller Support</b>
							</p>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="stats-item text-center w-100 h-100">
							<i class="fas fa-shopping-bag"
								style="font-size: 3rem; color: #ac914a; margin-bottom: 10px;"></i>
							<p>
								<b>Access to Big Billion Days & more</b>
							</p>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- About Section -->
		<section id="aboutREVSHOP" class="about section">
			<div class="container">
				<div class="row gy-4">
					<div class="col-lg-6 position-relative" data-aos="fade-up"
						data-aos-delay="100">
						<img src="IMAGES/LOGO.png" class="img-fluid" alt="Revshop Team">
						<!-- <a href="https://www.youtube.com/watch?v=Y7f98aduVJ8" class="glightbox pulsating-play-btn"></a> -->
					</div>
					<div
						class="col-lg-6 ps-lg-4 content d-flex flex-column justify-content-center"
						data-aos="fade-up" data-aos-delay="200">
						<h3>About Revshop</h3>
						<p>At Revshop, we empower sellers to reach their full
							potential in the online marketplace. Our platform simplifies
							product listing, shipping, and customer engagement, enabling you
							to focus on growing your business.</p>
						<ul>
							<li><i class="bi bi-diagram-3"></i>
								<div>
									<h5>Seamless Product Listing</h5>
									<p>Effortlessly register and manage your products with our
										user-friendly interface.</p>
								</div></li>
							<li><i class="bi bi-fullscreen-exit"></i>
								<div>
									<h5>Reliable Shipping Solutions</h5>
									<p>Choose from various shipping options to ensure timely
										delivery to your customers.</p>
								</div></li>
							<li><i class="bi bi-broadcast"></i>
								<div>
									<h5>Comprehensive Support</h5>
									<p>Our dedicated support team is always available to assist
										you with any questions or concerns.</p>
								</div></li>
							<li><i class="bi bi-graph-up"></i>
								<div>
									<h5>Tools for Growth</h5>
									<p>Access valuable insights and tools to optimize your
										sales strategy and increase revenue.</p>
								</div></li>
							<li><i class="bi bi-person-check"></i>
								<div>
									<h5>Trusted Community</h5>
									<p>Join a community of successful sellers and benefit from
										shared knowledge and experiences.</p>
								</div></li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<!-- /About Section -->

		<!-- Clients Section -->
		<section id="topClients" class="clients section">
			<div class="container section-title" data-aos="fade-up">
				<h2>Our Clients</h2>
			</div>
			<!-- End Section Title -->
			<div class="container" data-aos="fade-up" data-aos-delay="100">
				<div class="row g-0 clients-wrap">
					<div class="col-xl-3 col-md-4 client-logo">
						<img src="IMAGES/client-1.png" class="img-fluid" alt="">
					</div>
					<!-- End Client Item -->

					<div class="col-xl-3 col-md-4 client-logo">
						<img src="IMAGES/client-2.png" class="img-fluid" alt="">
					</div>
					<!-- End Client Item -->

					<div class="col-xl-3 col-md-4 client-logo">
						<img src="IMAGES/client-3.png" class="img-fluid" alt="">
					</div>
					<!-- End Client Item -->

					<div class="col-xl-3 col-md-4 client-logo">
						<img src="IMAGES/client-4.png" class="img-fluid" alt="">
					</div>
					<!-- End Client Item -->

					<div class="col-xl-3 col-md-4 client-logo">
						<img src="IMAGES/client-5.png" class="img-fluid" alt="">
					</div>
					<!-- End Client Item -->

					<div class="col-xl-3 col-md-4 client-logo">
						<img src="IMAGES/client-6.png" class="img-fluid" alt="">
					</div>
					<!-- End Client Item-->

					<div class="col-xl-3 col-md-4 client-logo">
						<img src="IMAGES/client-7.png" class="img-fluid" alt="">
					</div>
					<!-- End Client Item -->

					<div class="col-xl-3 col-md-4 client-logo">
						<img src="IMAGES/client-8.png" class="img-fluid" alt="">
					</div>
					<!-- End Client Item -->
				</div>
			</div>
		</section>
		<!-- /Clients Section -->

		<!-- Services Section -->
		<section id="services" class="services section light-background">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<h2>Our Services</h2>
				<p>Empowering sellers with top-notch services to enhance your
					online business.</p>
			</div>
			<!-- End Section Title -->

			<div class="container">

				<div class="row gy-4">

					<div class="col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="100">
						<div class="service-item position-relative">
							<div class="icon">
								<i class="bi bi-cash-stack" style="color: #0dcaf0;"></i>
							</div>
							<a href="service-details.html" class="stretched-link">
								<h3>List Products</h3>
							</a>
							<p>Register your products on the Revshop platform, making
								them visible to customers for easy purchase.</p>
						</div>
					</div>
					<!-- End Service Item -->

					<div class="col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="200">
						<div class="service-item position-relative">
							<div class="icon">
								<i class="bi bi-calendar4-week" style="color: #fd7e14;"></i>
							</div>
							<a href="service-details.html" class="stretched-link">
								<h3>Storage & Shipping</h3>
							</a>
							<p>Fast and reliable delivery options, ensuring your products
								reach customers in secure packaging.</p>
						</div>
					</div>
					<!-- End Service Item -->

					<div class="col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="300">
						<div class="service-item position-relative">
							<div class="icon">
								<i class="bi bi-chat-text" style="color: #20c997;"></i>
							</div>
							<a href="service-details.html" class="stretched-link">
								<h3>Grow Your Business</h3>
							</a>
							<p>Access tools and support functions designed to foster
								growth, including pricing and product recommendations.</p>
						</div>
					</div>
					<!-- End Service Item -->

					<div class="col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="400">
						<div class="service-item position-relative">
							<div class="icon">
								<i class="bi bi-credit-card-2-front" style="color: #df1529;"></i>
							</div>
							<a href="service-details.html" class="stretched-link">
								<h3>Help & Support</h3>
							</a>
							<p>Receive prompt assistance from our dedicated team,
								ensuring a smooth selling experience on Revshop.</p>
						</div>
					</div>
					<!-- End Service Item -->

					<div class="col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="500">
						<div class="service-item position-relative">
							<div class="icon">
								<i class="bi bi-globe" style="color: #6610f2;"></i>
							</div>
							<a href="service-details.html" class="stretched-link">
								<h3>Global Reach</h3>
							</a>
							<p>Expand your customer base by reaching out to a global
								audience with our platform.</p>
						</div>
					</div>
					<!-- End Service Item -->

					<div class="col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="600">
						<div class="service-item position-relative">
							<div class="icon">
								<i class="bi bi-clock" style="color: #f3268c;"></i>
							</div>
							<a href="service-details.html" class="stretched-link">
								<h3>Timely Payments</h3>
							</a>
							<p>Ensure your payments are processed quickly and securely,
								helping you manage your finances effectively.</p>
						</div>
					</div>
					<!-- End Service Item -->

				</div>

			</div>

		</section>
		<!-- /Services Section -->

	</main>

	<footer id="footer" class="footer">

		<div class="container footer-top">
			<div class="row gy-4">
				<div class="col-lg-5 col-md-12 footer-about">
					<a href="index.html" class="logo d-flex align-items-center"> <span
						class="sitename">REVSHOP</span>
					</a>
					<p>Your trusted partner for online selling. Our platform
						empowers sellers to reach new heights.</p>
					<div class="social-links d-flex mt-4">
						<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i
							class="bi bi-facebook"></i></a> <a href=""><i
							class="bi bi-instagram"></i></a> <a href=""><i
							class="bi bi-linkedin"></i></a>
					</div>
				</div>

				<div class="col-lg-2 col-6 footer-links">
					<h4>Useful Links</h4>
					<ul>
						<li><a href="#">Home</a></li>
						<li><a href="#">About us</a></li>
						<li><a href="#">Services</a></li>
						<li><a onclick="window.location.href='Terms&Conditions.jsp'">Terms
								of service</a></li>
						<li><a href="#">Privacy policy</a></li>
					</ul>
				</div>

				<div class="col-lg-2 col-6 footer-links">
					<h4>Support</h4>
					<ul>
						<li><a href="#">Help & Support</a></li>
						<li><a href="https://wa.me/9494075192" target="_blank">Chat
								with Us</a></li>
					</ul>
				</div>

				<div
					class="col-lg-3 col-md-12 footer-contact text-center text-md-start">
					<h4>Contact Us</h4>
					<p>#3, OMR Road</p>
					<p>Perungudi, Chenani 600096</p>
					<p>TamilNadu</p>
					<p class="mt-4">
						<strong>Phone:</strong> <span>+91 9494075192</span>
					</p>
					<p>
						<strong>Email:</strong> <span>revshop@gmail.com</span>
					</p>
				</div>
			</div>
		</div>

		<div class="container copyright text-center mt-4">
			<p>
				© <span>Copyright</span> <strong class="px-1 sitename">REVSHOP</strong>
				<span>All Rights Reserved</span>
			</p>
		</div>

	</footer>

	<!-- Main JS File -->
	<script src="js/landingpage.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script src="mainpage.js"></script>
</body>
</html>