class Product < ActiveRecord::Base
	has_many :line_items
	has_many :product_categories, :dependent => :destroy
	has_many :categories, :through => :product_categories

	validates_presence_of :name, :unit_price, :description, :quantity, :sku, :brand, :model_num
end
