<%@page import="com.info.MysoreMart.Model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MysoreMart - Shop the Best Deals on Groceries &
	Provisions</title>
<link rel="icon" href="images/product/mart.png" type="image/png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f8f9fa;
}

body {
	background-size: cover;
	background-position: center;
	color: #333;
}

.dryfruit-card {
	width: 300px;
	height: 460px;
	margin: auto;
	overflow: hidden;
	text-align: center;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
}

.dryfruit-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.dryfruit-card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

footer {
	margin-top: 40px;
	font-weight: bold;
}

.btn {
	transition: background-color 0.3s, transform 0.2s;
}

.btn:hover {
	transform: scale(1.25);
}

input[type="text"] {
	width: 80%;
	padding: 10px;
	margin: 10px 0;
	border: flex;
	border-radius: 5px;
	background-color: #ffffff;
	color: #444;
	font-size: 16px;
}

.search-container {
	position: relative;
	width: 80%;
	max-width: 800px;
	margin: 0 auto;
}

#searchInput {
	width: 100%;
	padding: 10px 15px 10px 15px;
	padding-right: 40px;
	font-size: 1rem;
	border: 1px solid #ddd;
	outline: none;
	transition: box-shadow 0.3s ease;
}

#searchInput:focus {
	box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
	border-color: #007bff;
}

#searchInput::placeholder {
	color: #aaa;
}

.search-icon {
	position: absolute;
	top: 50%;
	right: 15px;
	transform: translateY(-50%);
	color: #aaa;
	font-size: 1rem;
}

.pagination-container {
	text-align: center;
	margin-top: 20px;
}

.pagination-container a {
	padding: 8px 15px;
	margin: 0 5px;
	border: 1px solid #ddd;
	border-radius: 5px;
	color: #007bff;
	text-decoration: none;
}

.pagination-container a:hover {
	background-color: #007bff;
	color: white;
}

#success-alert {
	position: fixed;
	top: 20px;
	left: 50%;
	transform: translateX(-50%);
	z-index: 1050;
	width: auto;
	padding: 10px 20px;
	background-color: rgba(144, 238, 144, 0.8);
	color: darkgreen;
	border-radius: 5px;
}

#cart-item-count-nav {
	position: absolute;
	top: -5px;
	right: -5px;
	background-color: red;
	color: white;
	padding: 5px 10px;
	border-radius: 50%;
	font-size: 14px;
	font-weight: bold;
	display: inline-block;
	min-width: 20px;
	text-align: center;
}
</style>

<script>
    let currentPage = 1;
    const itemsPerPage = 6;

    function showPage(page) {
        const items = document.querySelectorAll('.dryfruit-item');
        const start = (page - 1) * itemsPerPage;
        const end = start + itemsPerPage;

        items.forEach((item, index) => {
            if (index >= start && index < end) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });

        updatePagination(page);
    }

    function updatePagination(page) {
        const totalItems = document.querySelectorAll('.dryfruit-item').length;
        const totalPages = Math.ceil(totalItems / itemsPerPage);
        let paginationHtml = '';

        for (let i = 1; i <= totalPages; i++) {
            paginationHtml += `<a href="javascript:void(0);" onclick="showPage(${i})">${i}</a>`;
        }

        document.getElementById('pagination').innerHTML = paginationHtml;
        currentPage = page;
    }

    function searchDryFruits() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const items = document.querySelectorAll('.dryfruit-item');
        items.forEach(item => {
            const title = item.querySelector('.card-title').textContent.toLowerCase();
            if (title.includes(searchInput)) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });

        updatePagination(currentPage);
    }

    window.onload = function() {
        showPage(1);
    };
    	
</script>
<script>
        // Define the base URL for AJAX requests
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
							<li><a class="dropdown-item" href="biscuits">Sip-Snack</a></li>
							<li><a class="dropdown-item" href="dairyProducts">Dairy
									Products</a></li>
							<li><a class="dropdown-item" href="spices">Spices/Oils</a></li>
							<li><a class="dropdown-item" href="Dals & Pulses">Dal/Pulses</a></li>
							<li><a class="dropdown-item" href="grocery">Wholesome
									Grains</a></li>
						</ul></li>
				</ul>

				<ul
					class="navbar-nav ms-auto mb-2 mb-lg-0 d-flex align-items-center">
					<a class="nav-link" href="login" id="loginSignupLink">
						<button id="loginBtn" type="button"
							class="btn btn-outline-dark login-signup-btn">Login/SignUp</button>
					</a>

					<li class="nav-item dropdown" id="helloUser" style="display: none;">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<strong style="font-size:17px;">Hello,  <%= userFullName %></strong> </a>
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

	<div id="success-alert" class="alert alert-success" role="alert"
		style="display: none;">Item has been added to cart successfully.
	</div>

	<div class="text-center mb-4">
		<div class="search-container">
			<input type="text" id="searchInput" class="form-control"
				placeholder="Search dry fruits by name..."
				onkeyup="searchDryFruits()"> <i
				class="fas fa-search search-icon"></i>
		</div>
	</div>
	
	<form action="add" method="post" id="cart-form">
		<div id="menu" class="container mt-5">
			<h2 class="text-center mb-4">Fresh Dry Fruits</h2>
			<div class="row">

				<%
				List<Product> productItems = (List<Product>) request.getAttribute("productItems");
				for (Product prod : productItems) {
				%>

				<div class="col-md-4 mb-4 dryfruit-item">
					<div class="card dryfruit-card">
						<img src="<%=prod.getProductImage()%>" class="card-img-top"
							alt="<%=prod.getProductName()%>">
						<div class="card-body">
							<h5 class="card-title">
								<%=prod.getProductName()%>
							</h5>
							<p class="card-text">
								<%=prod.getProductDescription()%>
							</p>

							<p class="card-text">
								<strong>&#8377;<%=prod.getProductPrice()%></strong>
							</p>
							<div class="mb-3">
								<p class="card-text weight"><%=prod.getProductQuantity()%></p>
							</div>
							<button class="btn btn-outline-danger add-to-cart"
								data-product-id="<%=prod.getProductId()%>"
								data-product-name="<%=prod.getProductName()%>"
								data-product-price="<%=prod.getProductPrice()%>"
								data-product-quantity="<%=prod.getProductQuantity()%>"
								data-product-img="<%=prod.getProductImage()%>">Add to
								Cart</button>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</form>
	
	<div id="pagination" class="pagination-container"></div>

	<footer class="text-center">
		<p>Dry Fruits Mart.</p>
		<p>
			<a href="/MysoreMart/" class="text-success">Go back to Home</a>
		</p>
	</footer>

	<footer class="bg-dark py-3 mt-3">
		<div id="contact" class="conatiner text-light text-center">
			<h4>Contact Us</h4>
			<p>Email: support@mysoremart.com</p>
			<p>Phone: +91 9988776655</p>
		</div>
		<div class="container text-light text-center">
			<a class="navbar-brand ms-0" href="/MysoreMart/"> <img
				src="images/product/mart.png" alt="Mysore Mart" width="200"
				height="75">
			</a> <br> <small class="text-white-50">&copy; 2024
				MysoreMart. All rights reserved. </small>
			<!-- copy symbol and  white text with 50% opacity -->
		</div>
	</footer>
	
	<script src="<c:url value='/js/userProfile/userLogin.js'/>"></script>
	<script src="<c:url value='/js/index.js'/>"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
