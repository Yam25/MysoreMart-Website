<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MysoreMart - Shop the Best Deals on Groceries &
	Provisions</title> 
<link rel="icon" href="images/product/logo 1.png" type="image/png">
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

.fruits-card {
	width: 300px;
	height: 480px;
	margin: auto;
	overflow: hidden;
	text-align: center;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
}

.fruits-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.fruits-card:hover {
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
	width: 100%;
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

.cart-icon {
	position: relative;
}

#cart-count {
	position: absolute;
	top: -10px;
	right: -10px;
	display: none;
	z-index: 10;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
<script>
    let currentPage = 1;
    const itemsPerPage = 6;

    function showPage(page) {
        const items = document.querySelectorAll('.fruit-item');
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
        const totalItems = document.querySelectorAll('.fruit-item').length;
        const totalPages = Math.ceil(totalItems / itemsPerPage);
        let paginationHtml = '';

        for (let i = 1; i <= totalPages; i++) {
            paginationHtml += `<a href="javascript:void(0);" onclick="showPage(${i})">${i}</a>`;
        }

        document.getElementById('pagination').innerHTML = paginationHtml;
        currentPage = page;
    }

    function searchFruits() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const items = document.querySelectorAll('.fruit-item');
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
    
    document.addEventListener('DOMContentLoaded', function () {
		
  	  const productContainer = document.querySelector('#menu'); 

  	  if (productContainer) {
  	    productContainer.addEventListener('change', function (event) {
  	      
  	      if (event.target && event.target.tagName.toLowerCase() === 'select') {
  	        const selectedOption = event.target.options[event.target.selectedIndex];
  	        const price = selectedOption.getAttribute('data-price');
  	        const priceElement = event.target.closest('.card-body').querySelector('strong');
  	        
  	        if (priceElement) {
  	          priceElement.textContent = `₹${price}`;
  	        }
  	      }
  	    });

  	    
  	    const selectElements = productContainer.querySelectorAll('select');
  	    selectElements.forEach(function (select) {
  	      const selectedOption = select.options[select.selectedIndex];
  	      const priceElement = select.closest('.card-body').querySelector('strong');
  	      const price = selectedOption.getAttribute('data-price');
  	      if (priceElement) {
  	        priceElement.textContent = `₹${price}`;
  	      }
  	    });
  	  }
  	});
</script>
<script>
        // Define the base URL for AJAX requests
        var baseUrl = "<c:url value='/add'/>";
    </script>
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container">
			<a class="navbar-brand ms-0" href="index"> <img
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
							<li><a class="dropdown-item" href="vegetable">Vegetables</a></li>
							<li><a class="dropdown-item" href="biscuits">Sip-Snack</a></li>
							<li><a class="dropdown-item" href="dairyProducts">Dairy
									Products</a></li>
							<li><a class="dropdown-item" href="dryFruits">Dry Fruits</a></li>
							<li><a class="dropdown-item" href="spices">Spices/Oils</a></li>
							<li><a class="dropdown-item" href="dal-pulses">Dal/Pulses</a></li>
							<li><a class="dropdown-item" href="grocery">Wholesome
									Grains</a></li>
						</ul></li>
				</ul>
				<ul
					class="navbar-nav ms-auto mb-2 mb-lg-0 d-flex align-items-center">
					<!-- Added d-flex and align-items-center -->
					<li class="nav-item"><a class="nav-link" href="login.jsp">
							<button type="button" class="btn btn-outline-dark">Login/SignUp</button>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/MysoreMart/cart" style="position: relative;"> <i
							class="bi bi-cart4 text-danger fs-2"></i> <span id="cart-count"
							class="badge bg-danger" style="display: none;">0</span>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="success-alert" class="alert alert-success" role="alert"
		style="display: none;">Item has been added to cart successfully.
	</div>

	<div class="text-center mb-4">
		<div class="search-container w-50 d-inline">
			<input type="text" id="searchInput" class="form-control"
				placeholder="Search fruits by name..." onkeyup="searchFruits()">
			<i class="fas fa-search search-icon"></i>
		</div>
	</div>


	<form action="add" method="post" id="cart-form">
		<div id="menu" class="container mt-5">
			<h2 class="text-center mb-4">Fresh Fruits</h2>
			<div class="row">
				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/orange.jpg" class="card-img-top"
							alt="Orange">
						<div class="card-body">
							<h5 class="card-title">Orange</h5>
							<p class="card-text">Oranges are one of the most popular
								citrus fruits, bright orange skin and juicy, Rich in vitamin C.</p>
							<p class="card-text">
								<strong>&#8377;40</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="40">500g - ₹40</option>
									<option value="1kg" data-price="80">1kg - ₹80</option>
									<option value="2kg" data-price="160">2kg - ₹160</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/apple.jpg" class="card-img-top"
							alt="Apple">
						<div class="card-body">
							<h5 class="card-title">Apple</h5>
							<p class="card-text">A sweet, crunchy fruit available in many
								varieties, high in fiber and antioxidants.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="100">500g - ₹100</option>
									<option value="1kg" data-price="200">1kg - ₹200</option>
									<option value="2kg" data-price="400">2kg - ₹400</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/banana.jpg" class="card-img-top"
							alt="Banana">
						<div class="card-body">
							<h5 class="card-title">Banana</h5>
							<p class="card-text">A soft, sweet tropical fruit Rich in
								potassium and a quick energy booster.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="45">500g - ₹45</option>
									<option value="1kg" data-price="90">1kg - ₹90</option>
									<option value="2kg" data-price="180">2kg - ₹180</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/strawberry.jpg"
							class="card-img-top" alt="Strawberry">
						<div class="card-body">
							<h5 class="card-title">Strawberry</h5>
							<p class="card-text">A small, red berry with a sweet,
								slightly tangy flavor, high in vitamin C Sweet and tangy.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="80">500g - ₹80</option>
									<option value="1kg" data-price="160">1kg - ₹160</option>
									<option value="2kg" data-price="320">2kg - ₹320</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/grapes.jpg" class="card-img-top"
							alt="Grapes">
						<div class="card-body">
							<h5 class="card-title">Grapes</h5>
							<p class="card-text">Small, round fruits that can be sweet or
								tart, often eaten fresh or used to make wine.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="25">500g - ₹25</option>
									<option value="1kg" data-price="50">1kg - ₹50</option>
									<option value="2kg" data-price="100">2kg - ₹100</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/mango.jpg" class="card-img-top"
							alt="Mango">
						<div class="card-body">
							<h5 class="card-title">Mango</h5>
							<p class="card-text">A tropical stone fruit known for its
								juicy, sweet flavor and vibrant color.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="75">500g - ₹75</option>
									<option value="1kg" data-price="150">1kg - ₹150</option>
									<option value="2kg" data-price="300">2kg - ₹300</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/pineapple.jpg"
							class="card-img-top" alt="Pineapple">
						<div class="card-body">
							<h5 class="card-title">Pineapple</h5>
							<p class="card-text">Pineapples are tropical fruits with a
								spiky, rough exterior and sweet, tangy flesh inside.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="40">500g - ₹40</option>
									<option value="1kg" data-price="80">1kg - ₹80</option>
									<option value="2kg" data-price="160">2kg - ₹160</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/peach.jpg" class="card-img-top"
							alt="Peach">
						<div class="card-body">
							<h5 class="card-title">Peach</h5>
							<p class="card-text">A juicy stone fruit with a fuzzy skin
								and sweet, fragrant flesh. Juicy and fragrant, perfect for
								desserts.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="45">500g - ₹45</option>
									<option value="1kg" data-price="90">1kg - ₹90</option>
									<option value="2kg" data-price="180">1kg - ₹180</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/kiwi.jpg" class="card-img-top"
							alt="Kiwi">
						<div class="card-body">
							<h5 class="card-title">Kiwi</h5>
							<p class="card-text">A small, brown, fuzzy fruit with bright
								green flesh and tiny black seeds, known for its tart flavor.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="300">500g - ₹300</option>
									<option value="1kg" data-price="600">1kg - ₹600</option>
									<option value="2kg" data-price="1200">2kg - ₹1200</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/cherry.jpg" class="card-img-top"
							alt="Cherry">
						<div class="card-body">
							<h5 class="card-title">Cherry</h5>
							<p class="card-text">A small, round stone fruit that can be
								sweet or sour, typically red or yellow, Sweet and juicy.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="100">500g - ₹100</option>
									<option value="1kg" data-price="200">1kg - ₹200</option>
									<option value="2kg" data-price="400">2kg - ₹400</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/watermelon.jpg"
							class="card-img-top" alt="Watermelon">
						<div class="card-body">
							<h5 class="card-title">Watermelon</h5>
							<p class="card-text">A large, juicy fruit with a green rind
								and sweet, red or pink flesh full of water.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="20">500g - ₹20</option>
									<option value="1kg" data-price="40">1kg - ₹40</option>
									<option value="2kg" data-price="80">2kg - ₹80</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/pear.jpg" class="card-img-top"
							alt="Pear">
						<div class="card-body">
							<h5 class="card-title">Pear</h5>
							<p class="card-text">A sweet, soft fruit with a smooth, often
								green or yellow skin and a slightly grainy texture.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="30">500g - ₹30</option>
									<option value="1kg" data-price="60">1kg - ₹60</option>
									<option value="2kg" data-price="120">2kg - ₹120</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/plum.jpg" class="card-img-top"
							alt="Plum">
						<div class="card-body">
							<h5 class="card-title">Plum</h5>
							<p class="card-text">A small, round stone fruit that can be
								sweet or tart with smooth, reddish or purple skin.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="25">500g - ₹25</option>
									<option value="1kg" data-price="50">1kg - ₹50</option>
									<option value="2kg" data-price="100">2kg - ₹100</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/apricot.jpg" class="card-img-top"
							alt="Apricot">
						<div class="card-body">
							<h5 class="card-title">Apricot</h5>
							<p class="card-text">Apricots are small, round fruits with
								smooth, orange skin and a soft, sweet, slightly tart flesh.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="180">500g - ₹180</option>
									<option value="1kg" data-price="360">1kg - ₹360</option>
									<option value="2kg" data-price="720">2kg - ₹720</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/fig.jpg" class="card-img-top"
							alt="Fig">
						<div class="card-body">
							<h5 class="card-title">Fig</h5>
							<p class="card-text">A small, pear-shaped fruit with a sweet,
								honey-like taste and soft texture.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="25">500g - ₹25</option>
									<option value="1kg" data-price="50">1kg - ₹50</option>
									<option value="2kg" data-price="100">2kg - ₹100</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/guava.jpg" class="card-img-top"
							alt="Guava">
						<div class="card-body">
							<h5 class="card-title">Guava</h5>
							<p class="card-text">A tropical fruit with a sweet flavor,
								often pink or white inside, and a grainy texture.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="25">500g - ₹25</option>
									<option value="1kg" data-price="50">1kg - ₹50</option>
									<option value="2kg" data-price="100">2kg - ₹100</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/avocado.jpg" class="card-img-top"
							alt="Avocado">
						<div class="card-body">
							<h5 class="card-title">Avocado</h5>
							<p class="card-text">A creamy, green fruit with a rich
								texture and mild, slightly nutty flavor, high in healthy fats.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="190">500g - ₹190</option>
									<option value="1kg" data-price="1200">1kg - ₹380</option>
									<option value="2kg" data-price="760">2kg - ₹760</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 fruit-item">
					<div class="card fruits-card">
						<img src="images/product/fruits/dragon-fruit.jpg"
							class="card-img-top" alt="Dragonfruit">
						<div class="card-body">
							<h5 class="card-title">Dragonfruit</h5>
							<p class="card-text">A vibrant, tropical fruit with pink or
								yellow skin and white or red flesh speckled with tiny seeds.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="150">500g - ₹150</option>
									<option value="1kg" data-price="300">1kg - ₹300</option>
									<option value="2kg" data-price="600">2kg - ₹600</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<div class="pagination-container" id="pagination"></div>

	<footer class="text-center mt-5">
		<p>Enjoy Nature's Fresh Fruits!</p>
		<p>
			<a href="index" class="text-success">Go back to Home</a>
		</p>
	</footer>

	<footer class="bg-dark py-3 mt-3">
		<div id="contact" class="conatiner text-light text-center">
			<h4>Contact Us</h4>
			<p>Email: support@mysoremart.com</p>
			<p>Phone: +91 9988776655</p>
		</div>
		<div class="container text-light text-center">
			<a class="navbar-brand ms-0" href="index"> <img
				src="images/product/mart.png" alt="Mysore Mart" width="200"
				height="75">
			</a> <br> <small class="text-white-50">&copy; 2024
				MysoreMart. All rights reserved. </small>
			<!-- copy symbol and  white text with 50% opacity -->
		</div>
	</footer>
	<script src="<c:url value='/js/index.js'/>"></script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
