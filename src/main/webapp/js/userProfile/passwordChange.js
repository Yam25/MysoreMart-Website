// password change successfully redirect to login page

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

