<%@page import="com.info.MysoreMart.Model.CartDetails"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping Cart</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<c:url value='/css/cart.css'/>" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
	var baseUrl = "<c:url value='/remove'/>";
	var baseUrl1 = "<c:url value='/increaseQuantity'/>"
	var baseUrl2 = "<c:url value='/decreaseQuantity'/>";
	var baseUrl4 = "<c:url value='/logout'/>";
</script>
<style>
#remove-alert {
	position: fixed;
	top: 20px;
	left: 50%;
	transform: translateX(-50%);
	z-index: 1050;
	width: auto;
	padding: 10px 20px;
	background-color: rgba(255, 182, 193, 0.8);
	color: darkred;
	border-radius: 5px;
}
</style>
</head>
<body>
	<%
	List<CartDetails> cartItems = (List<CartDetails>) request.getAttribute("cartItems");
	int itemCount = (cartItems != null) ? cartItems.size() : 0;
	%>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container">
			<a class="navbar-brand" href="/MysoreMart/"> <img
				src="images/product/mart.png" alt="Bootstrap" width="200"
				height="75">
			</a>
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0 d-flex align-items-center">
				<!-- Login/Signup Button -->
				<a class="nav-link" href="login" id="loginSignupLink">
					<button id="loginBtn" type="button"
						class="btn btn-outline-dark login-signup-btn">Login/SignUp</button>
				</a>

				<!-- Hello Button with Dropdown (Initially hidden) -->
				<li class="nav-item dropdown" id="helloUser" style="display: none;">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Hello, User </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item"
							href="<c:url value='/userDashboard'/>">Dashboard</a></li>
						<li><a class="dropdown-item" href="#contact">Contact Us</a></li>
						<li><a class="dropdown-item" href="logout" id="logoutBtn">Logout</a></li>
					</ul>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="/MysoreMart/cart" style="position: relative;"> <i
						class="bi bi-cart4 text-danger fs-2"></i> <span class="badge item"
						id="cart-item-count-nav"><%=itemCount%></span>
				</a></li>
			</ul>
		</div>
	</nav>

	<main class="container py-5">

		<div id="remove-alert" class="alert alert-danger" role="alert"
			style="display: none;">Item has been removed from cart</div>
		<section class="text-center" id="cart">
			<h1 class="title">Shopping Cart</h1>

			<p class="item" id="cart-item-count"><%=itemCount%>
			</p>
		</section>
		<section id="card-sec">
			<div class="row mt-4">
				<div class="col-md-8">
					<div class="card">
						<div class="card-body">
							<div id="cart-items">
								<%
								if (cartItems != null && !cartItems.isEmpty()) {
									for (CartDetails item : cartItems) {
								%>
								<div class="d-flex align-items-center mb-1  product py-3"
									data-price="<%=item.getPrice()%>"
									data-cart-id="<%=item.getId()%>">
									<img src="<%=item.getImgUrl()%>" class="img-fluid"
										alt="<%=item.getProductName()%>"
										style="height: 130px; width: 130px; object-fit: cover; margin-right: 15px;">
									<div class="flex-grow-1">
										<h5 class="card-title mb-1"><%=item.getProductName()%></h5>
										<span class="text-secondary" style="font-size: 18px;"><%=item.getSelectedQuantity()%></span>
										<p class="card-text mb-1">
											&#8377;<span class="item-price"><%=item.getPrice()%></span>
										</p>
										<div class="d-flex align-items-center">
											<button class="btn btn-outline-success me-2 decrease-qty"
												data-cart-id="<%=item.getId()%>">
												<i class="bi bi-dash" title="Decrease Quantity"></i>
											</button>
											<input type="number" value="<%=item.getQuanCount()%>" min="1"
												class="form-control w-25 me-2 quantity" />
											<button class="btn btn-outline-success ms-2 increase-qty"
												data-cart-id="<%=item.getId()%>">
												<i class="bi bi-plus" title="Increase Quantity"></i>
											</button>
										</div>
									</div>
									<button class="btn btn-danger ms-2 remove-item"
										data-cart-id="<%=item.getId()%>">Remove</button>
								</div>
								<%
								}
								}
								%>
							</div>

						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card mb-4 shadow border-light">
						<div class="card-body">
							<h4 class="card-title text-center">Bill Details</h4>
							<hr>
							<h5 class="d-flex justify-content-between align-items-center">
								<span>Subtotal:</span> <span>&#8377;<span id="subtotal">0.00</span></span>
							</h5>
							<h5 class="d-flex justify-content-between align-items-center">
								<span>GST (5%):</span> <span>&#8377;<span id="gst">0.00</span></span>
							</h5>
							<h5 class="d-flex justify-content-between align-items-center">
								<strong>Delivery Charges:</strong> <span id="delivery-charges">
									<span id="delivery-fee" style="font-size: smaller;">&#8377;<span
										id="delivery-fee-value">30.00</span></span> <span id="free-label"
									class="text-muted" style="font-size: smaller; display: none;">free</span>
								</span>
							</h5>
							<h5 class="d-flex justify-content-between align-items-center">
								<strong>Total:</strong> <strong>&#8377;<span
									id="cart-total">0.00</span></strong>
							</h5>
							<hr>
							<button class="btn btn-success w-100" id="checkout-button" >Checkout</button>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="empty-cart" class="container py-5 text-center"
			style="display: none;">
			<h1 class="title">Cart is Empty</h1>
			<i class="bi bi-cart-x" style="font-size: 4rem;"></i>
			<p class="item">You have no items in your cart.</p>
		</section>
	</main>
	<footer class="bg-dark py-3 mt-5">
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
	<script src="<c:url value='/js/cart.js'/>"></script>
	<script src="<c:url value='/js/userProfile/userLogin.js'/>"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
