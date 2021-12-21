class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy] 
  def index
    @items= Item.all
    #@categories = Category.where(id: @products.category_id)
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def destroy
   @item.destroy
   redirect_to products_path
  end

  def create
    @categories = Category.all
    @item = Item.new(item_params)
    if @item.save
      #flash[:info] = "ok"
      redirect_to products_path
    else
      render 'new'  
    end
  end 
  
  def edit
    @categories = Category.all
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
