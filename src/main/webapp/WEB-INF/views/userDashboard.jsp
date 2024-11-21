<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>

    <!-- Bootstrap 5 CSS for better responsiveness -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    
           <link rel="stylesheet" href="<c:url value='/css/userprofile/dashboard.css'/>"> <!--  externalcss -->
    
<script>
	var baseUrl4 = "<c:url value='/logout'/>";
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
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0 d-flex align-items-center">
				    <!-- Login/Signup Button -->
				   	<a class="nav-link" href="login" id="loginSignupLink">
			        <button id="loginBtn" type="button" class="btn btn-outline-dark login-signup-btn">Login/SignUp</button></a>
				
				    <!-- Hello Button with Dropdown (Initially hidden) -->
				    <li class="nav-item dropdown" id="helloUser" style="display: none;">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				           <strong style="font-size:17px;">Hello,  <%= userFullName %></strong>
				        </a>
				        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                 	       <li><a class="dropdown-item" href="<c:url value='/forget'/>">Update Password</a></li>
				            <li><a class="dropdown-item" href="#contact">Contact Us</a></li>
				            <li><a class="dropdown-item" href="logout" id="logoutBtn">Logout</a></li>
				        </ul>
				    </li>
				    
		</div>
	</nav>
 
    <!-- Main Content Section -->
    <div class="container-fluid mt-5 mb-4">
        <!-- Dashboard Cards Section (4 cards per row) -->
        <div class="row">
            <!-- Orders Card -->
            <div class="col-md-5 m-4">
                <div class="card shadow-sm hover-effect">
                    <div class="card-body text-center">
                        <h5 class="card-title">My Orders</h5>
                        <p class="card-text">View and manage your orders.</p>
                        <a href="#" class="btn btn-primary">Go to Orders</a>
                    </div>
                </div>
            </div>

            <!-- Cart Card -->
            <div class="col-md-5 m-4">
                <div class="card shadow-sm hover-effect">
                    <div class="card-body text-center">
                        <h5 class="card-title">My Cart</h5>
                        <p class="card-text">Review items  before checkout.</p>
                        <a href="/MysoreMart/cart" class="btn btn-primary">Go to Cart</a>
                    </div>
                </div>
            </div>

            <!-- Track Order Card -->
            <div class="col-md-5 m-4">
                <div class="card shadow-sm hover-effect">
                    <div class="card-body text-center">
                        <h5 class="card-title">Track My Order</h5>
                        <p class="card-text">Check the status of your orders.</p>
                        <a href="#" class="btn btn-primary">Track Order</a>
                    </div>
                </div>
            </div>

            <!-- Address Card -->
            <div class="col-md-5 m-4">
                <div class="card shadow-sm hover-effect">
                    <div class="card-body text-center">
                        <h5 class="card-title">Manage Address</h5>
                        <p class="card-text">Add or update your shipping address.</p>
                        <a href="#" class="btn btn-primary">Add Address</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-dark py-3 mt-3">
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
    <!-- Optional JavaScript (Bootstrap 5 Bundle) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    
        <script src="<c:url value='/js/userProfile/dashboard.js'/>"></script> 
        <script src="<c:url value='/js/userProfile/userLogin.js'/>"></script> 
    
</body>

</html>
