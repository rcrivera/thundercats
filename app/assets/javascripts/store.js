// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function (){
	$(document).on('click','#toggle_cart_button',function(){

	
		var display = $('#cart_detail_panel').css('display');
		if(display == "none"){
			$('#cart_detail_panel').slideDown();
		}
		else{
			$('#cart_detail_panel').slideUp();
		}
});

	$('.add-to-cart-button').click(function (){
		var value = $(this).siblings('.quantity').val();
		var value_int = parseInt(value);

		//var product_id = $(this).siblings('.product-id').val();
		var product_id = $(this).data('product-id');
		var product_name = $(this).data('product-name');
		var price = $(this).data('price');
		

		if (value_int > 0) {
			//Make an AJAX call
			$.post('/store/add_cart',{
				quantity : value_int, 
				product_id : product_id, 
				product_name : product_name,
				price : price
			});
		} else {
			alert(value_int + "is not a number");
		}
	});
});
