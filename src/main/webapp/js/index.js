


	$(document).ready(function () {
	    $(".add-to-cart").on("click", function (e) {
	        e.preventDefault(); 

	        const $card = $(this).closest('.card'); 
	        const productName = $card.find('.card-title').text().trim(); 
	        const priceText = $card.find('.card-text strong').text(); 
	        const price = parseFloat(priceText.replace(/[^0-9.-]+/g, "")); 
	        const selectedQuantity = $card.find('.card-text.weight').text().trim(); 
	        const imgUrl = $card.find('img').attr('src'); 

	        $.ajax({
	            type: "POST",
	            url: baseUrl, //using baseUrl which is in index.jsp
	            contentType: 'application/x-www-form-urlencoded',
	            data: {
	                pname: productName,
	                price: price,
	                selectedQuantity: selectedQuantity,
	                img: imgUrl 
	            },
	            success: function (response) {
				            
				            $("#success-alert").fadeIn(400).delay(2000).fadeOut(400);
				            if (response.cartItemCount !== undefined) {
				                $("#cart-count").text(response.cartItemCount);
				                if (response.cartItemCount > 0) {
				                    $("#cart-count").show(); 
				                } else {
				                    $("#cart-count").hide(); 
				                }
				            }
				        },
	            error: function () {
		          alert("Login is required to add items to the cart. Redirecting to login page.");
			      window.location.href = "/MysoreMart/login"; 
					        
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
	
	
	
