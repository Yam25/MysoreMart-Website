<%@page import="com.info.MysoreMart.Model.CartDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.info.MysoreMart.Model.Product"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Search</title>
<link rel="icon" href="images/product/mart.png" sizes="256x256"
	type="image/png">
	<link href="<c:url value='/css/search.css'/>" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	var baseUrl = "<c:url value='/add'/>";
	var baseUrl4 = "<c:url value='/logout'/>";
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
								
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0 d-flex align-items-center">
				  	<a class="nav-link" href="login" id="loginSignupLink">
			        <button id="loginBtn" type="button" class="btn btn-outline-dark login-signup-btn">Login/SignUp</button></a>
				
				    <li class="nav-item dropdown" id="helloUser" style="display: none;">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				            Hello, User
				        </a>
				        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                 	       <li><a class="dropdown-item" href="<c:url value='/userDashboard'/>">Dashboard</a></li>
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
	<div class="container">

		<div class="search-bar-container">
			<input type="text" id="searchBar" placeholder="Search products..."
				class="form-control mb-3" />
		</div>
         
		<div id="productResults" class="row"></div>
		
	</div>	
	
	<div class="category-buttons-container">
    <a href="fruits" class="category-button">
        <img src="images/product/fruits.jpg" alt="Fruits" class="category-img">
        <span class="category-label">Fruits</span>
    </a>
    <a href="vegetable" class="category-button">
        <img src="images/product/veggies.jpg" alt="Vegetables" class="category-img">
        <span class="category-label">Vegetables</span>
    </a>
    <a href="biscuits" class="category-button">
        <img src="images/product/snacks.jpg" alt="Snacks" class="category-img">
        <span class="category-label">Snacks</span>
    </a>
    <a href="dairyProducts" class="category-button">
        <img src="images/product/milk and dairy products.jpg" alt="Dairy Products" class="category-img">
        <span class="category-label">Dairy Products</span>
    </a>
    <a href="dryFruits" class="category-button">
        <img src="images/product/dry-fruits.jpg" alt="Dry Fruits" class="category-img">
        <span class="category-label">Dry Fruits</span>
    </a>
    <a href="spices" class="category-button">
        <img src="images/product/spices.jpg" alt="Spices" class="category-img">
        <span class="category-label">Spices</span>
    </a>
    <a href="dal-pulses" class="category-button">
        <img src="images/product/pulses.jpg" alt="Dal/Pulses" class="category-img">
        <span class="category-label">Dal/Pulses</span>
    </a>
    <a href="grocery" class="category-button">
        <img src="images/product/grains.jpg" alt="Wholesome Grains" class="category-img">
        <span class="category-label">Wholesome Grains</span>
    </a>
</div>
	
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
			</div>
	</footer>
	<script>
    $(document).ready(function() {
        $('#searchBar').on('input', function() {
            var query = $(this).val().trim();

            if (query.length > 2) { 
                $.ajax({
                    url: "<c:url value='/searchProducts'/>", 
                    type: 'GET',
                    dataType: 'json',  
                    data: { query: query },  
                    success: function(response) {
                        $('#productResults').empty();

                       if (response.length > 0) {
                            $.each(response, function(index, product) {
                                var productHTML = `
                                    <div class="col-md-4 mb-4 product-item">
                                        <div class="product-card">
                                            <img src="${product.productImage}" class="card-img-top" alt="${product.productName}">
                                            <div class="card-body">
                                                <h5 class="card-title">${product.productName}</h5>
                                                <p class="card-text">${product.productDescription ? product.productDescription : 'No description available.'}</p>
                                                <p class="card-text">
                                                    <strong>&#8377;${product.productPrice}</strong>
                                                </p>
                                                <p class="card-text weight">${product.productQuantity}</p>

                                                <button class="btn btn-outline-danger add-to-cart" data-product-id="${product.productId}"data-product-name="${product.productName}"
                                                    data-product-price="${product.productPrice}"
                                                        data-product-quantity="${product.productQuantity}"
                                                        data-product-img="${product.productImage}">Add to Cart</button> 
                                                       
                                            </div>
                                        </div>
                                    </div>
                                `;
                                $('#productResults').append(productHTML); 
                            });
                        } else {
                            $('#productResults').append('<p>No products found</p>'); 
                        }
                    },
                    error: function(xhr) {
                        alert('Error fetching products: ' + xhr.responseText);
                    }
                });
            } else {
                $('#productResults').empty();
            }
        });

      
    });
</script>
	<script src="<c:url value='/js/index.js'/>"></script>
	<script src="<c:url value='/js/userProfile/userLogin.js'/>"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>
