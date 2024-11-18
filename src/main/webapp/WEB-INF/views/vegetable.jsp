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

.vegetables-card {
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

.vegetables-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.vegetables-card:hover {
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
        const items = document.querySelectorAll('.vegetable-item');
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
        const totalItems = document.querySelectorAll('.vegetable-item').length;
        const totalPages = Math.ceil(totalItems / itemsPerPage);
        let paginationHtml = '';

        for (let i = 1; i <= totalPages; i++) {
            paginationHtml += `<a href="javascript:void(0);" onclick="showPage(${i})">${i}</a>`;
        }

        document.getElementById('pagination').innerHTML = paginationHtml;
        currentPage = page;
    }

    function searchVegetables() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const items = document.querySelectorAll('.vegetable-item');
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
							<li><a class="dropdown-item" href="fruits">Fruits</a></li>
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
				placeholder="Search vegetables by name..."
				onkeyup="searchVegetables()"> <i
				class="fas fa-search search-icon"></i>
		</div>
	</div>
	<form action="add" method="post" id="cart-form">
		<div id="menu" class="container mt-5">
			<h2 class="text-center mb-4">Fresh Indian Vegetables</h2>
			<div class="row">
				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/okra.jpg" class="card-img-top"
							alt="Okra">
						<div class="card-body">
							<h5 class="card-title">Okra (Bhindi)</h5>
							<p class="card-text">A green, elongated vegetable with a
								slimy texture, often used in curries and stir-fries.</p>
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

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/brinjal.jpg"
							class="card-img-top" alt="Brinjal">
						<div class="card-body">
							<h5 class="card-title">Brinjal (Baingan)</h5>
							<p class="card-text">A purple, glossy vegetable with a spongy
								texture, used in various curries, grilling, and roasting.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="200">500g - ₹200</option>
									<option value="3000" data-price="1200">3kg - ₹1200</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/cauliflower.jpg"
							class="card-img-top" alt="Cauliflower">
						<div class="card-body">
							<h5 class="card-title">Cauliflower (Gobhi)</h5>
							<p class="card-text">A white vegetable with a mild flavor,
								commonly used in curries, stews, and stir-fries.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="200">500g - ₹200</option>
									<option value="3000" data-price="1200">3kg - ₹1200</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/potato.jpg"
							class="card-img-top" alt="Potato">
						<div class="card-body">
							<h5 class="card-title">Potato (Aloo)</h5>
							<p class="card-text">A versatile tuber with a starchy
								texture, used in nearly every type of dish, from curries to
								snacks.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="200">500g - ₹200</option>
									<option value="3000" data-price="1200">3kg - ₹1200</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/methi.jpg"
							class="card-img-top" alt="Fenugreek">
						<div class="card-body">
							<h5 class="card-title">Fenugreek (Methi)</h5>
							<p class="card-text">A leafy herb with a slightly bitter
								taste, used in curries, parathas, and pickles.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="200">500g - ₹200</option>
									<option value="3000" data-price="1200">3kg - ₹1200</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/knol-knol.jpg"
							class="card-img-top" alt="Knol Khol">
						<div class="card-body">
							<h5 class="card-title">Knol Khol (Kohlrabi)</h5>
							<p class="card-text">A round, green vegetable with a mild,
								slightly sweet flavor, often used in soups and stir-fries.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="200">500g - ₹200</option>
									<option value="3000" data-price="1200">3kg - ₹1200</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/ridge.jpg"
							class="card-img-top" alt="Ridge Gourd">
						<div class="card-body">
							<h5 class="card-title">Ridge Gourd (Turai)</h5>
							<p class="card-text">A green, ridged vegetable with a mild
								flavor, used in curries, dals, and stir-fries.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="200">500g - ₹200</option>
									<option value="3000" data-price="1200">3kg - ₹1200</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/chilli.jpg"
							class="card-img-top" alt="Green Chili">
						<div class="card-body">
							<h5 class="card-title">Green Chili (Hari Mirch)</h5>
							<p class="card-text">Small, spicy peppers that add heat and
								flavor to various dishes,a key ingredient in many Indian
								recipes.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="200">500g - ₹200</option>
									<option value="3000" data-price="1200">3kg - ₹1200</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/ash.jpg" class="card-img-top"
							alt="Ash Gourd">
						<div class="card-body">
							<h5 class="card-title">Ash Gourd (Petha)</h5>
							<p class="card-text">A large, green vegetable with a mild,
								neutral flavor, often used in soups and sweets.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500" data-price="200">500g - ₹200</option>
									<option value="3000" data-price="1200">3kg - ₹1200</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/bottle-gourd.jpg"
							class="card-img-top" alt="Bottle Gourd">
						<div class="card-body">
							<h5 class="card-title">Bottle Gourd (Lauki)</h5>
							<p class="card-text">A light green, smooth vegetable, used in
								curries, stews, and smoothies.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="15">500g - ₹15</option>
									<option value="1kg" data-price="30">1kg - ₹30</option>
									<option value="2kg" data-price="60">2kg - ₹60</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/coriander.jpg"
							class="card-img-top" alt="Coriander">
						<div class="card-body">
							<h5 class="card-title">Coriander (Cilantro)</h5>
							<p class="card-text">A fragrant herb with bright green
								leaves, used in garnishes, chutneys, and salads.</p>
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

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/green-peas.jpg"
							class="card-img-top" alt="Green Peas">
						<div class="card-body">
							<h5 class="card-title">Green Peas (Matar)</h5>
							<p class="card-text">Small, round, green seeds that are sweet
								and commonly used in curries, soups, and salads.</p>
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

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/spinach.jpg"
							class="card-img-top" alt="Spinach">
						<div class="card-body">
							<h5 class="card-title">Spinach (Palak)</h5>
							<p class="card-text">A highly nutritious leafy green
								vegetable used in various curries and dishes.</p>
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

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/carrots.jpg"
							class="card-img-top" alt="Carrot">
						<div class="card-body">
							<h5 class="card-title">Carrot (Gajar)</h5>
							<p class="card-text">A root vegetable, orange in color, with
								a crunchy texture, used in salads, curries, and desserts.</p>
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

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/drum-stick.jpg"
							class="card-img-top" alt="Drumstick">
						<div class="card-body">
							<h5 class="card-title">Drumstick (Moringa)</h5>
							<p class="card-text">A nutrient-rich vegetable used in soups
								and curries, known for its health benefits.</p>
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

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/sweet-potato.jpg"
							class="card-img-top" alt="Sweet Potato">
						<div class="card-body">
							<h5 class="card-title">Sweet Potato (Shakarkandi)</h5>
							<p class="card-text">A sweet and starchy root vegetable,
								commonly used in snacks and curries.</p>
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

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/pumpkin.jpg"
							class="card-img-top" alt="Pumpkin">
						<div class="card-body">
							<h5 class="card-title">Pumpkin (Kaddu)</h5>
							<p class="card-text">A sweet, orange vegetable used in
								curries, soups, and desserts. It can also be roasted or made
								into stews.</p>
							<p class="card-text">
								<strong>&#8377;249</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="15">500g - ₹15</option>
									<option value="1kg" data-price="30">1kg - ₹30</option>
									<option value="2kg" data-price="60">2kg - ₹60</option>
								</select>
							</div>
							<button class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-4 vegetable-item">
					<div class="card vegetables-card">
						<img src="images/product/vegetables/taro.jpg" class="card-img-top"
							alt="Taro">
						<div class="card-body">
							<h5 class="card-title">Taro (Arbi)</h5>
							<p class="card-text">A starchy root vegetable, often used in
								curries and fried dishes Taro has a slightly nutty flavor.</p>
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
			</div>

			<div id="pagination" class="pagination-container"></div>
		</div>
	</form>
	<footer class="text-center mt-5">
		<p>Enjoy Fresh and Healthy Vegetables!</p>
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
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
