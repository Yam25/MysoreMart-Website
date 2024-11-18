<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

.atta-card {
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

.atta-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.atta-card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.rice-card {
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

.rice-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.rice-card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.oil-card {
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

.oil-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.oil-card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.sugar-card {
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

.sugar-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.sugar-card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.salt-card {
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

.salt-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.salt-card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.tea-coffee-card {
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

.tea-coffee-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.tea-coffee-card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.baking-card {
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

.baking-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.baking-card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.cereal-card {
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

.cereal-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.cereal-card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.pasta-card {
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

.pasta-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.pasta-card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.noodles-card {
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

.noodles-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.noodles-card:hover {
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
    const items = document.querySelectorAll('.product-item');
    const start = (page - 1) * itemsPerPage;
    const end = start + itemsPerPage;

    console.log('Showing page:', page); 

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
    const items = document.querySelectorAll('.product-item'); 
    const totalItems = items.length;
    const totalPages = Math.ceil(totalItems / itemsPerPage);

    console.log('Total items:', totalItems); 
    console.log('Total pages:', totalPages); 

    let paginationHtml = '';

    for (let i = 1; i <= totalPages; i++) {
        paginationHtml += `<a href="javascript:void(0);" onclick="showPage(${i})">${i}</a>`;
    }

    document.getElementById('pagination').innerHTML = paginationHtml;
    currentPage = page;
}

function searchGrocery() {
    const searchInput = document.getElementById('searchInput').value.toLowerCase();
    const items = document.querySelectorAll('.product-item');
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
							<li><a class="dropdown-item" href="fruits">Fruits</a></li>
							<li><a class="dropdown-item" href="vegetable">Vegetables</a></li>
							<li><a class="dropdown-item" href="biscuits">Snacks</a></li>
							<li><a class="dropdown-item" href="dairyProducts">Dairy
									Products</a></li>
							<li><a class="dropdown-item" href="dryFruits">Dry Fruits</a></li>
							<li><a class="dropdown-item" href="spices">Spices/Oils</a></li>
							<li><a class="dropdown-item" href="dal-pulses">Dal/Pulses</a></li>
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
				placeholder="Search grocery items by name..."
				onkeyup="searchGrocery()"> <i
				class="fas fa-search search-icon"></i>
		</div>
	</div>
	<form action="add" method="post" id="cart-form">
		<div id="menu" class="container mt-5">
			<h2 class="text-center mb-4">Grocery</h2>
			<div class="row">

				<!-- Atta -->
				<div class="col-md-4 mb-4 product-item atta-item">
					<div class="card atta-card">
						<img src="images/product/grocery/atta/wheat-atta.jpg"
							class="card-img-top" alt="Wheat Atta">
						<div class="card-body">
							<h5 class="card-title">Wheat Atta</h5>
							<p class="card-text">Finely milled wheat flour, perfect for
								making chapatis, parathas.</p>
							<p class="card-text">
								<strong>&#8377;200</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="200">500g - ₹200</option>
									<option value="1000" data-price="380">1kg - ₹380</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item atta-item">
					<div class="card atta-card">
						<img src="images/product/grocery/atta/multigrain-atta.jpg"
							class="card-img-top" alt="Multigrain Atta">
						<div class="card-body">
							<h5 class="card-title">Multigrain Atta</h5>
							<p class="card-text">A healthy blend of different grains/
								millets for nutritious chapatis.</p>
							<p class="card-text">
								<strong>&#8377;250</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="250">500g - ₹250</option>
									<option value="1000" data-price="480">1kg - ₹480</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item atta-item">
					<div class="card atta-card">
						<img src="images/product/grocery/atta/besan.jpg"
							class="card-img-top" alt="Besan (Chickpea Flour)">
						<div class="card-body">
							<h5 class="card-title">Besan (Chickpea Flour)</h5>
							<p class="card-text">Ground flour made from chickpeas, used
								for pakoras & sweets.</p>
							<p class="card-text">
								<strong>&#8377;150</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="150">500g - ₹150</option>
									<option value="1000" data-price="280">1kg - ₹280</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item atta-item">
					<div class="card atta-card">
						<img src="images/product/grocery/atta/rava.jpg"
							class="card-img-top" alt="Rava (Semolina)">
						<div class="card-body">
							<h5 class="card-title">Rava (Semolina)</h5>
							<p class="card-text">A coarse form of wheat flour, often used
								to make upma, halwa.</p>
							<p class="card-text">
								<strong>&#8377;100</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="100">500g - ₹100</option>
									<option value="1000" data-price="190">1kg - ₹190</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item atta-item">
					<div class="card atta-card">
						<img src="images/product/grocery/atta/maida.jpg"
							class="card-img-top" alt="Maida (Refined Flour)">
						<div class="card-body">
							<h5 class="card-title">Maida (Refined Flour)</h5>
							<p class="card-text">Refined wheat flour, commonly used for
								making pastries and bread.</p>
							<p class="card-text">
								<strong>&#8377;180</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="180">500g - ₹180</option>
									<option value="1000" data-price="350">1kg - ₹350</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<!-- Rice -->
				<div class="col-md-4 mb-4 product-item rice-item">
					<div class="card rice-card">
						<img src="images/product/grocery/rice/basmati-rice.jpg"
							class="card-img-top" alt="Basmati Rice">
						<div class="card-body">
							<h5 class="card-title">Basmati Rice</h5>
							<p class="card-text">Long-grain aromatic rice, perfect for
								biryanis and pilafs.</p>
							<p class="card-text">
								<strong>&#8377;350</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="350">500g - ₹350</option>
									<option value="1000" data-price="650">1kg - ₹650</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item rice-item">
					<div class="card rice-card">
						<img src="images/product/grocery/rice/sona-masuri.jpg"
							class="card-img-top" alt="Sona Masoori Rice">
						<div class="card-body">
							<h5 class="card-title">Sona Masoori Rice</h5>
							<p class="card-text">Medium-grain rice, ideal for daily
								cooking and south Indian dishes.</p>
							<p class="card-text">
								<strong>&#8377;250</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="250">500g - ₹250</option>
									<option value="1000" data-price="480">1kg - ₹480</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item rice-item">
					<div class="card rice-card">
						<img src="images/product/grocery/rice/longgrain-rice.jpg"
							class="card-img-top" alt="Long Grain Rice">
						<div class="card-body">
							<h5 class="card-title">Long Grain Rice</h5>
							<p class="card-text">Non-sticky rice, perfect for daily meals
								and pulao.</p>
							<p class="card-text">
								<strong>&#8377;220</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="220">500g - ₹220</option>
									<option value="1000" data-price="420">1kg - ₹420</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item rice-item">
					<div class="card rice-card">
						<img src="images/product/grocery/rice/parboiled-rice.jpg"
							class="card-img-top" alt="Parboiled Rice">
						<div class="card-body">
							<h5 class="card-title">Parboiled Rice</h5>
							<p class="card-text">Rice that has been partially boiled,
								less sticky after cooking.</p>
							<p class="card-text">
								<strong>&#8377;180</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="180">500g - ₹180</option>
									<option value="1000" data-price="340">1kg - ₹340</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<!-- oil -->
				<div class="col-md-4 mb-4 product-item oil-item">
					<div class="card oil-card">
						<img src="images/product/grocery/oils/sunflower-oil.jpg"
							class="card-img-top" alt="Sunflower Oil">
						<div class="card-body">
							<h5 class="card-title">Sunflower Oil</h5>
							<p class="card-text">A light, healthy cooking oil, ideal for
								frying and daily cooking.</p>
							<p class="card-text">
								<strong>&#8377;150</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="150">500ml - ₹150</option>
									<option value="1000" data-price="290">1L - ₹290</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item oil-item">
					<div class="card oil-card">
						<img src="images/product/grocery/oils/groundnut-oil.jpg"
							class="card-img-top" alt="Groundnut Oil">
						<div class="card-body">
							<h5 class="card-title">Groundnut Oil</h5>
							<p class="card-text">Rich in flavor, great for frying and
								making snacks and curries.</p>
							<p class="card-text">
								<strong>&#8377;220</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="220">500ml - ₹220</option>
									<option value="1000" data-price="430">1L - ₹430</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item oil-item">
					<div class="card oil-card">
						<img src="images/product/grocery/oils/Mustard-oil.jpg"
							class="card-img-top" alt="Mustard Oil">
						<div class="card-body">
							<h5 class="card-title">Mustard Oil</h5>
							<p class="card-text">Strongly flavored oil, commonly used in
								Indian cooking for pickles.</p>
							<p class="card-text">
								<strong>&#8377;180</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="180">500ml - ₹180</option>
									<option value="1000" data-price="350">1L - ₹350</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item oil-item">
					<div class="card oil-card">
						<img src="images/product/grocery/oils/coconut-oil.jpg"
							class="card-img-top" alt="Coconut Oil">
						<div class="card-body">
							<h5 class="card-title">Coconut Oil</h5>
							<p class="card-text">Pure, natural coconut oil, great for
								cooking and skin care.</p>
							<p class="card-text">
								<strong>&#8377;280</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="280">500ml - ₹280</option>
									<option value="1000" data-price="540">1L - ₹540</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item oil-item">
					<div class="card oil-card">
						<img src="images/product/grocery/oils/olive-oil.jpg"
							class="card-img-top" alt="Olive Oil">
						<div class="card-body">
							<h5 class="card-title">Olive Oil</h5>
							<p class="card-text">Cold-pressed, high-quality olive oil,
								ideal for salads, dressings.</p>
							<p class="card-text">
								<strong>&#8377;650</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="650">500ml - ₹650</option>
									<option value="1000" data-price="1250">1L - ₹1250</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<!-- Sugar -->
				<div class="col-md-4 mb-4 product-item sugar-item">
					<div class="card sugar-card">
						<img src="images/product/grocery/sugar/sugar.jpg"
							class="card-img-top" alt="White Sugar">
						<div class="card-body">
							<h5 class="card-title">White Sugar</h5>
							<p class="card-text">Refined sugar, ideal for daily use in
								tea, coffee, and cooking.</p>
							<p class="card-text">
								<strong>&#8377;50</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="50">500g - ₹50</option>
									<option value="1000" data-price="95">1kg - ₹95</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item sugar-item">
					<div class="card sugar-card">
						<img src="images/product/grocery/sugar/brown-sugar.jpg"
							class="card-img-top" alt="Brown Sugar">
						<div class="card-body">
							<h5 class="card-title">Brown Sugar</h5>
							<p class="card-text">Natural sugar with molasses, ideal for
								baking and making beverages.</p>
							<p class="card-text">
								<strong>&#8377;80</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="80">500g - ₹80</option>
									<option value="1000" data-price="150">1kg - ₹150</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item sugar-item">
					<div class="card sugar-card">
						<img src="images/product/grocery/sugar/jaggery.jpg"
							class="card-img-top" alt="Jaggery">
						<div class="card-body">
							<h5 class="card-title">Jaggery</h5>
							<p class="card-text">Unrefined sugar made from sugarcane
								juice.</p>
							<p class="card-text">
								<strong>&#8377;120</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="120">500g - ₹120</option>
									<option value="1000" data-price="230">1kg - ₹230</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item sugar-item">
					<div class="card sugar-card">
						<img src="images/product/grocery/sugar/powdered-sugar.jpg"
							class="card-img-top" alt="Powdered Sugar">
						<div class="card-body">
							<h5 class="card-title">Powdered Sugar</h5>
							<p class="card-text">Finely ground sugar, ideal for making
								desserts and icing.</p>
							<p class="card-text">
								<strong>&#8377;100</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="100">500g - ₹100</option>
									<option value="1000" data-price="190">1kg - ₹190</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item sugar-item">
					<div class="card sugar-card">
						<img src="images/product/grocery/sugar/coconut-sugar.jpg"
							class="card-img-top" alt="Coconut Sugar">
						<div class="card-body">
							<h5 class="card-title">Coconut Sugar</h5>
							<p class="card-text">A natural sugar alternative made from
								the sap of coconut palms.</p>
							<p class="card-text">
								<strong>&#8377;200</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="200">500g - ₹200</option>
									<option value="1000" data-price="380">1kg - ₹380</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<!-- Salt -->
				<div class="col-md-4 mb-4 product-item salt-item">
					<div class="card salt-card">
						<img src="images/product/grocery/salt/table-salt.jpg"
							class="card-img-top" alt="Table Salt">
						<div class="card-body">
							<h5 class="card-title">Table Salt</h5>
							<p class="card-text">Refined salt, ideal for regular cooking
								and table use.</p>
							<p class="card-text">
								<strong>&#8377;20</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="20">500g - ₹20</option>
									<option value="1000" data-price="35">1kg - ₹35</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item salt-item">
					<div class="card salt-card">
						<img src="images/product/grocery/salt/rock-salt.jpg"
							class="card-img-top" alt="Rock Salt">
						<div class="card-body">
							<h5 class="card-title">Rock Salt</h5>
							<p class="card-text">Unrefined salt with a natural taste,
								perfect for seasoning dishes.</p>
							<p class="card-text">
								<strong>&#8377;50</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="50">500g - ₹50</option>
									<option value="1000" data-price="95">1kg - ₹95</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item salt-item">
					<div class="card salt-card">
						<img src="images/product/grocery/salt/pink-salt.jpg"
							class="card-img-top" alt="Pink Himalayan Salt">
						<div class="card-body">
							<h5 class="card-title">Pink Himalayan Salt</h5>
							<p class="card-text">Premium quality, naturally pink salt,
								rich in minerals.</p>
							<p class="card-text">
								<strong>&#8377;150</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="150">500g - ₹150</option>
									<option value="1000" data-price="280">1kg - ₹280</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item salt-item">
					<div class="card salt-card">
						<img src="images/product/grocery/salt/sea-salt.jpg"
							class="card-img-top" alt="Sea Salt">
						<div class="card-body">
							<h5 class="card-title">Sea Salt</h5>
							<p class="card-text">Natural sea salt, harvested directly
								from evaporated seawater.</p>
							<p class="card-text">
								<strong>&#8377;120</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="120">500g - ₹120</option>
									<option value="1000" data-price="230">1kg - ₹230</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item salt-item">
					<div class="card salt-card">
						<img src="images/product/grocery/salt/black-salt.jpg"
							class="card-img-top" alt="Black Salt">
						<div class="card-body">
							<h5 class="card-title">Black Salt</h5>
							<p class="card-text">Mineral-rich salt used in Indian and
								Middle Eastern cuisine.</p>
							<p class="card-text">
								<strong>&#8377;70</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="70">500g - ₹70</option>
									<option value="1000" data-price="130">1kg - ₹130</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<!-- Tea/Coffee -->
				<div class="col-md-4 mb-4 product-item tea-coffee-item">
					<div class="card tea-coffee-card">
						<img src="images/product/grocery/coffee-tea/tea-leaves.jpg"
							class="card-img-top" alt="Tea Leaves">
						<div class="card-body">
							<h5 class="card-title">Tea Leaves</h5>
							<p class="card-text">Tea leaves for a rich, aromatic cup of
								tea, perfect for daily use.</p>
							<p class="card-text">
								<strong>&#8377;150</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="250" data-price="150">250g - ₹150</option>
									<option value="500" data-price="290">500g - ₹290</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item tea-coffee-item">
					<div class="card tea-coffee-card">
						<img src="images/product/grocery/coffee-tea/green-tea.jpg"
							class="card-img-top" alt="Green Tea">
						<div class="card-body">
							<h5 class="card-title">Green Tea</h5>
							<p class="card-text">A healthy and refreshing drink,ideal for
								weight management.</p>
							<p class="card-text">
								<strong>&#8377;200</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="100" data-price="200">100g - ₹200</option>
									<option value="200" data-price="380">200g - ₹380</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item tea-coffee-item">
					<div class="card tea-coffee-card">
						<img src="images/product/grocery/coffee-tea/instant.jpg"
							class="card-img-top" alt="Instant Coffee">
						<div class="card-body">
							<h5 class="card-title">Instant Coffee</h5>
							<p class="card-text">Quick and convenient coffee, perfect for
								an instant cup of energy.</p>
							<p class="card-text">
								<strong>&#8377;180</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="100" data-price="180">100g - ₹180</option>
									<option value="200" data-price="350">200g - ₹350</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item tea-coffee-item">
					<div class="card tea-coffee-card">
						<img src="images/product/grocery/coffee-tea/coffee-powder.jpg"
							class="card-img-top" alt="Coffee Powder">
						<div class="card-body">
							<h5 class="card-title">Coffee Powder</h5>
							<p class="card-text">Freshly ground coffee powder for a rich,
								flavorful coffee experience.</p>
							<p class="card-text">
								<strong>&#8377;250</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="100" data-price="250">100g - ₹250</option>
									<option value="200" data-price="480">200g - ₹480</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item tea-coffee-item">
					<div class="card tea-coffee-card">
						<img src="images/product/grocery/coffee-tea/assam-tea.jpg"
							class="card-img-top" alt="Assam Tea">
						<div class="card-body">
							<h5 class="card-title">Assam Tea</h5>
							<p class="card-text">Strong, malty tea from Assam, perfect
								for a bold and energizing.</p>
							<p class="card-text">
								<strong>&#8377;220</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="250" data-price="220">250g - ₹220</option>
									<option value="500" data-price="420">500g - ₹420</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<!-- Baking -->
				<div class="col-md-4 mb-4 product-item baking-item">
					<div class="card baking-card">
						<img src="images/product/grocery/baking/all-purpose.jpg"
							class="card-img-top" alt="All Purpose Flour">
						<div class="card-body">
							<h5 class="card-title">All Purpose Flour</h5>
							<p class="card-text">Versatile flour for baking cakes,
								cookies and other baked goods.</p>
							<p class="card-text">
								<strong>&#8377;40</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="40">500g - ₹40</option>
									<option value="1000" data-price="75">1kg - ₹75</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item baking-item">
					<div class="card baking-card">
						<img src="images/product/grocery/baking/yeast.jpg"
							class="card-img-top" alt="Yeast">
						<div class="card-body">
							<h5 class="card-title">Yeast</h5>
							<p class="card-text">Active dry yeast for making dough rise,
								perfect for bread and pizza.</p>
							<p class="card-text">
								<strong>&#8377;50</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="100" data-price="50">100g - ₹50</option>
									<option value="200" data-price="90">200g - ₹90</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item baking-item">
					<div class="card baking-card">
						<img src="images/product/grocery/baking/Cacao-Powder.jpg"
							class="card-img-top" alt="Cocoa Powder">
						<div class="card-body">
							<h5 class="card-title">Cocoa Powder</h5>
							<p class="card-text">Rich cocoa powder for baking chocolate
								cakes, brownies.</p>
							<p class="card-text">
								<strong>&#8377;120</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="100" data-price="120">100g - ₹120</option>
									<option value="200" data-price="230">200g - ₹230</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item baking-item">
					<div class="card baking-card">
						<img src="images/product/grocery/baking/baking-soda.jpg"
							class="card-img-top" alt="Baking Soda">
						<div class="card-body">
							<h5 class="card-title">Baking Soda</h5>
							<p class="card-text">Agent for baked goods, helping them rise
								and become light and fluffy.</p>
							<p class="card-text">
								<strong>&#8377;30</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="100" data-price="30">100g - ₹30</option>
									<option value="200" data-price="55">200g - ₹55</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item baking-item">
					<div class="card baking-card">
						<img src="images/product/grocery/baking/baking-powder.jpg"
							class="card-img-top" alt="Baking Powder">
						<div class="card-body">
							<h5 class="card-title">Baking Powder</h5>
							<p class="card-text">Baking powder that helps cakes, muffins,
								and other baked goods rise.</p>
							<p class="card-text">
								<strong>&#8377;35</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="100" data-price="35">100g - ₹35</option>
									<option value="200" data-price="65">200g - ₹65</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<!-- Cereals -->
				<div class="col-md-4 mb-4 product-item cereal-item">
					<div class="card cereal-card">
						<img src="images/product/grocery/cereals/oats.jpg"
							class="card-img-top" alt="Rolled Oats">
						<div class="card-body">
							<h5 class="card-title">Rolled Oats</h5>
							<p class="card-text">Healthy rolled oats, perfect for
								breakfast, porridge, and baking.</p>
							<p class="card-text">
								<strong>&#8377;80</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="80">500g - ₹80</option>
									<option value="1000" data-price="150">1kg - ₹150</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item cereal-item">
					<div class="card cereal-card">
						<img src="images/product/grocery/cereals/corn-flakes.jpg"
							class="card-img-top" alt="Cornflakes">
						<div class="card-body">
							<h5 class="card-title">Cornflakes</h5>
							<p class="card-text">Crunchy cornflakes, a breakfast for a
								quick and healthy.</p>
							<p class="card-text">
								<strong>&#8377;90</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="90">500g - ₹90</option>
									<option value="1000" data-price="170">1kg - ₹170</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item cereal-item">
					<div class="card cereal-card">
						<img src="images/product/grocery/cereals/rice-flakes.jpg"
							class="card-img-top" alt="Rice Flakes">
						<div class="card-body">
							<h5 class="card-title">Rice Flakes</h5>
							<p class="card-text">Light and crispy rice flakes, perfect
								for making poha, snacks.</p>
							<p class="card-text">
								<strong>&#8377;60</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="60">500g - ₹60</option>
									<option value="1000" data-price="110">1kg - ₹110</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item cereal-item">
					<div class="card cereal-card">
						<img src="images/product/grocery/cereals/barley.jpg"
							class="card-img-top" alt="Barley">
						<div class="card-body">
							<h5 class="card-title">Barley</h5>
							<p class="card-text">Nutritious barley, great for soups,
								salads, and as a rice alternative.</p>
							<p class="card-text">
								<strong>&#8377;120</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="120">500g - ₹120</option>
									<option value="1000" data-price="230">1kg - ₹230</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item cereal-item">
					<div class="card cereal-card">
						<img src="images/product/grocery/cereals/jowar.jpg"
							class="card-img-top" alt="Sorghum (Jowar)">
						<div class="card-body">
							<h5 class="card-title">Sorghum (Jowar)</h5>
							<p class="card-text">A gluten-free cereal with high fiber,
								great for making rotis, porridges.</p>
							<p class="card-text">
								<strong>&#8377;100</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="100">500g - ₹100</option>
									<option value="1000" data-price="190">1kg - ₹190</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<!-- Pasta -->
				<div class="col-md-4 mb-4 product-item pasta-item">
					<div class="card pasta-card">
						<img src="images/product/grocery/pasta/spaghetti.jpg"
							class="card-img-top" alt="Spaghetti">
						<div class="card-body">
							<h5 class="card-title">Spaghetti</h5>
							<p class="card-text">Classic Italian spaghetti, perfect for a
								delicious pasta with any sauce.</p>
							<p class="card-text">
								<strong>&#8377;150</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="150">500g - ₹150</option>
									<option value="1000" data-price="280">1kg - ₹280</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item pasta-item">
					<div class="card pasta-card">
						<img src="images/product/grocery/pasta/fusilli.jpg"
							class="card-img-top" alt="Fusilli">
						<div class="card-body">
							<h5 class="card-title">Fusilli</h5>
							<p class="card-text">Twisted, spiral-shaped pasta, ideal for
								holding sauces pasta dishes.</p>
							<p class="card-text">
								<strong>&#8377;160</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="160">500g - ₹160</option>
									<option value="1000" data-price="310">1kg - ₹310</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item pasta-item">
					<div class="card pasta-card">
						<img src="images/product/grocery/pasta/penne.jpg"
							class="card-img-top" alt="Penne">
						<div class="card-body">
							<h5 class="card-title">Penne</h5>
							<p class="card-text">Short tube-shaped pasta, perfect for
								chunky sauces and baked pasta.</p>
							<p class="card-text">
								<strong>&#8377;140</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="140">500g - ₹140</option>
									<option value="1000" data-price="270">1kg - ₹270</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item pasta-item">
					<div class="card pasta-card">
						<img src="images/product/grocery/pasta/Macaroni.jpg"
							class="card-img-top" alt="Mac and Cheese">
						<div class="card-body">
							<h5 class="card-title">Mac and Cheese</h5>
							<p class="card-text">Classic macaroni pasta, perfect for
								creamy mac and cheese recipes.</p>
							<p class="card-text">
								<strong>&#8377;130</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="130">500g - ₹130</option>
									<option value="1000" data-price="250">1kg - ₹250</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item pasta-item">
					<div class="card pasta-card">
						<img src="images/product/grocery/pasta/lasagna.jpg"
							class="card-img-top" alt="Lasagna">
						<div class="card-body">
							<h5 class="card-title">Lasagna</h5>
							<p class="card-text">Flat, wide pasta sheets, ideal for
								layering in lasagna dish.</p>
							<p class="card-text">
								<strong>&#8377;180</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="180">500g - ₹180</option>
									<option value="1000" data-price="350">1kg - ₹350</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<!-- Noodles -->
				<div class="col-md-4 mb-4 product-item noodles-item">
					<div class="card noodles-card">
						<img src="images/product/grocery/noodles/instant-noodles.jpg"
							class="card-img-top" alt="Instant Noodles">
						<div class="card-body">
							<h5 class="card-title">Instant Noodles</h5>
							<p class="card-text">Quick and easy-to-cook noodles,
								available in different flavors.</p>
							<p class="card-text">
								<strong>&#8377;20</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="70" data-price="20">70g - ₹20</option>
									<option value="140" data-price="40">140g - ₹40</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item noodles-item">
					<div class="card noodles-card">
						<img src="images/product/grocery/noodles/egg-noodles.jpg"
							class="card-img-top" alt="Egg Noodles">
						<div class="card-body">
							<h5 class="card-title">Egg Noodles</h5>
							<p class="card-text">Soft and flavorful egg noodles, perfect
								for stir-fries, soups.</p>
							<p class="card-text">
								<strong>&#8377;100</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="100">500g - ₹100</option>
									<option value="1000" data-price="190">1kg - ₹190</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item noodles-item">
					<div class="card noodles-card">
						<img src="images/product/grocery/noodles/wheat-noodles.jpg"
							class="card-img-top" alt="Whole Wheat Noodles">
						<div class="card-body">
							<h5 class="card-title">Whole Wheat Noodles</h5>
							<p class="card-text">Healthy whole wheat noodles for a
								nutritious, low-glycemic meal.</p>
							<p class="card-text">
								<strong>&#8377;120</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="120">500g - ₹120</option>
									<option value="1000" data-price="230">1kg - ₹230</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item noodles-item">
					<div class="card noodles-card">
						<img src="images/product/grocery/noodles/ramen.jpg"
							class="card-img-top" alt="Ramen Noodles">
						<div class="card-body">
							<h5 class="card-title">Ramen Noodles</h5>
							<p class="card-text">Classic Japanese ramen noodles, perfect
								for soups and broths.</p>
							<p class="card-text">
								<strong>&#8377;180</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="180">500g - ₹180</option>
									<option value="1000" data-price="350">1kg - ₹350</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item noodles-item">
					<div class="card noodles-card">
						<img src="images/product/grocery/noodles/maggi.jpg"
							class="card-img-top" alt="Maggi Noodles">
						<div class="card-body">
							<h5 class="card-title">Maggi Noodles</h5>
							<p class="card-text">Maggi instant noodles, a popular choice
								for a quick meal.</p>
							<p class="card-text">
								<strong>&#8377;15</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="70" data-price="15">70g - ₹15</option>
									<option value="140" data-price="30">140g - ₹30</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 product-item noodles-item">
					<div class="card noodles-card">
						<img src="images/product/grocery/noodles/yippee.jpg"
							class="card-img-top" alt="Yippee Noodles">
						<div class="card-body">
							<h5 class="card-title">Yippee Noodles</h5>
							<p class="card-text">Yippee noodles, a flavorful snack and
								meal choice.</p>
							<p class="card-text">
								<strong>&#8377;20</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="70" data-price="20">70g - ₹20</option>
									<option value="140" data-price="40">140g - ₹40</option>
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
	<div id="pagination" class="pagination-container"></div>

	<footer class="text-center mt-5">
		<p>- Fresh Groceries Delivered to Your Door!</p>
	</footer>

	<footer class="bg-dark py-1 mt-1">
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

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>
