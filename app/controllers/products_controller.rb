class ProductsController < ApplicationController
  def index
    @items = Item.all
    #@categories = Category.where(id: @products.category_id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:info] = "ok"
      redirect_to root_url
    else
      render 'new'  
    end
  end

  def edit
  end

  def show
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :category_id, :quantity, :price, :tax_id) 
  end
end
