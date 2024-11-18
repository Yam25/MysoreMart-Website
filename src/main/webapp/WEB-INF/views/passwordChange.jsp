<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - Mysore Mart</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<c:url value='/css/userprofile/passwordChange.css'/>">
    
</head>
<body>

    <div class="container mt-5">
        <div class="forgot-password-box">
            <h2>Forgot Password</h2>

           <!-- OTP Sent Notification -->
            <div class="alert alert-info text-center" id="otpSentAlert" style="display:none;">
                <strong>OTP Sent!</strong> An OTP has been sent to your email/phone number. Please check your inbox and enter the OTP below.
            </div>

            <!-- Step 2: OTP Verification Form -->
            <div id="otpForm">
                <form id="otpVerificationForm" method="POST">
                    <div class="form-group">
                        <label for="otp">Enter OTP</label>
                        <input type="text" id="otp" name="otp" class="form-control" placeholder="Enter OTP" required>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-success btn-block">Verify OTP</button>
                    </div>
                </form>
                <div id="otpError" class="text-danger" style="display:none;">Invalid OTP. Please try again.</div>
            </div>

            <!-- Step 3: New Password Form (Initially Hidden) -->
            <div id="newPasswordForm" style="display:none;">
                <form id="newPasswordFormSubmit" action="<c:url value='/passwordChange'/>" method="POST">
                    <div class="form-group">
                        <label for="newPassword">New Password</label>
                        <input type="password" id="newPassword" name="newPassword" class="form-control" placeholder="Enter new password" required>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm new password" required>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-success btn-block">Update Password</button>
                    </div>
                </form>
            </div>

            <div class="text-center">
                <p>Remember your password? <a href="<c:url value='/login'/>">Login</a></p>
            </div>
        </div>
    </div>

    <!-- Optional JavaScript and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    $(document).ready(function() {
        // Handle OTP form submission
        $('#otpVerificationForm').submit(function(e) {
            e.preventDefault();  // Prevent the default form submission

            var otpEntered = $('#otp').val();

            // Send OTP to server for verification
            $.post('<c:url value="/verifyOtp" />', { otp: otpEntered }, function(response) {
                if (response === 'success') {
                    // Hide OTP form and show new password form
                    $('#otpForm').hide();
                    $('#newPasswordForm').show();
                } else {
                    // Show OTP error
                    $('#otpError').show();
                }
            });
        });

        // Handle new password form submission
        $('#newPasswordFormSubmit').submit(function(e) {
            e.preventDefault();  // Prevent the default form submission
            
            var newPassword = $('#newPassword').val();
            var confirmPassword = $('#confirmPassword').val();

            // Password validation regex
            var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

            // Check if new passwords match
            if (newPassword !== confirmPassword) {
                alert("Passwords do not match!");
                return;
            }

            // Validate the password strength
            if (!passwordRegex.test(newPassword)) {
                alert("Password must be at least 8 characters long, contain one uppercase letter, one lowercase letter, one number, and one special character.");
                return;
            }

            // Submit the new password form
            $.post('<c:url value="/passwordChange" />', { newPassword: newPassword }, function(response) {
                alert(" Password Changed Successfully Please Login"); 
                window.location.href = "<c:url value='/login' />";// Show success or error message
            });
        });
    });
</script>

    

</body>
</html>
