class HomeController < ApplicationController
  def index
    if !account_signed_in?
      redirect_to new_account_session_path
    end
    @total_customer = Customer.where(customer_role_id: 2).count
    @total_lead = Customer.where(customer_role_id: 1).count
    @total_proposal = Proposal.all.count
    @total_invoice = Invoice.all.count
    @total_product = Item.all.count
  end
end
