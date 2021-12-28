class Proposal < ApplicationRecord
	def get_subtotal
		discount = self.discount.to_f/100
		total = self.total.to_i
		(total/(1 - discount)).round(0)
	end

	def get_customer
		Customer.find(self.customer_id).name	
	end

	def get_subtotal_notax
		subtotal = 0
		pro_items = ProposalItem.where(proposal_id: self.id)
		pro_items.each do |item|
			total= item.price.to_i * item.quantity
			subtotal += total.to_i
		end
		subtotal
	end

	def get_total_tax
		total_amount = 0
		pro_items = ProposalItem.where(proposal_id: self.id)
		pro_items.each do |item|
			total_amount += item.amount.to_i
		end
		total_amount - self.get_subtotal_notax.to_i
	end

	def get_subtotal
		total_amount = 0
		pro_items = ProposalItem.where(proposal_id: self.id)
		pro_items.each do |item|
			total_amount += item.amount.to_i
		end
		total_amount
	end
end
