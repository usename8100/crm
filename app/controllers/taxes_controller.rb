class TaxesController < ApplicationController
  before_action :set_tax, only: %i[edit update destroy]
  def index
    @taxes = Tax.all
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
      redirect_to taxes_path
    else
      render 'new'
    end
  end

  def update
    name = params[:tax][:name]
    tax_percent = params[:tax][:tax_percent]
    if @tax.update(name: name, tax_percent: tax_percent)
      redirect_to taxes_path
    else
      render 'update'
    end
  end

  def destroy
    @tax.destroy
    redirect_to taxes_path
  end
  
  private
  def set_tax
    @tax = Tax.find(params[:id])
  end
end
