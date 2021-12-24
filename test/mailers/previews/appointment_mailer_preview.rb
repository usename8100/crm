# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview
	def appo_mailer
		AppointmentMailer.appointment_mailer(Customer.first, 12)
		
	end
end
