class ReportsController < ApplicationController
  
  def proposals
    @search = Proposal.search(params[:q])
    @proposals = @search.result
  end

  def search
    proposals
    render :proposals
  end

  def invoices
    @invoices = Invoice.all
  end
end
