module ApplicationHelper
	def prettify_address(customer)
		address = customer.address1
		
		address += "<br>" + customer.address2 unless customer.address2.blank?

		address += "<br>" + customer.city
		address += ", " + customer.state
		address += " " + customer.zip
	end
end
