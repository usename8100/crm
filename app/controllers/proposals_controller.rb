class ProposalsController < ApplicationController
  def index
  end

  def new
    @proposal = Proposal.new
    @lead = Customer.find(params[:customer_id])
    @items = Item.all
  end

  def edit
  end

  def show
  end

  def report
    
  end

  def create
    
  end
end
