class AppointmentsController < ApplicationController
  def new
  end

  def create
    @appointment = Appointment.new
    @appointment.customer_id = params[:customer_id]
    @appointment.contact_id = params[:contact_id]
    @appointment.date = params[:datetime]
    @appointment.subject = params[:subject]
    @appointment.content = params[:notes]
    if @appointment.save
      redirect_to appointment_lead_path(params[:customer_id])
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    customer_id = params[:appointment][:customer_id]
    date = params[:appointment][:datetime]
    subject = params[:appointment][:subject]
    content = params[:appointment][:notes]
    contact_id = params[:appointment][:contact_id]
    if @appointment.update(date: date, subject: subject, content: content,contact_id: contact_id)
      redirect_to appointment_lead_path(customer_id) 
    end
  end

  def destroy
    appointment = Appointment.find(params[:id])
    if appointment.destroy
      redirect_to appointment_lead_path(params[:lead_id])
    end
  end

  def edit
  end

  def send_appointment
    lead = Customer.find(params[:lead_id])
    if AppointmentMailer.appointment_mailer(lead, params[:id]).deliver_now
      redirect_to appointment_lead_path(params[:lead_id])
    else
      redirect_to root_path
    end   
  end
end
