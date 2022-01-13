class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_account!
  def index
    @q = Category.ransack(params[:q])
    @pagy, @categories = pagy(@q.result(distinct: true),items:20)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    @category.name = params[:category][:name]
    if @category.save
      flash[:success] = "Add new category <b>" + @category.name +  "</b> successfully!"
      redirect_to categories_path
    else
      flash[:danger] = "Fill up name input!"
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Updated category <b>" + @category.name +  "</b>!"
      redirect_to categories_path
    else
      flash[:danger] = "Fill up name input!"
      render 'edit'
    end
  end

  def destroy
    category_name = @category.name
   @category.destroy
   flash[:success] = "Deleted category <b>" + category_name +  "</b>!"
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
