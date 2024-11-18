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

.spice-card-whole {
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

.spice-card-whole img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.spice-card-whole:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.spice-card-powder {
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

.spice-card-powder img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.spice-card-powder:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

footer {
	margin-top: 40px;
	font-weight: bold;
}

.btn:hover {
	transform: scale(1.25);
}

.btn-primary:hover {
	margin: 0 20px;
	background-color: #0056b3;
}

.btn-success:hover {
	margin: 0 20px;
	background-color: #4caf50;
}

.btn-danger:hover {
	margin: 0 20px;
	background-color: #c82333;
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
        const items = document.querySelectorAll('.spice-item');
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
        const totalItems = document.querySelectorAll('.spice-item').length;
        const totalPages = Math.ceil(totalItems / itemsPerPage);
        let paginationHtml = '';

        for (let i = 1; i <= totalPages; i++) {
            paginationHtml += `<a href="javascript:void(0);" onclick="showPage(${i})">${i}</a>`;
        }

        document.getElementById('pagination').innerHTML = paginationHtml;
        currentPage = page;
    }

    function searchSpices() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const items = document.querySelectorAll('.spice-item');
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
    
    function filterSpices(type) {
        const items = document.querySelectorAll('.spice-item');
        items.forEach(item => {
            const badge = item.querySelector('.badge');
            if (type === 'all') {
                item.style.display = 'block';  
            } else if (badge && badge.textContent.trim() === type) {
                item.style.display = 'block'; 
            } else {
                item.style.display = 'none'; 
            }
        });
    }
    
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
							<li><a class="dropdown-item" href="vegetable">Vegetables</a></li>
							<li><a class="dropdown-item" href="biscuits">Sip-Snack</a></li>
							<li><a class="dropdown-item" href="dairyProducts">Dairy
									Products</a></li>
							<li><a class="dropdown-item" href="dryFruits">Dry Fruits</a></li>
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
				placeholder="Search spices by name..." onkeyup="searchSpices()">
			<i class="fas fa-search search-icon"></i>
		</div>
	</div>

	<form action="add" method="post" id="cart-form">
		<div class="container mt-5">
			<h2 class="text-center mb-4">Fresh Indian Spices</h2>
			<div class="text-center mb-4">
				<button class="btn btn-primary" onclick="filterSpices('all')">Show
					All</button>
				<button class="btn btn-success" onclick="filterSpices('Powder')">Show
					Powder</button>
				<button class="btn btn-danger" onclick="filterSpices('Spice')">Show
					Whole Spice</button>
			</div>


			<div class="row">
				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/Turmeric.jpg"
							class="card-img-top" alt="Turmeric">
						<div class="card-body">
							<h5 class="card-title">Turmeric</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Bright yellow, adds earthy flavor to
								dishes.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/Cumin.jpg"
							class="card-img-top" alt="Cumin">
						<div class="card-body">
							<h5 class="card-title">Cumin</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Nutty and earthy, essential in Indian
								cooking.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/coriander.jpg"
							class="card-img-top" alt="Coriander">
						<div class="card-body">
							<h5 class="card-title">Coriander</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Citrusy flavor, commonly used in curry
								powders.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/cardamon.jpg"
							class="card-img-top" alt="Cardamom">
						<div class="card-body">
							<h5 class="card-title">Cardamom</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Sweet, warm spice used in desserts and
								curries.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/cloves.jpg"
							class="card-img-top" alt="Cloves">
						<div class="card-body">
							<h5 class="card-title">Cloves</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Intense, warm, and slightly sweet
								flavor.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/cinnamon.jpg"
							class="card-img-top" alt="Cinnamon">
						<div class="card-body">
							<h5 class="card-title">Cinnamon</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Warm, sweet spice often used in
								desserts.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/mustardseeds.jpg"
							class="card-img-top" alt="Mustard Seeds">
						<div class="card-body">
							<h5 class="card-title">Mustard Seeds</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Sharp, tangy flavor used in Indian
								pickles.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/fenugreek.jpg"
							class="card-img-top" alt="Fenugreek">
						<div class="card-body">
							<h5 class="card-title">Fenugreek</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Bitter, slightly sweet spice for
								curries.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/black-pepper.jpg"
							class="card-img-top" alt="Black Pepper">
						<div class="card-body">
							<h5 class="card-title">Black Pepper</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Pungent spice, adds heat and depth to
								dishes.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/star-anise.jpg"
							class="card-img-top" alt="Star Anise">
						<div class="card-body">
							<h5 class="card-title">Star Anise</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">has a strong, sweet licorice-like flavor
								used in biryanis.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/bay-leaf.jpg"
							class="card-img-top" alt="Bay Leaf">
						<div class="card-body">
							<h5 class="card-title">Bay Leaf</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Aromatic leaves, adds depth to stews.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/fennelseeds.jpg"
							class="card-img-top" alt="Fennel Seeds">
						<div class="card-body">
							<h5 class="card-title">Fennel Seeds</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Sweet and aromatic, used in pickles and
								desserts.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/nutmeg.jpg"
							class="card-img-top" alt="Nutmeg">
						<div class="card-body">
							<h5 class="card-title">Nutmeg</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Warm and sweet, used in desserts and
								curries.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/mace.jpg"
							class="card-img-top" alt="Mace">
						<div class="card-body">
							<h5 class="card-title">Mace</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Earthy and slightly sweet, used in
								sauces.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/red-chilli.jpg"
							class="card-img-top" alt="Red Chili">
						<div class="card-body">
							<h5 class="card-title">Red Chilli</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Spicy, adds heat and color to dishes.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/saffron.jpg"
							class="card-img-top" alt="Saffron">
						<div class="card-body">
							<h5 class="card-title">Saffron</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Luxurious, adds fragrance and color to
								dishes.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/tamrind.jpg"
							class="card-img-top" alt="Tamarind">
						<div class="card-body">
							<h5 class="card-title">Tamarind</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Tart and tangy, used in chutneys and
								curries.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/spices/wholeSpice/kala-jeera.jpg"
							class="card-img-top" alt="Kala Jeera (Black Cumin)">
						<div class="card-body">
							<h5 class="card-title">Kala Jeera (Black Cumin)</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Aromatic, nutty spice, adds a distinct
								flavor.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/turmeric.jpg"
							class="card-img-top" alt="Turmeric">
						<div class="card-body">
							<h5 class="card-title">Turmeric</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">Bright yellow spice used in curries,
								rice, and for medicinal purposes.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/cumin.jpg"
							class="card-img-top" alt="Cumin">
						<div class="card-body">
							<h5 class="card-title">Cumin</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">Earthy, warm spice used in a variety of
								Indian dishes.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/coriander.jpg"
							class="card-img-top" alt="Coriander">
						<div class="card-body">
							<h5 class="card-title">Coriander</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">Mild, citrusy flavor used in curries,
								soups, and stews.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/chilli.jpg"
							class="card-img-top" alt="Chili Powder">
						<div class="card-body">
							<h5 class="card-title">Chilli Powder</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">Adds spice to dishes, comes in different
								levels of spiciness.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/garam-masala.jpg"
							class="card-img-top" alt="Garam Masala">
						<div class="card-body">
							<h5 class="card-title">Garam Masala</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">A blend of spices used to add depth and
								warmth to curries and stews.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/cinnamon.jpg"
							class="card-img-top" alt="Cinnamon">
						<div class="card-body">
							<h5 class="card-title">Cinnamon</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">Sweet and woody spice used in both sweet
								and savory dishes.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/cardamon.jpg"
							class="card-img-top" alt="Cardamom">
						<div class="card-body">
							<h5 class="card-title">Cardamom</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">Sweet, warm spice used in desserts and
								curries.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/asafoetida.jpg"
							class="card-img-top" alt="Asafoetida">
						<div class="card-body">
							<h5 class="card-title">Asafoetida</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">Pungent spice used in small quantities
								to enhance flavors.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/amchur-powder.jpg"
							class="card-img-top" alt="Amchur">
						<div class="card-body">
							<h5 class="card-title">Amchur</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">Tangy powder made from dried mangoes,
								used in curries.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/kasuri-methi.jpg"
							class="card-img-top" alt="Kasuri Methi">
						<div class="card-body">
							<h5 class="card-title">Kasuri Methi</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">Dried fenugreek leaves, crushed for a
								unique flavor Indian dishes.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/nutmeg.jpg"
							class="card-img-top" alt="Nutmeg">
						<div class="card-body">
							<h5 class="card-title">Nutmeg</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">Sweet and warm spice used in desserts,
								curries, and beverages.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/Black-Salt.jpg"
							class="card-img-top" alt="Black Salt">
						<div class="card-body">
							<h5 class="card-title">Black Salt</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">Salty and tangy seasoning used in
								chaats, salads, and various dishes.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/pav-bhaji.jpg"
							class="card-img-top" alt="Pav Bhaji Masala">
						<div class="card-body">
							<h5 class="card-title">Pav Bhaji Masala</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">A spice blend used to prepare Pav Bhaji,
								with a rich and tangy flavor.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/chana-masala.jpg"
							class="card-img-top" alt="Chana Masala">
						<div class="card-body">
							<h5 class="card-title">Chana Masala</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">A spice blend used to cook the famous
								Chana Masala.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/meat-masala.jpg"
							class="card-img-top" alt="Meat Masala">
						<div class="card-body">
							<h5 class="card-title">Meat Masala</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">A flavorful spice mix designed to
								enhance the taste of meat dishes.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/biryani-masala.jpg"
							class="card-img-top" alt="Biryani Masala">
						<div class="card-body">
							<h5 class="card-title">Biryani Masala</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">A fragrant blend of spices used to
								prepare biryani.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/chole-masala.jpg"
							class="card-img-top" alt="Chole Masala">
						<div class="card-body">
							<h5 class="card-title">Chole Masala</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">A spice blend used to cook Chole with a
								tangy, spicy flavor.</p>
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

				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-powder">
						<img src="images/product/spices/powder/chaat-masala.jpg"
							class="card-img-top" alt="Chaat Masala">
						<div class="card-body">
							<h5 class="card-title">Chaat Masala</h5>
							<span class="badge badge-success">Powder</span>
							<p class="card-text">A tangy, spicy seasoning mix used to
								enhance the flavor.</p>
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
		</div>

	</form>

	<div id="pagination" class="pagination-container"></div>

	<footer class="text-center mt-5">
		<p>Enjoy Nature's Fresh Spices!</p>
		<p>
			<a href="index.jsp" class="text-success">Go back to Home</a>
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