class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy] 
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result.includes(:tax)
  end

  def new
    @item = Item.new
    @categories = Category.all
    @taxes = Tax.all
  end

  def destroy
   @item.destroy
   redirect_to products_path
  end

  def create   
    @item = Item.new(item_params)
    if @item.save
      redirect_to products_path
    else
      redirect_to new_product_path
    end
  end 
  
  def create_from_proposal
    @categories = Category.all
    @item = Item.new
    @item.name = params[:name]
    @item.category_id = params[:category_id].to_i
    @item.price = params[:price]
    @item.tax_id = params[:tax_id].to_i
    @item.status = params[:status]
    customer_id = params[:customer_id].to_i
    if @item.save
      redirect_to new_lead_proposal_path(customer_id)
    else
      redirect_to root_path
    end
  end 

  def edit
    @categories = Category.all
    @taxes = Tax.all
  end

  def update
    @categories = Category.all
    if @item.update(item_params)
      #flash[:success] = "Update successfully!"
      redirect_to products_path
    else
      redirect_to edit_product_path(@item.id)
    end
  end

  def show
  end

  def convert_status
    item = Item.find(params[:id])
    s = true
    if item.status == true
      s = false
    end
    if item.update(status: s)
      redirect_to products_path
    else
      redirect_to root_path
    end
  end
  
  private

  def set_product
      @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :price, :tax_id, :status) 
  end
end
