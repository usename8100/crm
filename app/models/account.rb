class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def get_designation
    staff = Staff.where(user_id: self.id).first
    if !staff.nil?
      staff.designation
    else
      'Not designation yet!'
    end
  end
end
