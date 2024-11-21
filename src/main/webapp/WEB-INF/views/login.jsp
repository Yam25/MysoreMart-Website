<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In - Mysore Mart</title>

    <!-- Bootstrap CS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/css/userprofile/login.css'/>">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-sm-12">
                <div class="sign-in-box p-4 shadow-lg rounded">
                    <h2 class="text-center mb-4">Sign In</h2>

                    <!-- Sign In Form -->
                    <form id="loginForm" method="POST" >
                        <div class="form-group">
                            <label for="emailOrPhone">Email or Mobile Phone Number</label>
                            <input type="text" id="emailOrPhone" name="emailOrPhone" class="form-control" placeholder="Email or Mobile Phone Number" required>
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block" id="submitBtn">Sign In</button>
                        </div>
                    </form>

                    <!-- Forgot Password Link -->
                    <div class="forgot-password text-center">
                        <a href="<c:url value='/forget'/>">Forgot Password?</a>
                    </div>

                    <!-- New User Section -->
                    <div class="new-user-section text-center mt-4">
                        <p>New user? <a href="<c:url value='/register'/>">Create an Account</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Optional JavaScript and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    
        <script src="<c:url value='/js/userProfile/userLogin.js'/>"></script> <!-- Link to external JS -->
    
    
    


</body>
</html>
