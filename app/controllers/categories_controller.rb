class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(name: params[:category][:name])
    if @category.save
      render 'new'
    else
      redirect_to categories_path
    end
  end

  def edit
  end

  def show
  end

  private
  def category_params
    params.require(:category).permit(:name) 
  end
end
