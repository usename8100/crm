class Contact < ApplicationRecord
	validates :name, presence: true
	def get_customer_id
		customer = Customer.find(self.customer_id)
		customer.id
	end
end
