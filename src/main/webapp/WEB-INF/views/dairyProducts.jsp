<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.dairy-card {
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

.dairy-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.dairy-card:hover {
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
        const items = document.querySelectorAll('.dairy-item');
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
        const totalItems = document.querySelectorAll('.dairy-item').length;
        const totalPages = Math.ceil(totalItems / itemsPerPage);
        let paginationHtml = '';

        for (let i = 1; i <= totalPages; i++) {
            paginationHtml += `<a href="javascript:void(0);" onclick="showPage(${i})">${i}</a>`;
        }

        document.getElementById('pagination').innerHTML = paginationHtml;
        currentPage = page;
    }

    function searchDairyProducts() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const items = document.querySelectorAll('.dairy-item');
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
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container">
			<a class="navbar-brand ms-0" href="index"> <img
				src="images/product/logo 1.png" alt="Mysore Mart" width="200"
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
							<li><a class="dropdown-item" href="biscuits">Sip-Snack</a></li>
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
					<li class="nav-item ms-2"><a class="nav-link"
						href="/MysoreMart/cart"> <i
							class="bi bi-cart4 text-danger cart-icon fs-1"></i>
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
				placeholder="Search dairy products by name..."
				onkeyup="searchDairyProducts()"> <i
				class="fas fa-search search-icon"></i>
		</div>
	</div>

	<form action="add" method="post">
		<div id="menu" class="container mt-5">
			<h2 class="text-center mb-4">Fresh Dairy Products</h2>
			<div class="row">
				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/milk.jpg"
							class="card-img-top" alt="Milk">
						<div class="card-body">
							<h5 class="card-title">Milk</h5>
							<p class="card-text">A nutritious liquid commonly consumed as
								a beverage or used in cooking and baking.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/cheese.jpg"
							class="card-img-top" alt="Cheese">
						<div class="card-body">
							<h5 class="card-title">Cheese</h5>
							<p class="card-text">A solid dairy product made from the
								curdled milk available in numerous varieties.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/yogurt.jpg"
							class="card-img-top" alt="Yogurt">
						<div class="card-body">
							<h5 class="card-title">Yogurt</h5>
							<p class="card-text">A fermented dairy product made by
								bacterial fermentation of milk, often consumed as a snack or
								breakfast.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/butter.jpg"
							class="card-img-top" alt="Butter">
						<div class="card-body">
							<h5 class="card-title">Butter</h5>
							<p class="card-text">A creamy, fatty dairy product made by
								churning cream, used for cooking or as a spread.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/ghee.jpg"
							class="card-img-top" alt="Ghee">
						<div class="card-body">
							<h5 class="card-title">Ghee</h5>
							<p class="card-text">Clarified butter commonly used in Indian
								cooking, made by melting butter.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/cream.jpg"
							class="card-img-top" alt="Cream">
						<div class="card-body">
							<h5 class="card-title">Cream</h5>
							<p class="card-text">The thick, fatty part of milk that rises
								to the top, used in cooking, desserts, or as a topping.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/milk-powder.jpg"
							class="card-img-top" alt="Milk Powder">
						<div class="card-body">
							<h5 class="card-title">Milk Powder</h5>
							<p class="card-text">A dehydrated form of milk made by
								evaporating water from milk, often used in baking and beverages.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/cream-cheese.jpg"
							class="card-img-top" alt="Cream Cheese">
						<div class="card-body">
							<h5 class="card-title">Cream Cheese</h5>
							<p class="card-text">A soft, spreadable cheese made from
								cream and milk, often used in desserts or as a spread.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/ricotta-cheese.jpg"
							class="card-img-top" alt="Ricotta Cheese">
						<div class="card-body">
							<h5 class="card-title">Ricotta Cheese</h5>
							<p class="card-text">An Italian cheese made from whey, soft
								and creamy, typically used in lasagna, ravioli, or desserts.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/milkshake.jpg"
							class="card-img-top" alt="Milkshake">
						<div class="card-body">
							<h5 class="card-title">Milkshake</h5>
							<p class="card-text">A sweet, chilled beverage made by
								blending milk, ice cream, and flavorings like chocolate or
								fruit.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/paneer.jpg"
							class="card-img-top" alt="Paneer">
						<div class="card-body">
							<h5 class="card-title">Paneer</h5>
							<p class="card-text">A fresh, non-aged cheese made from
								curdled milk, commonly used in Indian curries or grilled.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/buttermilk.jpg"
							class="card-img-top" alt="Buttermilk">
						<div class="card-body">
							<h5 class="card-title">Buttermilk</h5>
							<p class="card-text">The liquid left behind after churning
								butter, often consumed as a drink or used in cooking.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/sour-cream.jpg"
							class="card-img-top" alt="Sour Cream">
						<div class="card-body">
							<h5 class="card-title">Sour Cream</h5>
							<p class="card-text">A thick dairy product made by fermenting
								cream, used in dips or as a topping.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/yogurt-drink.jpg"
							class="card-img-top" alt="Yogurt Drink">
						<div class="card-body">
							<h5 class="card-title">Yogurt Drink</h5>
							<p class="card-text">A thin, liquid form of yogurt, sometimes
								flavored, consumed as a refreshing beverage.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/skimmed-milk.jpg"
							class="card-img-top" alt="Skimmed Milk">
						<div class="card-body">
							<h5 class="card-title">Skimmed Milk</h5>
							<p class="card-text">Milk with most of its fat content
								removed, making it lower in calories compared to whole milk.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/chocolate-milk.jpg"
							class="card-img-top" alt="Chocolate Milk">
						<div class="card-body">
							<h5 class="card-title">Chocolate Milk</h5>
							<p class="card-text">Milk flavored with chocolate syrup or
								powder, often served as a sweet beverage.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/greek-yogurt.jpg"
							class="card-img-top" alt="Greek Yogurt">
						<div class="card-body">
							<h5 class="card-title">Greek Yogurt</h5>
							<p class="card-text">A strained yogurt with a thick, creamy
								texture and higher protein content than regular yogurt.</p>
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

				<div class="col-md-4 mb-4 dairy-item">
					<div class="card dairy-card">
						<img src="images/product/dairyProducts/lassi.jpg"
							class="card-img-top" alt="Lassi">
						<div class="card-body">
							<h5 class="card-title">Lassi</h5>
							<p class="card-text">A traditional yogurt-based drink from
								the Indian subcontinent, usually served sweet or salted.</p>
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
			</div>

			<div class="pagination-container">
				<div id="pagination"></div>
			</div>
		</div>
	</form>

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
				src="images/product/logo 1.png" alt="Mysore Mart" width="200"
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
