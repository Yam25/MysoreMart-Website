
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f7f7f7;
	margin-top: 50px;
}

.container {
	max-width: 600px;
	margin: 0 auto;
}

h2 {
	color: #2c3e50;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
}

.card {
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.form-group label {
	font-weight: bold;
	color: #333;
}

.form-control {
	border-radius: 5px;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
}

.btn-primary {
	background-color: #3498db;
	color: white;
	border: none;
	padding: 12px 20px;
	border-radius: 5px;
	width: 100%;
	font-size: 18px;
	transition: background-color 0.3s;
}

.btn-primary:hover {
	background-color: #2980b9;
}

.alert {
	display: none;
	background-color: #d4edda;
	color: #155724;
	padding: 10px;
	margin-bottom: 20px;
	border-radius: 5px;
}

.payment-fields {
	display: none;
}
/* Hide default spinners in number input */
input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Checkout</h2>

		<!-- Success message -->
		<div class="alert" id="successMessage">Order placed
			successfully! Thank you for your purchase.</div>

		<!-- Checkout form -->
		<div class="card">
			<form action="/submitOrder" method="POST" id="checkoutForm">
			
				<div class="form-group">
					<label for="name">Name</label> <input type="text"
						class="form-control" id="name" name="name"
						required title="Please enter name">
				</div>

				<!-- Shipping Address -->
				<div class="form-group">
					<label for="address">Shipping Address</label>
					<textarea class="form-control" id="address" name="address" rows="4"
						required></textarea>
				</div>

				<!-- Phone Number -->
				<div class="form-group">
					<label for="phone">Phone Number</label> <input type="text"
						class="form-control" id="phone" name="phone" pattern="\d{10}"
						required title="Please enter a 10-digit phone number">
				</div>

				<!-- Landmark (Optional) -->
				<div class="form-group">
					<label for="landmark">Landmark (Optional)</label> <input
						type="text" class="form-control" id="landmark" name="landmark">
				</div>

				<!-- City and Pincode -->
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="city">City</label> <input type="text"
							class="form-control" id="city" name="city" value="Mysore"
							disabled>
					</div>

					<div class="form-group col-md-6">
						<label for="pincode">Pincode</label> <input type="text"
							class="form-control" id="pincode" name="pincode" pattern="\d{6}"
							required title="Please enter a valid 6-digit pincode">
					</div>
				</div>

				<!-- State -->
				<div class="form-group">
					<label for="state">State</label> <input type="text"
						class="form-control" id="state" name="state" value="Karnataka"
						disabled>
				</div>

				<!-- Payment Method -->
				<div class="form-group">
					<label for="paymentMethod">Payment Method</label> <select
						class="form-control" id="paymentMethod" name="paymentMethod"
						required>
						<option value="opn">Select Payment required</option>
						<option value="Credit Card">Credit Card</option>
						<option value="Debit Card">Debit Card</option>
						<option value="PayPal">PayPal</option>
						<option value="Cash On Delivery">Cash On Delivery</option>
					</select>
				</div>

				<!-- Payment specific fields -->
				<div class="payment-fields" id="creditCardFields">
					<div class="form-group">
						<label for="cardNumber">Credit Card Number</label> <input
							type="text" class="form-control" id="cardNumber"
							name="cardNumber" required>
					</div>
					<div class="form-group">
						<label for="expiryDate">Expiration Date</label> <input type="text"
							class="form-control" id="expiryDate" name="expiryDate"
							placeholder="MM/YY" required>
					</div>
					<div class="form-group">
						<label for="cvv">CVV</label> <input type="text"
							class="form-control" id="cvv" name="cvv" required>
					</div>
				</div>

				<div class="payment-fields" id="paypalFields">
					<div class="form-group">
						<label for="paypalEmail">PayPal Email</label> <input type="email"
							class="form-control" id="paypalEmail" name="paypalEmail" required>
					</div>
				</div>

				<!-- Total Amount -->
				<div class="form-group">
					<label for="totalAmount">Total Amount</label> <input type="text"
						class="form-control" id="totalAmount" name="totalAmount" value=""
						disabled>
				</div>

				<!-- Submit Button -->
				<button type="submit" class="btn btn-primary" id="order" >Place Order</button>
			</form>
		</div>
	</div>

	<!-- External JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	
	<script>
        function getQueryParameter(param) {
            let urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(param);
        }
 
        $(document).ready(function() {
            // Get totalAmount from URL query parameters
            let totalAmount = getQueryParameter('totalAmount');
            
            if (totalAmount) {
                $('#totalAmount').val(totalAmount);
            }
 
            // Toggle payment-specific fields based on selected payment method
            $('#paymentMethod').change(function() {
                var paymentMethod = $(this).val();
                $('.payment-fields').hide(); // Hide all payment fields
                
                // Show relevant payment fields
                if (paymentMethod === 'Credit Card' || paymentMethod === 'Debit Card') {
                    $('#creditCardFields').show();
                } else if (paymentMethod === 'PayPal') {
                    $('#paypalFields').show();
                }
            });
 
            // Trigger change event on page load to show the correct payment fields
            $('#paymentMethod').trigger('change');
            $('#order').on("click",function(){
            	alert("Order placed successfully! Thank you for shopping with us.");
            	window.location.href="/MysoreMart/userDashboard";
            });
        });
    </script>
</body>
</html>

