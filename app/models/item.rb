class Item < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }
	validates :category_id, presence: true
	validates :price, presence: true, length: {minimum: 4}, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
	belongs_to :category
	belongs_to :tax
	def get_tax
		Tax.find(self.tax_id)
	end
end
