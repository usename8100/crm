class ReportsController < ApplicationController
  def proposals
    @search = Proposal.search(params[:q])
    @proposals = @search.result
  end

  def invoices
    @invoices = Invoice.all
  end
end
