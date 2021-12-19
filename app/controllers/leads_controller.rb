class LeadsController < ApplicationController
	def index
		@leads = Customer.where(customer_role_id: 1)
	end

	def show
		@lead = Customer.find(params[:id])
		staff = Staff.find(@lead.staff_id)
		@staff_acc = Account.find(staff.user_id)
	end

	def new
		@lead = Customer.new
		@staffs = Staff.all
	end

	def create
		lead_name = params[:name]
		phone = params[:phone]
		email = params[:email]
		website = params[:website]
		detail_address = params[:detail_address]
		city = params[:city]
		contact_name = params[:contact_name]
		contact_phone = params[:contact_phone]
		contact_email = params[:contact_email]
		designation = params[:designation]
		contact_note = params[:contact_note]
		source = params[:source]
		staff_id = params[:staff_id]
		notes = params[:notes]
		status = params[:status]

		@lead = Customer.new
		@lead.staff_id = staff_id.to_i
		@lead.customer_role_id = 1
		@lead.name = lead_name
		@lead.detail_address = detail_address
		@lead.city = city
		@lead.phone = phone
		@lead.email = email
		@lead.source = source
		@lead.status = status
		@lead.note = notes
		@lead.website = website

		if @lead.save
			@contact = Contact.new
			@contact.customer_id = @lead.id
			@contact.name = contact_name
			@contact.phone = contact_phone
			@contact.email = contact_email
			@contact.designation = designation
			@contact.notes = contact_note
			if @contact.save
				redirect_to leads_path
			end
		else
			redirect_to new_lead_path
		end
	end

  def destroy
    @lead = Customer.find(params[:id])
    @lead.destroy
    redirect_to leads_path
  end

	def detail
		
	end

	def contact
		@contacts = Contact.where(customer_id: params[:id])
		@lead = Customer.find(params[:id])
	end

	def edit_contact
		@contact = Contact.find(params[:id])
		@lead = Customer.find(params[:lead_id])
	end

	def call
		@calls = Call.where(customer_id: params[:id])
		@lead = Customer.find(params[:id])
		@staffs = Staff.all
	end

	def edit_call
		@call = Call.find(params[:id])
		@lead = Customer.find(params[:lead_id])
	end

	def appointment
		@appointments = Appointment.where(customer_id: params[:id])
		@lead = Customer.find(params[:id])
	end

	def note
		@notes = Note.where(customer_id: params[:id])
		@lead = Customer.find(params[:id])
	end

	def proposal
		@proposals = Proposal.where(customer_id: params[:id])
		@lead = Customer.find(params[:id])
	end

	def invoice
		@proposals = Proposal.where(customer_id: params[:id])
		@lead = Customer.find(params[:id])
	end

	def convert_l2c
		lead = Customer.find(params[:id])
		if lead.update(customer_role_id: 2)
			redirect_to customers_path
		else
			redirect_to leads_path
		end
	end
end
