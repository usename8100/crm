class Staff < ApplicationRecord
	def get_name
		Account.find(self.user_id).name
	end

	def get_email
		Account.find(self.user_id).email
	end
end
