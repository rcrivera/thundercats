class StoreController < ApplicationController
  def index
     category_id = params[:category_id]

    if category_id.blank?
      @products = Product.all
    else
      @products = Category.find(category_id).products
    end  
  	
  	#session.clear
  	if session[:cart].nil?
  		session[:cart] = {}
  	end
  	@cart = session[:cart]

    #Calculating cart total
    @sum = Cart.calculate_cart_total(@cart)
    

  end


  def add_cart
  	product_id = params[:product_id]
  	quantity = params[:quantity].to_i
    @product_name = params[:product_name]
    price = params[:price].to_f

  	#session[:cart] = [product_id,quantity]
  	#line_item = {product_id: product_id, quantity: quantity}

  	if session[:cart].nil?
  		session[:cart] = {}
  	end
  	current_cart = session[:cart]
  	if current_cart[product_id].nil?
  		current_cart[product_id] = [quantity,@product_name,price]

  	else
  		value_array = current_cart[product_id]
      old_quantity = value_array[0]
      new_quantity = old_quantity + quantity
  		current_cart[product_id] = [new_quantity,@product_name,price]
  	end

  	@cart = current_cart

  	Rails.logger.info "CART= #{session[:cart]}"

    @sum = Cart.calculate_cart_total(@cart)

  end
end
