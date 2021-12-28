class ReportsController < ApplicationController
  def proposals
    @q = Proposal.ransack(params[:q])
    @proposals = @q.result
  end

  def invoices
    @invoices = Invoice.all
  end
end
