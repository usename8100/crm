class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  def index
    @q = Category.ransack(params[:q])
    @categories = @q.result(distinct: true)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    @category.name = params[:category][:name]
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @category.update(category_params)
      #flash[:success] = "Update successfully!"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
   @category.destroy
   redirect_to categories_path
  end

  private

  def set_category
      @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name) 
  end
end
