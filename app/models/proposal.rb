class Proposal < ApplicationRecord
	def get_subtotal
		discount = self.discount.to_f/100
		total = self.total.to_i
		(total/(1 - discount)).round(0)
	end

	def get_customer
		Customer.find(self.customer_id).name	
	end
end
