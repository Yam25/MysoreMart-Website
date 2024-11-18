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

.biscuit-card {
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

.biscuit-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.biscuit-card:hover {
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
    let currentPage = 1;
    const itemsPerPage = 6;

    function showPage(page) {
        const items = document.querySelectorAll('.biscuit-item');
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
        const totalItems = document.querySelectorAll('.biscuit-item').length;
        const totalPages = Math.ceil(totalItems / itemsPerPage);
        let paginationHtml = '';

        for (let i = 1; i <= totalPages; i++) {
            paginationHtml += `<a href="javascript:void(0);" onclick="showPage(${i})">${i}</a>`;
        }

        document.getElementById('pagination').innerHTML = paginationHtml;
        currentPage = page;
    }

    function searchBiscuits() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const items = document.querySelectorAll('.biscuit-item');
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
      
        var baseUrl = "<c:url value='/add'/>";
    </script>
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
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
							<li><a class="dropdown-item" href="vegetable">Vegetables</a></li>
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
			style="display: none;">Item has been added to cart
			successfully.</div>

	<div class="text-center mb-4">
		<div class="search-container w-50 d-inline">
			<input type="text" id="searchInput" class="form-control"
				placeholder="Search biscuits by name..." onkeyup="searchBiscuits()">
			<i class="fas fa-search search-icon"></i>
		</div>
	</div>

	<div id="menu" class="container mt-5">
		<h2 class="text-center mb-4">Indian Biscuits</h2>
		<div class="row">
			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/parle-g.jpg" class="card-img-top"
						alt="Parle-G">
					<div class="card-body">
						<h5 class="card-title">Parle-G</h5>
						<p class="card-text">Classic glucose biscuits, one of the most
							iconic biscuits in India.</p>
						<p class="card-text">
							<strong>&#8377;20</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="20">100g - ₹20</option>
								<option value="500" data-price="90">500g - ₹90</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/marie-gold.jpg"
						class="card-img-top" alt="Marie Gold">
					<div class="card-body">
						<h5 class="card-title">Marie Gold</h5>
						<p class="card-text">Light, mildly sweet biscuits often
							enjoyed with tea.</p>
						<p class="card-text">
							<strong>&#8377;30</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="200" data-price="30">200g - ₹30</option>
								<option value="500" data-price="70">500g - ₹70</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/good-day.jpg"
						class="card-img-top" alt="Good Day">
					<div class="card-body">
						<h5 class="card-title">Good Day</h5>
						<p class="card-text">Buttery biscuits with flavors like
							cashew, pista-badam, many.</p>
						<p class="card-text">
							<strong>&#8377;35</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="200" data-price="35">200g - ₹35</option>
								<option value="500" data-price="80">500g - ₹80</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/Mike-bikis.jpg"
						class="card-img-top" alt="Milk Bikis">
					<div class="card-body">
						<h5 class="card-title">Milk Bikis</h5>
						<p class="card-text">Milk-based biscuits, popular for their
							milky flavor.</p>
						<p class="card-text">
							<strong>&#8377;25</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="150" data-price="25">150g - ₹25</option>
								<option value="500" data-price="75">500g - ₹75</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/bourbon.jpg" class="card-img-top"
						alt="Bourbon">
					<div class="card-body">
						<h5 class="card-title">Bourbon</h5>
						<p class="card-text">Chocolate cream-filled biscuits with
							sugar crystals on top.</p>
						<p class="card-text">
							<strong>&#8377;40</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="120" data-price="40">120g - ₹40</option>
								<option value="250" data-price="80">250g - ₹80</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/hide-and-seek.jpg"
						class="card-img-top" alt="Hide & Seek">
					<div class="card-body">
						<h5 class="card-title">Hide & Seek</h5>
						<p class="card-text">Chocolate chip biscuits with a rich
							chocolaty flavor.</p>
						<p class="card-text">
							<strong>&#8377;45</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="45">100g - ₹45</option>
								<option value="300" data-price="120">300g - ₹120</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/krackjack.jpg"
						class="card-img-top" alt="Krackjack">
					<div class="card-body">
						<h5 class="card-title">Krackjack</h5>
						<p class="card-text">Sweet and salty biscuits, known for their
							unique flavor combination.</p>
						<p class="card-text">
							<strong>&#8377;20</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="120" data-price="20">120g - ₹20</option>
								<option value="300" data-price="50">300g - ₹50</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/50-50.jpg" class="card-img-top"
						alt="50-50">
					<div class="card-body">
						<h5 class="card-title">50-50</h5>
						<p class="card-text">Sweet and salty crispy biscuits that pair
							well with tea.</p>
						<p class="card-text">
							<strong>&#8377;25</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="25">100g - ₹25</option>
								<option value="250" data-price="60">250g - ₹60</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/nice.jpg" class="card-img-top"
						alt="Nice">
					<div class="card-body">
						<h5 class="card-title">Nice</h5>
						<p class="card-text">Coconut-flavored biscuits with a sprinkle
							of sugar on top.</p>
						<p class="card-text">
							<strong>&#8377;20</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="120" data-price="20">120g - ₹20</option>
								<option value="300" data-price="50">300g - ₹50</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/jim-jam.jpg" class="card-img-top"
						alt="Jim Jam">
					<div class="card-body">
						<h5 class="card-title">Jim Jam</h5>
						<p class="card-text">Cream biscuits with a jam-filled center,
							popular among kids.</p>
						<p class="card-text">
							<strong>&#8377;35</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="35">100g - ₹35</option>
								<option value="250" data-price="80">250g - ₹80</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/monaco.jpg" class="card-img-top"
						alt="Monaco">
					<div class="card-body">
						<h5 class="card-title">Monaco</h5>
						<p class="card-text">Salted, crispy biscuits, often enjoyed as
							a snack with cheese.</p>
						<p class="card-text">
							<strong>&#8377;25</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="25">100g - ₹25</option>
								<option value="300" data-price="60">300g - ₹60</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/jeera.jpg" class="card-img-top"
						alt="Jeera Biscuits">
					<div class="card-body">
						<h5 class="card-title">Jeera (Cumin) Biscuits</h5>
						<p class="card-text">Savory biscuits flavored with cumin
							seeds, a favorite with tea.</p>
						<p class="card-text">
							<strong>&#8377;30</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="150" data-price="30">150g - ₹30</option>
								<option value="400" data-price="70">400g - ₹70</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/nankhatai.jpg"
						class="card-img-top" alt="Nankhatai">
					<div class="card-body">
						<h5 class="card-title">Nankhatai</h5>
						<p class="card-text">Traditional Indian biscuits made with
							ghee, flour, and cardamom.</p>
						<p class="card-text">
							<strong>&#8377;50</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="50">100g - ₹50</option>
								<option value="300" data-price="120">300g - ₹120</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/fruit-biscuit.jpg"
						class="card-img-top" alt="Fruit Biscuits">
					<div class="card-body">
						<h5 class="card-title">Fruit Biscuits</h5>
						<p class="card-text">Soft, flavorful biscuits with fruity bits
							and nuts.</p>
						<p class="card-text">
							<strong>&#8377;80</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="200" data-price="80">200g - ₹80</option>
								<option value="500" data-price="180">500g - ₹180</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/digestive.jpg"
						class="card-img-top" alt="Digestive Biscuits">
					<div class="card-body">
						<h5 class="card-title">Digestive Biscuits</h5>
						<p class="card-text">Crunchy, fiber-rich biscuits perfect for
							a healthy snack.</p>
						<p class="card-text">
							<strong>&#8377;100</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="200" data-price="100">200g - ₹100</option>
								<option value="500" data-price="250">500g - ₹250</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/oat.jpg" class="card-img-top"
						alt="Oat Biscuits">
					<div class="card-body">
						<h5 class="card-title">Oat Biscuits</h5>
						<p class="card-text">Delicious oat-based biscuits, high in
							fiber and great for snacking.</p>
						<p class="card-text">
							<strong>&#8377;120</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity" name="selectedQuantity">
								<option value="250" data-price="120">250g - ₹120</option>
								<option value="500" data-price="220">500g - ₹220</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 biscuit-item">
				<div class="card biscuit-card">
					<img src="images/product/biscuits/chocofills.jpg"
						class="card-img-top" alt="Chocofills">
					<div class="card-body">
						<h5 class="card-title">Chocofills</h5>
						<p class="card-text">Decadent biscuits with a rich chocolate
							filling for indulgence.</p>
						<p class="card-text">
							<strong>&#8377;150</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="150" data-price="150">150g - ₹150</option>
								<option value="300" data-price="280">300g - ₹280</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="pagination" class="pagination-container"></div>

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
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>
