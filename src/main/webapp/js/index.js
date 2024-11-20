

$(document).ready(function() {
// Use event delegation to handle clicks on dynamically generated "Add to Cart" buttons
 $(document).on('click', '.add-to-cart', function(e) {
        e.preventDefault(); 

        const productName = $(this).data('product-name');
        const price = $(this).data('product-price');
        const selectedQuantity = $(this).data('product-quantity');
        const imgUrl = $(this).data('product-img');  /* if you want to get data dynamically then we need to pass data-attr explicity for add to cart */

       
        $.ajax({
            type: "POST",
            url: baseUrl, // This is the URL where products will be added to cart
            contentType: 'application/x-www-form-urlencoded',
            data: {
                productName: productName,
                price: price,
                selectedQuantity: selectedQuantity,
                img: imgUrl
            },
            success: function(response) {
                // Show success message
                $("#success-alert").fadeIn(400).delay(2000).fadeOut(400);

                // Update the cart item count in the header
                if (response.cartItemCount !== undefined) {
                    $("#cart-count").text(response.cartItemCount);
                    if (response.cartItemCount > 0) {
                        $("#cart-count").show(); // Show the cart count if there are items
                    } else {
                        $("#cart-count").hide(); // Hide the cart count if it's zero
                    }
                }
            },
            error: function(xhr) {
                alert('Login is required to add items to the cart. Redirecting to login page.');
                window.location.href = "/MysoreMart/login"; // Redirect to login page if user is not logged in
            }
        });
    });
});

	
	/*// Dynamic price update based on selected quantity
			    $('.product').each(function() { //each card class should have common class name like product or sm
			        const $card = $(this);

			        const quantityDrop = $card.find('select[name="selectedQuantity"]'); 
			        const priceTextElement = $card.find('.card-text strong');

			       
			        quantityDrop.on("change", function() {
			            let selectedOption = $(this).find(':selected'); 
			            let selectedPrice = parseFloat(selectedOption.data('price')); 
			            priceTextElement.text(`₹${selectedPrice}`); 
			        });
			    });*/

	/* Divyananda's index.js for only  Front Page 

	document.addEventListener('DOMContentLoaded', function () {
			
		  const productContainer = document.querySelector('#menu'); 

		  if (productContainer) {
		    productContainer.addEventListener('change', function (event) {
		      
		      if (event.target && event.target.tagName.toLowerCase() === 'select') {
		        const selectedOption = event.target.options[event.target.selectedIndex];
		        const price = selectedOption.getAttribute('data-price');
		        const priceElement = event.target.closest('.card-body').querySelector('strong');
		        
		        if (priceElement) {
		          priceElement.textContent = `₹${price}`;
		        }
		      }
		    });

		    
		    const selectElements = productContainer.querySelectorAll('select');
		    selectElements.forEach(function (select) {
		      const selectedOption = select.options[select.selectedIndex];
		      const priceElement = select.closest('.card-body').querySelector('strong');
		      const price = selectedOption.getAttribute('data-price');
		      if (priceElement) {
		        priceElement.textContent = `₹${price}`;
		      }
		    });
		  }
		});*/
	
	
	
