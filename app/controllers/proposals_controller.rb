class ProposalsController < ApplicationController
  def index
    @q = Proposal.ransack(params[:q])
    @proposals = @q.result(distinct: true)
  end

  def new
    @proposal = Proposal.new
    @lead = Customer.find(params[:customer_id])
    @items = Item.where(status: true)
    @categories = Category.all
    @taxes = Tax.all
  end

  def edit
  end
  
  def show
    @proposal = Proposal.find(params[:id])
    @lead = Customer.find(params[:customer_id])
    @table_items = ProposalItem.where(proposal_id: @proposal.id)
    @items = Item.all
  end

  def report
    
  end

  def create
    list_item_ids = params[:proposal][:list_item_ids]
    list_item_quans = params[:proposal][:list_item_quans]
    list_item_tax_ids = params[:proposal][:list_item_tax_ids]
    subject = params[:proposal][:subject]
    date_start = params[:proposal][:datestart]
    date_end = params[:proposal][:dateend]
    status = params[:proposal][:status]
    customer_id = params[:proposal][:customer_id]
    discount = params[:proposal][:discount]
    total = params[:proposal][:total]

    @proposal = Proposal.new
    @proposal.customer_id = customer_id.to_i
    @proposal.subject = subject
    @proposal.start_date = date_start
    @proposal.end_date = date_end
    @proposal.status = status
    @proposal.discount = discount.to_i
    @proposal.total = total

    list_item_ids_arr = list_item_ids.split(",")
    list_item_quans_arr = list_item_quans.split(",")
    list_item_tax_ids_arr = list_item_tax_ids.split(",")

    if @proposal.save
      list_item_ids_arr.length.times do |index|
        item = Item.find(list_item_ids_arr[index].to_i)
        amount = item.price.to_i * list_item_quans_arr[index].to_i
        tax_id = list_item_tax_ids_arr[index].to_i

        @proposal_item = ProposalItem.new
        @proposal_item.proposal_id = @proposal.id
        @proposal_item.item_id = item.id
        @proposal_item.quantity = list_item_quans_arr[index].to_i
        @proposal_item.price = item.price.to_i
        @proposal_item.amount = amount
        if tax_id!=0
          @proposal_item.tax_id = tax_id
        end
        @proposal_item.save
        
      end
      redirect_to proposal_lead_path(customer_id)
    else
      redirect_to new_lead_proposal_path(customer_id)
    end
  end

  def destroy
    proposal = Proposal.find(params[:id])
    if proposal.destroy
      redirect_to proposal_lead_path(params[:customer_id])
    else
      redirect_to root_path
    end
  end

  def update
    list_item_ids = params[:proposal][:list_item_ids]
    list_item_quans = params[:proposal][:list_item_quans]
    list_item_tax_ids = params[:proposal][:list_item_tax_ids]
    subject = params[:proposal][:subject]
    date_start = params[:proposal][:datestart]
    date_end = params[:proposal][:dateend]
    status = params[:proposal][:status]
    customer_id = params[:customer_id]
    discount = params[:proposal][:discount].to_i
    subtotal = params[:proposal][:total].to_i
    total = subtotal - subtotal*(discount/100)

    @proposal = Proposal.find(params[:id])

    list_item_ids_arr = list_item_ids.split(",")
    list_item_quans_arr = list_item_quans.split(",")
    list_item_tax_ids_arr = list_item_tax_ids.split(",")

    if @proposal.update(subject: subject, start_date: date_start, end_date: date_end, status: status, discount: discount, total: total)
      ProposalItem.where(proposal_id: params[:id].to_i).destroy_all

      list_item_ids_arr.length.times do |index|
        item = Item.find(list_item_ids_arr[index].to_i)
        amount = item.price.to_i * list_item_quans_arr[index].to_i
        tax_id = list_item_tax_ids_arr[index].to_i

        @proposal_item = ProposalItem.new
        @proposal_item.proposal_id = @proposal.id
        @proposal_item.item_id = item.id
        @proposal_item.quantity = list_item_quans_arr[index].to_i
        @proposal_item.price = item.price.to_i
        @proposal_item.amount = amount
        if tax_id!=0
          @proposal_item.tax_id = tax_id
        end
        @proposal_item.save
        
      end
      redirect_to proposal_lead_path(customer_id)
    else
      redirect_to new_lead_proposal_path(customer_id)
    end
  end

  def send_proposal
    contact = Contact.find(params[:contact_id].to_i)
    proposal = Proposal.find(params[:proposal_id].to_i)
    if ProposalMailer.proposal_mailer(proposal.id, contact).deliver_now
      redirect_to proposal_lead_path(proposal.customer_id)
    else
      redirect_to root_path
    end   
  end
end
