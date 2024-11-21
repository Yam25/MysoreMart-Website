

$(document).ready(function() {

	// Update the cart totals on page load
	updateCart();
	var productName = $(this).closest(".product").find('.card-title').text().trim();

	// Increase quantity of an item
	$(".increase-qty").click(function() {
		let quantityInput = $(this).siblings(".quantity");
		let currentQuantity = parseInt(quantityInput.val());
		let newQuantity = currentQuantity + 1; 
		quantityInput.val(newQuantity); 

		let cartId = $(this).data('cart-id');
		let userId = $(this).data('user-id');

		$.ajax({
			url: baseUrl1, 
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			data: {
				cartId: cartId,
				newQuantity: newQuantity 
			},
			success: function(response) {
				updateCart(); 
			},
			error: function(xhr) {
				alert('Error updating quantity: ' + xhr.responseText);
			}
		});
	}); 
	
	// Decrease quantity of an item
	$(".decrease-qty").click(function() {
		let quantityInput = $(this).siblings(".quantity");
		let currentQuantity = parseInt(quantityInput.val());
		let newQuantity = currentQuantity - 1;
		quantityInput.val(newQuantity); 

		let cartId = $(this).data('cart-id');
		let userId = $(this).data('user-id');

		$.ajax({
			url: baseUrl2, 
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			data: {
				cartId: cartId,
				newQuantity: newQuantity 
			},
			success: function(response) {
				updateCart();
			},
			error: function(xhr) {
				alert('Error updating quantity: ' + xhr.responseText);
			}
		});
	});




$(".remove-item").click(function() {
	var cartId = $(this).data("cart-id");

	// AJAX request to remove item from the cart
	$.ajax({
		url: baseUrl,
		type: 'POST',
		contentType: 'application/x-www-form-urlencoded',
		data: { cartId: cartId },
		success: function(response) {
			$("#remove-alert").fadeIn(400).delay(2000).fadeOut(400);
			$(this).closest(".product").remove();
			updateCart();
		}.bind(this),
		error: function(xhr) {
			alert('Error deleting item: ' + xhr.responseText);
		}
	});
});

// Function to update the cart totals in UI
function updateCart() {
	let subtotal = 0;
	let itemCount = 0;

	
	$(".product").each(function() {
		let price = parseFloat($(this).data("price"));
		let quantity = parseInt($(this).find(".quantity").val());
		subtotal += price * quantity;
		itemCount += quantity; 
	});

	
	let gst = subtotal * 0.05; // 5% GST
	let deliveryFee;

	// Determine delivery fee based on subtotal
	if (subtotal < 100) {
		deliveryFee = 50;
	} else if (subtotal >= 100 && subtotal <= 199) {
		deliveryFee = 30;
	} else if (subtotal >= 200 && subtotal < 300) {
		deliveryFee = 15;
	} else {
		deliveryFee = 0;
	}

	let total = subtotal + gst + deliveryFee;

	// Update the displayed totals
	$("#subtotal").text(subtotal.toFixed(2));
	$("#gst").text(gst.toFixed(2));
	$("#delivery-fee-value").text(deliveryFee.toFixed(2));
	$("#cart-total").text(total.toFixed(2));


	$("#cart-item-count-nav").text(itemCount);
	$("#cart-item-count").text(itemCount+ " items in your cart");


	if ($(".product").length === 0) {
		$("#empty-cart").show();
		$("#card-sec").hide();
		$("#cart").hide();
	} else {
		$("#empty-cart").hide();
		$("#card-sec").show();
		$("#cart").show();
	}
	// Prepare checkout URL with total amount
	    let checkoutUrl = "checkout?totalAmount=" + encodeURIComponent(total.toFixed(2));
	 
	    // When the user clicks the checkout button, redirect them to the checkout page
	    $("#checkout-button").click(function(event) {
	        event.preventDefault();  // Prevent default action of the anchor tag
	        window.location.href = checkoutUrl;  // Redirect with totalAmount in the URL
	    });
}
});