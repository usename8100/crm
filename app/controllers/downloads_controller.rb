class DownloadsController < ApplicationController
 def show
	  respond_to do |format|
	    format.pdf { send_proposal_pdf }
	  end
  end
 
  private
	  def proposal_pdf
	    proposal = Proposal.find(params[:proposal_id])
	    lead = Customer.find(proposal.customer_id)
	    taxes = Tax.all
	    table_items = ProposalItem.where(proposal_id: proposal.id)
	    staff = Staff.find(lead.staff_id)
	    account = Account.find(staff.user_id)
	    ProposalPdf.new(proposal, taxes, lead, table_items, account)
	  end
	 
	  def send_proposal_pdf
	    send_file proposal_pdf.to_pdf,
	      filename: proposal_pdf.filename,
	      type: "application/pdf",
	      disposition: "inline"
	  end
end
