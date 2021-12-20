class CallsController < ApplicationController
  def new
    @call = Call.new
  end

  def edit
  end

  def create
    customer_id = params[:customer_id]
    staff_id = Customer.find(params[:customer_id]).staff_id
    @call = Call.new
    @call.customer_id = customer_id.to_i
    @call.date = params[:date]
    @call.description = params[:description]
    @call.staff_id = staff_id.to_i
    if @call.save
      redirect_to call_lead_path(params[:customer_id])
    end 
  end

  def destroy
    call = Call.find(params[:id])
    if call.destroy
      redirect_to call_lead_path(params[:lead_id])
    end
  end

  def update
    @call = Call.find(params[:id])
    customer_id = params[:call][:customer_id]
    date = params[:call][:date]
    description = params[:call][:description]
    if @call.update(date: date, description: description)
      redirect_to call_lead_path(customer_id)
    end
  end
end
