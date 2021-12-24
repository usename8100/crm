class Customer < ApplicationRecord
	def get_staff_name
		Account.find(self.staff_id).name
	end

	def get_staff_phone
		Account.find(self.staff_id).phone
	end
end
