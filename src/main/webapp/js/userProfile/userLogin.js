$(document).ready(function() {
    // Check if the user is already logged in
    if (localStorage.getItem('isLoggedIn') === 'true') {
        // If already logged in, show the "Hello, User" dropdown and hide the login button
        $('#helloUser').show();
        $('#loginBtn').hide();
        $('#loginSignupLink').hide();
    }

    $("#loginForm").on("submit", function(e) {
        e.preventDefault(); // Prevent the default form submission

        var emailOrPhone = $('#emailOrPhone').val().trim();
        var password = $('#password').val().trim();

        // Validation before AJAX call
        if (emailOrPhone === "") {
            alert("Email or Mobile Phone Number is required.");
            return false;
        } else if (password === "") {
            alert("Password is required.");
            return false;
        }

        // Perform AJAX request to login endpoint
        $.ajax({
            url: 'login',  // Use the URL for the login endpoint
            type: 'POST',
            data: {
                emailOrPhone: emailOrPhone,
                password: password
            },
            success: function(response) {
                // If login is successful
                if (response === "success") {
                    // Store the login state in localStorage
                    localStorage.setItem('isLoggedIn', 'true');
                    
                    // Hide login button and show Hello User dropdown
                    $('#loginBtn').hide();
                    $('#loginSignupLink').hide();
                    $('#helloUser').show();

                    // Optionally, redirect to the dashboard or home page after login
                    window.location.href = "/MysoreMart/"; // Redirect to dashboard
                } else {
                    // Handle login failure, display message
                    alert(response);  // Show the error message returned from the server
                }
            },
            error: function(xhr, status, error) {
                // Handle AJAX error
                alert("User not found or Check your Credentials" + error);  // General error message
            }
        });
    });

    
	// Logout functionality
	$('#logoutBtn').click(function(event) {
	    event.preventDefault();  // Prevent the default action (e.g., redirect)

	    // Send an AJAX request to the logout endpoint
	    $.ajax({
	        url: baseUrl4,  // URL for the logout endpoint
	        type: 'GET',     // Use GET for logging out
	        success: function(response) {
	            // Clear the login state in localStorage
	            localStorage.removeItem('isLoggedIn');

	            // Optionally, alert the user on successful logout
	            alert("Logged out successfully");

	            // Hide Hello User dropdown and show login button again
	            $('#helloUser').hide();
	            $('#loginBtn').show();
	            $('#loginSignupLink').show();
	             window.location.href = '/MysoreMart/'; 
	        },
	        error: function(xhr, status, error) {
	            // Handle error
	            console.error("Logout error:", error);
	            alert("An error occurred while logging out. Please try again.");
	        }
	    });
	});  

});
