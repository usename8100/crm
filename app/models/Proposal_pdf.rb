require "render_anywhere"
 
class ProposalPdf
  include RenderAnywhere
 
  def initialize(proposal, taxes, lead, table_items, account)
    @proposal = proposal
    @taxes = taxes
    @lead = lead
    @table_items = table_items
    @account = account
  end
 
  def to_pdf
    kit = PDFKit.new(pdf_html, page_size: 'A4')
    kit.to_file("#{Rails.root}/public/proposal.pdf")
  end
 
  def filename
    "Proposal #{proposal.id}.pdf"
  end
 
  private
 
    attr_reader :proposal
 
    def pdf_html
      #render template: "proposals/pdf", layout: "proposal_pdf", locals: { proposal: proposal }
      ActionController::Base.new.render_to_string(template: 'proposals/pdf.html.erb', layout: 'proposal_pdf.html.erb', 
        locals: { proposal: @proposal, taxes: @taxes,lead: @lead, table_items:  @table_items, account: @account})

    end
end

