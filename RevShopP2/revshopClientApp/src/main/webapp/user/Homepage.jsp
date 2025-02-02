<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Homepage - REVSHOP</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="Homepage.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container-fluid top-header">
		<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
			<div class="container">
				<a class="navbar-brand" href="#"> <img src="IMAGES/LOGO.png">
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
					<span id="menu-icon" class="fa fa-bars"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<form class="search" id="searchForm" action="" method="get">
						<input class="search-input" id="searchInput" name="query"
							type="search" placeholder="Search for products, clothes and more"
							aria-label="Search">
						<button class="search-button" type="submit">
							<i class="fa-brands fa-searchengin"></i>
						</button>
					</form>
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="myProductsDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								${not empty sessionScope.name ? sessionScope.name : 'Login'} </a>
							<ul class="dropdown-menu" aria-labelledby="myProductsDropdown">
								<li><a class="dropdown-item"
									onclick="window.location.href='Profile.jsp'"><i
										class="fa-regular fa-user" style="margin-right: 10px;"></i>Your
										Profile</a></li>
								<li><a class="dropdown-item"
									onclick="window.location.href='Profile.jsp'"><i
										class="fa-solid fa-cube" style="margin-right: 10px;"></i>Orders</a></li>
								<li><a class="dropdown-item"
									onclick="window.location.href='Profile.jsp'"><i
										class="fa-solid fa-hand-holding-heart"
										style="margin-right: 10px;"></i>Wishlist</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link"
							onclick="window.location.href='http://localhost:8084/revshopClientApp/seller/mainpage.jsp'"><i
								class="fa-brands fa-shopware" style="margin-right: 10px;"></i>Become
								a Seller</a></li>
						<li class="nav-item"><a class="nav-link"
							onclick="window.location.href='cart.jsp'"><i
								class="fa-solid fa-bag-shopping" style="margin-right: 10px;"></i>Cart</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<div class="image-container">
		<div class="image-slider">
			<a href="" class="image-item"> <img
				src="IMAGES/Category-Mobiles.png" alt="Mobiles">
				<button class="image-title">Mobiles</button>
			</a> <a href="" class="image-item"> <img
				src="IMAGES/CategoryFashion.png" alt="Fashion">
				<button class="image-title">Fashion</button>
			</a> <a href="" class="image-item"> <img
				src="IMAGES/Category-Electronics-removebg-preview.png"
				alt="Electronics">
				<button class="image-title">Electronics</button>
			</a> <a href="" class="image-item"> <img
				src="IMAGES/CategoryHome_Furniture.png" alt="Home & Furniture">
				<button class="image-title">Home & Furniture</button>
			</a> <a href="" class="image-item"> <img
				src="IMAGES/CategoryBeauty.png" alt="Beauty">
				<button class="image-title">Beauty</button>
			</a> <a href="" class="image-item"> <img
				src="IMAGES/CategoryAppliances.png" alt="Appliances">
				<button class="image-title">Appliances</button>
			</a> <a href="" class="image-item"> <img
				src="IMAGES/CategoryToys.png" alt="Toys & More">
				<button class="image-title">Toys & More</button>
			</a>
		</div>
	</div>

	<div class="container-xl">
		<div class="row">
			<div class="col-md-12">
				<h2>
					Top<b>Sales</b>
				</h2>
				<!-- Wrapper for carousel items -->
				<div class="carousel-inner">
					<div class="item carousel-item active">
						<div class="product-container d-flex flex-wrap">
							<c:forEach var="product" items="${sessionScope.products}">
								<div class="product-card"
									data-product="${product.productName.toLowerCase()}">
									<div class="thumb-wrapper">
										<span class="wish-icon"><i class="fa fa-heart-o"></i></span>
										<div class="img-box">
											<img
												src="${pageContext.request.contextPath}/IMAGES/${product.image}"
												class="img-fluid" alt="">
										</div>
										<div class="thumb-content">
											<h4>${product.productName}</h4>
											<p>${product.description}</p>

											<c:forEach var="review" items="${product.reviews}">
												<span class="star-rating"> <c:forEach begin="1"
														end="5" varStatus="i">
														<i
															class="fa <c:choose>
                                                        <c:when test="${i.index <= review.rating}">
                                                            fa-star
                                                        </c:when>
                                                        <c:otherwise>
                                                            fa-star-o
                                                        </c:otherwise>
                                                    </c:choose>"></i>
													</c:forEach>
												</span>
											</c:forEach>

											<p class="item-price">₹${product.price}</p>

											<!-- Update the href here to point to the controller -->
											<a
												href="${pageContext.request.contextPath}/productDetails?productId=${product.productId}"
												class="btn btn-primary">View more</a>

										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
						<li><a onclick="window.location.href='Terms&Conditions.jsp'">Terms
								of service</a></li>
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
	<script src="Homepage.js"></script>

	<script>
  document.getElementById('searchForm').addEventListener('submit', function(event) {
    event.preventDefault(); 
// Prevent form submission

    // Get the search input
    const query = document.getElementById('searchInput').value.toLowerCase();
    
    // Get all product cards
    const productCards = document.querySelectorAll('.product-card');

    // Show all cards initially
    productCards.forEach(card => {
      card.style.display = 'block'; 
// Reset the display
    });

    // Filter products based on the input
    productCards.forEach(card => {
      const productName = card.getAttribute('data-product');
      if (!productName.includes(query)) {
        card.style.display = 'none'; // Hide the card if it doesn't match
      }
    });
  });
</script>

</body>
</html>
