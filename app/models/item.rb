class Item < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }
	validates :category_id, presence: true
	validates :price, presence: true, length: {minimum: 4}, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
	belongs_to :category
end
