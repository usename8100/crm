class ProposalMailer < ApplicationMailer
	default from: "trinhminhlongad@gmail.com"

	def proposal_mailer proposal_id, contact
		@proposal = Proposal.find(proposal_id)
		@lead = Customer.find(@proposal.customer_id)
    @table_items = ProposalItem.where(proposal_id: @proposal.id)
    @items = Item.all
    @contact = contact
    staff = Staff.find(@lead.staff_id)
    @account = Account.find(staff.user_id)
    @taxes = Tax.all

		mail to: @contact.email, subject: @proposal.subject
	end
end
