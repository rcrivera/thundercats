class StoreController < ApplicationController
  def index
  	@products = Product.all
  end


  def add_cart
  end
end
