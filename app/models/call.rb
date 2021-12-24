class Call < ApplicationRecord
	def get_staff_name
		staff = Staff.find(self.staff_id)
		Account.find(staff.id).name
	end

	def get_customer_name
		Customer.find(self.customer_id).name
	end
end
