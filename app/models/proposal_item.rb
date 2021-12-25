class ProposalItem < ApplicationRecord
	def get_item_name
		Item.find(self.item_id).name
	end
end
