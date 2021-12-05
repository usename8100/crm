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
		
	end

	def create
		
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
end
