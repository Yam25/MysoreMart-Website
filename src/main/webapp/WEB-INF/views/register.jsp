<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Account - MysoreMart</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- External CSS link for custom styles -->
    <link rel="stylesheet" href="<c:url value='/css/userprofile/register.css'/>">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-12">
                <div class="new-user-box">
                    <h2 class="text-center">Create Account</h2>
                    
                    <!-- Form for creating a new account -->
                    <form action="register" method="post">
                        
                        <!-- Full Name Input -->
                        <div class="form-group">
                            <label for="fullName">Full Name</label>
                            <input type="text" id="fullName" name="fullName" class="form-control" placeholder="Enter your full name" required>
                        </div>

                        <!-- Email Input -->
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email address" required>
                        </div>

                        <!-- Mobile Phone Input -->
                        <div class="form-group">
                            <label for="phone">Mobile Number</label>
                            <input type="tel" id="phone" name="phone" class="form-control" placeholder="Enter your mobile number" required>
                        </div>
                        
                        <!-- Password Input -->
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" class="form-control" placeholder="Create a password" required>
                        </div>
                        
                        <!-- Sign Up Button -->
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block">Create your MysoreMart account</button>
                        </div>
                        
                        <!-- Terms and Conditions -->
                        <div class="text-center">
                            <p>By creating an account, you agree to MysoreMart's <a href="#">Conditions of Use</a> and <a href="#">Privacy Notice</a>.</p>
                        </div>
                    </form>

                    <!-- Link to Sign In for  existing users -->
                    <div class="existing-user-section text-center">
                        <p>Already have an account? <a href="<c:url value='/login'/>">Sign In</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Optional JavaScript and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="<c:url value='/js/userProfile/registerValidation.js'/>"></script> <!-- Link to external JS -->
</body>
</html>
