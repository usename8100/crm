class LeadsController < ApplicationController
	before_action :authenticate_account!
	def index
		#@leads = Customer.where(customer_role_id: 1)
		@q = Customer.where(customer_role_id: 1).ransack(params[:q])
		@pagy, @leads = pagy(@q.result(distinct: true).order(created_at: :desc), items: 15)
	end

	def show
		@lead = Customer.find(params[:id])
		staff = Staff.find(@lead.staff_id)
		@staff_acc = Account.find(staff.user_id)
	end

	def new
		@lead = Customer.new
		@staffs = Staff.where(designation: ["Manager","Customer Officer"])
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
		@lead.customer_role_id = params[:role].to_i
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
			if !contact_email.nil?
				@contact = Contact.new
				@contact.customer_id = @lead.id
				@contact.name = contact_name
				@contact.phone = contact_phone
				@contact.email = contact_email
				@contact.designation = designation
				@contact.notes = contact_note
			end
			@contact2 = Contact.new
			@contact2.customer_id = @lead.id
			@contact2.name = lead_name
			@contact2.phone = phone
			@contact2.email = email
			@contact2.designation = "Owner"
			@contact2.save
			if @contact2.save
				if params[:role].to_i == 1
					flash[:success] = "Add new lead <b>" + lead_name +  "</b> successfully!"
					redirect_to leads_path
				else
					flash[:success] = "Add new customer <b>" + lead_name +  "</b> successfully!"
					redirect_to customers_path
				end
			end
		else
			redirect_to new_lead_path
		end
	end

	def edit
    @lead = Customer.find(params[:id])
		@staffs = Staff.all
	end

	def update
    @lead = Customer.find(params[:id])
		lead_name = params[:customer][:name]
		phone = params[:customer][:phone]
		email = params[:customer][:email]
		website = params[:customer][:website]
		staff_id = params[:customer][:staff_id].to_i
		notes = params[:customer][:note]
		status = params[:customer][:status]
		source = params[:customer][:source]
		city = params[:customer][:city]
		detail_address = params[:customer][:detail_address]

		if @lead.update(name: lead_name, phone: phone, email: email, website: website, note: notes, status: status, source: source, city: city, detail_address: detail_address)
			flash[:success] = "Updated lead <b>" + lead_name +  "</b>!"
			redirect_to leads_path
		else
			render 'edit'
		end
	end

  def destroy
    @lead = Customer.find(params[:id])
    lead_name = @lead.name
    @lead.destroy
    flash[:success] = "Deleted lead <b>" + lead_name +  "</b>!"
    redirect_to leads_path
  end

	def detail
		
	end

	def contact
		@contacts = Contact.where(customer_id: params[:id]).order(created_at: :desc)
		@lead = Customer.find(params[:id])
	end

	def edit_contact
		@contact = Contact.find(params[:id])
		@lead = Customer.find(params[:lead_id])
	end

	def call
		@calls = Call.where(customer_id: params[:id]).order(created_at: :desc)
		@lead = Customer.find(params[:id])
		@staffs = Staff.all
	end

	def edit_call
		@call = Call.find(params[:id])
		@lead = Customer.find(params[:lead_id])
	end

	def appointment
		@appointments = Appointment.where(customer_id: params[:id]).order(created_at: :desc)
		@lead = Customer.find(params[:id])
		@contacts = Contact.where(customer_id: @lead.id)
	end

	def edit_appointment
		@appointment = Appointment.find(params[:id])
		contact = Contact.find(@appointment.contact_id)
		@lead = Customer.find(contact.get_customer_id)
		@contacts = Contact.where(customer_id: @lead.id)
	end

	def note
		@notes = Note.where(customer_id: params[:id]).order(created_at: :desc)
		@lead = Customer.find(params[:id])
	end

	def edit_note
		@note = Note.find(params[:id])
		@lead = Customer.find(params[:lead_id])
	end

	def proposal
		@proposals = Proposal.where(customer_id: params[:id]).order(created_at: :desc)
		@lead = Customer.find(params[:id])
		@contacts = Contact.where(customer_id: @lead.id)
	end

	def edit_proposal
		@proposal = Proposal.find(params[:id])
		@lead = Customer.find(params[:customer_id])
		@items = Item.where(status: true)
    @categories = Category.all
    @table_items = ProposalItem.where(proposal_id: @proposal.id)
    @taxes = Tax.all
	end

	def invoice
		@proposals = Proposal.where(customer_id: params[:id]).order(created_at: :desc)
		@lead = Customer.find(params[:id])
	end

	def convert_l2c
		lead = Customer.find(params[:id])
		lead_name = lead.name
		if lead.update(customer_role_id: 2)
			flash[:success] = "Convert <b>" + lead_name +  "</b> to Customer!"
			redirect_to customers_path
		else
			redirect_to leads_path
		end
	end

	def import_excel
    if !params[:file].nil?
      customers_num = Customer.import(params[:file], 1, current_account.id)
      flash[:success] = "Imported " + customers_num.to_s + " leads"
      redirect_to leads_path
    else
      flash[:warning] = "Please choose a file to import!"
      redirect_to leads_path
    end
	end
end
