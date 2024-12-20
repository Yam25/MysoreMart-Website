<%@page import="com.info.MysoreMart.Model.CartDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="MysuruMart offers the best deals on groceries, home goods, and more. Shop now for amazing discounts and fast delivery.">

<meta name="keywords"
	content="grocery, provisions, home goods, online shopping, MysoreMart, buy online, best deals">
<meta name="robots" content="index, follow">
<title>MysoreMart - Shop the Best Deals on Groceries &
	Provisions</title>
<link rel="icon" href="images/product/mart.png" sizes="256x256"
	type="image/png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
<link href="<c:url value='/css/index.css'/>" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	var baseUrl = "<c:url value='/add'/>";
	var baseUrl4 = "<c:url value='/logout'/>";
</script>
</head>
<body>
<%
    String userFullName = (String) session.getAttribute("userFullName");
    if (userFullName == null) {
        userFullName = "User"; 
    }
%>
	<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
		<div class="container">
			<a class="navbar-brand ms-0" href="/MysoreMart/"> <img
				src="images/product/mart.png" alt="Mysore Mart" width="200"
				height="75">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Shop by
							Category </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="fruits">Fruits</a></li>
							<li><a class="dropdown-item" href="vegetables">Vegetables</a></li>
							<li><a class="dropdown-item" href="biscuits">Snacks</a></li>
							<li><a class="dropdown-item" href="dairyProducts">Dairy
									Products</a></li>
							<li><a class="dropdown-item" href="dryFruits">Dry Fruits</a></li>
							<li><a class="dropdown-item" href="spices">Spices</a></li>
							<li><a class="dropdown-item" href="Dals & Pulses">Dal/Pulses</a></li>
							<li><a class="dropdown-item" href="grocery">Wholesome
									Grains</a></li>


						</ul></li>
				</ul>
				<form class="d-flex mx-auto search-container" role="search">
					<input class="form-control fs-5 me-2" type="text"
						placeholder="Search" style="min-width: 350px;"
						onfocus="redirectToSearchPage()" /><i
						class="fas fa-search search-icon"></i>
				</form>

				<ul
					class="navbar-nav ms-auto mb-2 mb-lg-0 d-flex align-items-center">
					
					<a class="nav-link" href="login" id="loginSignupLink">
						<button id="loginBtn" type="button"
							class="btn btn-outline-dark login-signup-btn">Login/SignUp</button>
					</a>
					
					<li class="nav-item dropdown" id="helloUser" style="display: none;">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<strong style="font-size:17px;">Hello,  <%= userFullName %></strong></a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item"
								href="<c:url value='/userDashboard'/>">Dashboard</a></li>
							<li><a class="dropdown-item" href="#contact">Contact Us</a></li>
							<li><a class="dropdown-item" href="logout" id="logoutBtn">Logout</a></li>
						</ul>
					</li>

					<%
					Integer cartItemCount = (Integer) request.getAttribute("cartItemCount");
					%>

					<li class="nav-item"><a class="nav-link"
						href="/MysoreMart/cart" style="position: relative;"> <i
							class="bi bi-cart4 text-danger fs-2"></i> <%
 if (cartItemCount != null && cartItemCount > 0) {
 %> <span class="badge item" id="cart-item-count-nav"> <%=cartItemCount%>
						</span> <%
 } else {
 %> <span class="badge item" id="cart-item-count-nav"
							style="display: none;"></span> <%
 }
 %>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<main class="bg-light">
		<div id="success-alert" class="alert alert-success" role="alert"
			style="display: none;">Item has been added to cart
			successfully.</div>
		<section id="carouselExampleAutoplaying" class="carousel slide mt-3"
			data-bs-ride="carousel" data-bs-interval="1500">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="3" aria-label="Slide 4"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="4" aria-label="Slide 5"></button>
			</div>
			<div class="carousel-inner col-6 col-md-4 col-lg-4 mb-4">
				<div class="carousel-item active">
					<img src="images/product/fruitscart.jpg"
						class="d-block w-100 c-img  img-fluid" alt="Fruits">
				</div>
				<div class="carousel-item">
					<img src="images/product/vegetables.jpg"
						class="d-block w-100 c-img img-fluid" alt="Vegetables">
				</div>
				<div class="carousel-item">
					<img src="images/product/dry.jpg"
						class="d-block w-100 c-img img-fluid"
						alt="Milk and Dairy Prodducts">
				</div>
				<div class="carousel-item">
					<img src="images/product/dal.jpg"
						class="d-block w-100 c-img  img-fluid" alt="Pulses">
				</div>
				<div class="carousel-item">
					<img
						src="images/product/Mobile Shop Ad - Made with PosterMyWall.jpg"
						class="d-block w-100 img-fluid" alt="Banner">
				</div>

			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</section>

		<section id="filter">
			<div class="category-container">

				<a href="fruits" class="category-link shadow">
					<button class="category-btn" aria-label="Fresh Fruits">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/fruits.jpg" alt="Fresh Fruits" />
							</div>
							<div class="category-text">Fruits</div>
						</div>
					</button>
				</a> <a href="dairyProducts" class="category-link shadow">
					<button class="category-btn" aria-label="Dairy Products">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/milk and dairy products.jpg"
									alt="Dairy Products" />
							</div>
							<div class="category-text">Dairy</div>
						</div>
					</button>
				</a> <a href="Dals & Pulses" class="category-link shadow">
					<button class="category-btn" aria-label="Pulses">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/pulses.jpg" alt="Pulses" />
							</div>
							<div class="category-text">Dal/Pulses</div>
						</div>
					</button>
				</a> <a href="vegetables" class="category-link shadow">
					<button class="category-btn" aria-label="Fresh Vegetables">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/veggies.jpg" alt="Fresh Vegetables" />
							</div>
							<div class="category-text">Vegetables</div>
						</div>
					</button>
				</a> <a href="biscuits" class="category-link shadow">
					<button class="category-btn" aria-label="Sip-Snack">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/snacks.jpg" alt="Sip-Snack" />
							</div>
							<div class="category-text">Sip-Snack</div>
						</div>
					</button>
				</a> <a href="dryFruits" class="category-link shadow">
					<button class="category-btn" aria-label="Dry Fruits">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/dry-fruits.jpg" alt="Dry Fruits" />
							</div>
							<div class="category-text">Dry Fruits</div>
						</div>
					</button>
				</a> <a href="grocery" class="category-link shadow">
					<button class="category-btn" aria-label="Wholesome Grains">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/grains.jpg" alt="Wholesome Grains" />
							</div>
							<div class="category-text">Grains</div>
						</div>
					</button>
				</a> <a href="spices" class="category-link shadow">
					<button class="category-btn" aria-label="Spices/Oils">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/spices.jpg" alt="Spices/Oils" />
							</div>
							<div class="category-text">Spices</div>
						</div>
					</button>
				</a>
			</div>
		</section>
		<section id="menu">

			<form action="add" method="post" id="cart-form">

				<div class="container">
					<div class="row">

						<div class="col-lg-2 col-md-3 col-sm-4 mb-4">
							<div class="card card-fruits shadow">
								<img src="images/fruits/apple.jpg" class="card-img-top"
									alt="Apples">
								<div class="card-body">
									<h5 class="card-title text-center">Apple</h5>
									<p class="card-text">Crisp, juicy, and packed with vitamins
										for a refreshing snack.</p>
									<p class="card-text">
										<strong>₹100</strong>
									</p>
									<p class=" mb-3 card-text weight">500gm</p>
									<button class="btn btn-outline-danger add-to-cart"
										data-product-name="Apple" data-product-price="100"
										data-product-quantity="500gm"
										data-product-img="images/fruits/apple.jpg">Add to
										Cart</button>
								</div>
							</div>
						</div>


						<div class="col-lg-2 col-md-3 col-sm-4 mb-4">
							<div class="card card-fruits shadow">
								<img src="images/fruits/pineapple.jpg" class="card-img-top"
									alt="Blueberries">
								<div class="card-body">
									<h5 class="card-title">Pineapple</h5>
									<p class="card-text">Pineapples are tropical fruits with a
										spiky, and sweet, tangy.</p>
									<p class="card-text">
										<strong>₹125</strong>
									</p>
									<p class=" mb-3 card-text weight">500gm</p>
									<button class="btn btn-outline-danger add-to-cart"
										data-product-name="Pineapple" data-product-price="125"
										data-product-quantity="500gm"
										data-product-img="images/fruits/pineapple.jpg">Add to
										Cart</button>
								</div>
							</div>
						</div>


						<div class="col-lg-2 col-md-3 col-sm-4 mb-4">
							<div class="card card-fruits shadow">
								<img src="images/fruits/banana.jpg" class="card-img-top"
									alt="Banana">
								<div class="card-body">
									<h5 class="card-title">Banana</h5>
									<p class="card-text">Naturally sweet, rich in potassium,
										and perfect for an energy boost!</p>
									<p class="card-text">
										<strong>₹45</strong>
									</p>
									<p class=" mb-3 card-text weight">500gm</p>
									<button class="btn btn-outline-danger add-to-cart"
										data-product-name="Banana" data-product-price="45"
										data-product-quantity="500gm"
										data-product-img="images/fruits/banana.jpg">Add to
										Cart</button>
								</div>
							</div>
						</div>


						<div class="col-lg-2 col-md-3 col-sm-4 mb-4">
							<div class="card card-veg shadow">
								<img src="images/product/cucumber1.jpg" class="card-img-top"
									alt="Cucumber">
								<div class="card-body">
									<h5 class="card-title">Cucumber</h5>
									<p class="card-text">Refreshing, crisp, and hydrating – the
										perfect summer veggie!</p>
									<p class="card-text">
										<strong>₹35</strong>
									</p>
									<p class=" mb-3 card-text weight">500gm</p>
									<button class="btn btn-outline-danger add-to-cart"
										data-product-name="Cucumber" data-product-price="35"
										data-product-quantity="500gm"
										data-product-img="images/product/cucumber1.jpg">Add
										to Cart</button>
								</div>
							</div>
						</div>


						<div class="col-lg-2 col-md-3 col-sm-4 mb-4">
							<div class="card card-veg shadow">
								<img src="images/product/tomatoes1.jpg" class="card-img-top"
									alt="Tomatoes">
								<div class="card-body">
									<h5 class="card-title">Tomatoes</h5>
									<p class="card-text">Tangy and juicy, perfect for salads,
										soups, and more!</p>
									<p class="card-text">
										<strong>₹40</strong>
									</p>
									<p class=" mb-3 card-text weight">500gm</p>
									<button class="btn btn-outline-danger add-to-cart"
										data-product-name="Tomatoes" data-product-price="40"
										data-product-quantity="500gm"
										data-product-img="images/product/tomatoes1.jpg">Add
										to Cart</button>
								</div>
							</div>
						</div>


						<div class="col-lg-2 col-md-3 col-sm-4 mb-4">
							<div class="card card-veg shadow">
								<img src="images/product/onions1.jpg" class="card-img-top"
									alt="Onions">
								<div class="card-body">
									<h5 class="card-title">Onions</h5>
									<p class="card-text">A kitchen essential, adding flavor and
										aroma to every dish.</p>
									<p class="card-text">
										<strong>₹50</strong>
									</p>
									<p class=" mb-3 card-text weight">500gm</p>
									<button class="btn btn-outline-danger add-to-cart"
										data-product-name="Onions" data-product-price="50"
										data-product-quantity="500gm"
										data-product-img="images/product/onions1.jpg">Add to
										Cart</button>
								</div>
							</div>
						</div>


					</div>
				</div>

			</form>

		</section>
	</main>

	<footer class="bg-dark py-3 mt-5 conatiner">
		<div id="contact" class="conatiner text-light text-center">
			<h4>Contact Us</h4>
			<p>Email: support@mysoremart.com</p>
			<p>Phone: +91 9988776655</p>
		</div>
		<div class="container text-light text-center">
			<a class="navbar-brand ms-0" href="#"> <img
				src="images/product/mart.png" alt="Mysore Mart" width="200"
				height="75">
			</a> <br> <small class="text-white-50">&copy; 2024
				MysoreMart. All rights reserved. </small>
			<!-- copy symbol and  white text with 50% opacity -->
		</div>
	</footer>
	<script src="<c:url value='/js/index.js'/>"></script>
	<script src="<c:url value='/js/userProfile/userLogin.js'/>"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script>
		function redirectToSearchPage() {
			window.location.href = "search";
		}
	</script>
</body>
</html>
