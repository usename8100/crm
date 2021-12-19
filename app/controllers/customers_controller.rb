class CustomersController < ApplicationController
  def index
    @customers = Customer.where(customer_role_id: 2)
  end

  def new
  end

  def edit
  end

  def show
    @customer = Customer.find(params[:id])
    staff = Staff.find(@customer.staff_id)
    @staff_acc = Account.find(staff.user_id)
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end
end
