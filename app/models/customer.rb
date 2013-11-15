class Customer < ActiveRecord::Base
	has_many :orders
	validates_presence_of :name, :phone, :email, :address1, :address2, :city, :state, :zip
end
