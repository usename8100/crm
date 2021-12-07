class ContactsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new
    @contact.customer_id = params[:customer_id]
    @contact.name = params[:name]
    @contact.phone = params[:phone]
    @contact.email = params[:email]
    @contact.designation = params[:designation]
    @contact.notes = params[:notes]
    if @contact.save
      redirect_to contact_lead_path(params[:customer_id])
    end 
  end

  def update
    @contact = Contact.find(params[:id])
    customer_id = params[:contact][:customer_id]
    cname = params[:contact][:name]
    phone = params[:contact][:phone]
    email = params[:contact][:email]
    designation = params[:contact][:designation]
    notes = params[:contact][:notes]
    if @contact.update(customer_id: customer_id, name: cname, phone: phone, email: email, designation: designation, notes: notes)
      redirect_to contact_lead_path(customer_id)
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to contact_lead_path(params[:lead_id])
  end
end
