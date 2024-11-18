$(document).ready(function () {

    $("form").on("submit", function (event) {
        event.preventDefault();

        $(".alert").remove();  // Remove any previous alert messages

        var fullName = $("#fullName").val().trim();
        var phone = $("#phone").val().trim();
        var password = $("#password").val().trim();
        var email = $("#email").val().trim();

        console.log("Full Name:", fullName); // Debugging: check the value of fullName

        // Full Name validation
        var namePattern = /^[A-Za-z\s]+$/; // Only allows letters and space
        if (fullName === "") {
            $("#fullName").after('<div class="alert alert-danger">Full Name cannot be empty.</div>');
            return false;
        } else if (!namePattern.test(fullName)) {
            $("#fullName").after('<div class="alert alert-danger">Full Name must contain only letters and spaces.</div>');
            return false;
        }

        // Phone validation
        var phonePattern = /^[0-9]{10}$/;
        if (!phonePattern.test(phone)) {
            $("#phone").after('<div class="alert alert-danger">Please enter a valid 10-digit mobile number.</div>');
            return false;
        }

        // Email validation
        var emailPattern = /^[a-z0-9]+@(gmail\.com|yahoo\.com|outlook\.com|hotmail\.com|icloud\.com)$/;
        if (!emailPattern.test(email)) {
            $("#email").after('<div class="alert alert-danger">Please enter a valid email address in lowercase with one of the supported domains (gmail.com, yahoo.com, outlook.com, hotmail.com, icloud.com).</div>');
            return false;
        }

        // Password validation
        var passwordLengthValid = password.length >= 8;
        var hasUpperCase = /[A-Z]/.test(password);
        var hasLowerCase = /[a-z]/.test(password);
        var specialCharPattern = /[!@#$%^&*]/;

        if (!passwordLengthValid) {
            $("#password").after('<div class="alert alert-danger">Password must be at least 8 characters long.</div>');
            return false;
        }

        if (!hasUpperCase) {
            $("#password").after('<div class="alert alert-danger">Password must contain at least one uppercase letter.</div>');
            return false;
        }

        if (!hasLowerCase) {
            $("#password").after('<div class="alert alert-danger">Password must contain at least one lowercase letter.</div>');
            return false;
        }

        if (!specialCharPattern.test(password)) {
            $("#password").after('<div class="alert alert-danger">Password must contain at least one special character from !@#$%^&*.</div>');
            return false;
        }

        // AJAX Request
        $.ajax({
            type: 'POST',
            url: 'register',
            contentType: "application/x-www-form-urlencoded",
            data: {
                fullName: fullName,
                phone: phone,
                password: password,
                email: email
            },
            success: function (response) {
				
                if (response === "Email already exists. Please log in." || 
                    response === "Phone number already exists. Please log in." ||
                    response === "Full name already exists. Please choose a different name.") {
						
                    alert(response); // Show alert for any duplicate
					
					
					$("#fullName").after('<div class="alert alert-danger">user name already exist.</div>');
					$("#phone").after('<div class="alert alert-danger">phone number  Already exist.</div>');
					$("#email").after('<div class="alert alert-danger">email already exist.</div>');
	


                } else {
			
					alert("account created successfully pleasse log-in");
                    window.location.href = '/MysoreMart/login'; // Redirect to user dashboard if successful
                }
            },
            error: function (xhr, status, error) {
                alert('Registration Failed: ' + xhr.responseText); // Error message
            }
        });
    });
});
