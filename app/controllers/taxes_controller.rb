class TaxesController < ApplicationController
  before_action :set_tax, only: %i[edit update destroy]
  before_action :authenticate_account!
  def index
    @q = Tax.ransack(params[:q])
    @pagy, @taxes = pagy(@q.result, items: 20)
  end

  def new
    @tax = Tax.new
  end

  def edit
  end

  def show
  end

  def create
    @tax = Tax.new
    @tax.name = params[:tax][:name]
    @tax.tax_percent = params[:tax][:tax_percent]
    if @tax.save
      flash[:success] = "Add new tax <b>"  + @tax.name + "(" + @tax.tax_percent.to_s + "%)</b> successfully!"
      redirect_to taxes_path
    else
      render 'new'
    end
  end

  def update
    name = params[:tax][:name]
    tax_percent = params[:tax][:tax_percent]
    if @tax.update(name: name, tax_percent: tax_percent)
      flash[:success] = "Updated tax <b>"  + @tax.name + "(" + @tax.tax_percent.to_s + "%)</b>!"
      redirect_to taxes_path
    else
      render 'update'
    end
  end

  def destroy
    tax_name = @tax.name
    @tax.destroy
    flash[:success] = "Deleted tax <b>" +tax_name+ "</b>!"
    redirect_to taxes_path
  end
  
  private
  def set_tax
    @tax = Tax.find(params[:id])
  end
end
