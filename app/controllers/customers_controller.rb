class CustomersController < ApplicationController
  def index
    #@customers = Customer.where(customer_role_id: 2)
    @q = Customer.where(customer_role_id: 2).ransack(params[:q])
    @customers = @q.result(distinct: true)
  end

  def edit
    @customer = Customer.find(params[:id])
    @staffs = Staff.all
  end
  def update
    @customer = Customer.find(params[:id])
    customer_name = params[:customer][:name]
    phone = params[:customer][:phone]
    email = params[:customer][:email]
    website = params[:customer][:website]
    staff_id = params[:customer][:staff_id]
    notes = params[:customer][:note]
    status = params[:customer][:status]
    source = params[:customer][:source]
    city = params[:customer][:city]
    detail_address = params[:customer][:detail_address]

    if @customer.update(name: customer_name, phone: phone, email: email, website: website, note: notes, status: status, source: source, city: city, detail_address: detail_address)
      flash[:success] = "Updated customer <b>" + customer_name +  "</b>!"
      redirect_to customers_path
    else
      render 'edit'
    end
  end

  def show
    @customer = Customer.find(params[:id])
    staff = Staff.find(@customer.staff_id)
    @staff_acc = Account.find(staff.user_id)
  end

  def destroy
    @customer = Customer.find(params[:id])
    customer_name = @customer.name
    @customer.destroy
    flash[:success] = "Deleted customer <b>" + customer_name +  "</b>!"
    redirect_to customers_path
  end
end
