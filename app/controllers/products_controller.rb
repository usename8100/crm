class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy] 
  before_action :authenticate_account!
  def index
    @q = Item.ransack(params[:q])
    @pagy, @items = pagy(@q.result.includes(:tax), items: 20)
    @items2 = Item.where(status: true)
  end

  def new
    @item = Item.new
    @categories = Category.all
    @taxes = Tax.all
  end

  def destroy
   item_name = @item.name
   @item.destroy
   flash[:success] = "Deleted product <b>" + item_name + "</b>!"
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
    @item.save
  end 

  def edit
    @categories = Category.all
    @taxes = Tax.all
  end

  def update
    @categories = Category.all
    if @item.update(item_params)
      flash[:success] = "Updated product <b>" +@item.name+ "</b>!"
      redirect_to products_path
    else
      redirect_to edit_product_path(@item.id)
    end
  end

  def show
    @item = Item.find(params[:item_id])
    @taxes = Tax.all
  end

  def convert_status
    item = Item.find(params[:id])
    s = true
    if item.status == true
      s = false
      flash_string = "Product <b>" + item.name + "</b> is inactivating!"
    else
      flash_string = "Product <b>" + item.name + "</b> is activating!"
    end
    if item.update(status: s)
      flash[:success] = flash_string
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
