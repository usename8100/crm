class Customer < ApplicationRecord
	def get_staff_name
		Account.find(self.staff_id).name
	end
end
