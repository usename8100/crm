class Appointment < ApplicationRecord
	validates :date, :subject, presence: true
end
