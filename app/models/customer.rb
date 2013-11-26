class Customer < ActiveRecord::Base
	has_one :order
	validates_presence_of :name, :phone, :email, :address1, :address2, :city, :state, :zip
end
