class StaffsController < ApplicationController
  before_action :set_staff, only: %i[show edit update destroy] 
  def index
    @staffs = Staff.all
    @q = Account.ransack(params[:q])
    @accounts = @q.result(distinct: true)
  end

  def new
    @account = Account.new
    @staff_roles = UserRole.all
  end

  def edit
    @staffs = Staff.all
    @staff_roles = UserRole.all
  end

  def show
  end

  def destroy
    staff_name = @account.name
   @account.destroy
   flash[:success] = "Deleted staff <b>" + staff_name+ "</b>!"
   redirect_to staffs_path
  end

  def create
    staff_name = params[:account][:staff_name]
    staff_phone = params[:account][:staff_phone]
    staff_email = params[:account][:staff_email]
    staff_password = params[:account][:staff_password]
    staff_city = params[:account][:staff_city]
    staff_age = params[:account][:staff_age]

    @account = Account.new
    @account.name = staff_name
    @account.phone = staff_phone
    @account.email = staff_email
    @account.city = staff_city
    @account.age = staff_age.to_i
    @account.password = staff_password
    if @account.save
      flash[:success] = "Add new staff <b>"  + staff_name +"</b> successfully!"      
      @staff = Staff.new
      @staff.designation = params[:account][:designation] 
      @staff.user_id = @account.id.to_i
      if @staff.save
      redirect_to staffs_path
      else 
        render 'new'
      end
    end
  end
  
  def update
    name = params[:account][:name]
    phone = params[:account][:phone]
    email = params[:account][:email]
    password = params[:account][:password]
    city = params[:account][:city]
    age = params[:account][:age]
    designation = params[:account][:designation]
    if @account.update(name: name, phone: phone, email: email, city: city, age: age)
      flash[:success] = "Updated staff "  + name +"!"
      if !params[:account][:password].nil?
        @account.update(password: password)
      end
      @staff = Staff.find_by(user_id: @account.id)
      if @staff.update(designation: designation)
        flash[:success] = "Updated staff <b>"  + name +"</b>!"  
        redirect_to staffs_path
      else
        render 'update'
      end
    end
  end

  private
  def set_staff
      @account = Account.find(params[:id])
  end
end
