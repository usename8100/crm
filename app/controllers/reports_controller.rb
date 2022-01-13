class ReportsController < ApplicationController
  
  def proposals
    @search = Proposal.search(params[:q])
    @pagy, @proposals = pagy(@search.result, items: 15)
  end

  def search
    proposals
    render :proposals
  end

  def invoices
    @invoices = Invoice.all
  end
end
