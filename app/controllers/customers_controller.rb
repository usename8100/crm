class CustomersController < ApplicationController
  def index
    @leads = Customer.where(customer_role_id: 1)
  end

  def new
  end

  def edit
  end

  def show
  end
end
