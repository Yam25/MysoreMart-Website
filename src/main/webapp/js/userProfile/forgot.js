
    $(document).ready(function() {
        $('#forgot').submit(function(event) {
            event.preventDefault();  // Prevent the default form submission

            var emailOrPhone = $('#emailOrPhone').val();  // Get the entered value

            // Make an AJAX request to check if the email or phone exists
            $.post('<c:url value="/checkEmailOrPhone"/>', { emailOrPhone: emailOrPhone }, function(response) {
                if (response === 'not_found') {
                    $('#error-msg').removeClass('d-none');  // Show the error message
                    alert("User Not Found");
                } else {
                    // If found, submit the form
                    alert(" An OTP has been sent to your email/phone number.")
                    $('#forgot')[0].submit();
                }
            }).fail(function() {
                alert("Error checking user. Please try again.");
            });
        });
    });
