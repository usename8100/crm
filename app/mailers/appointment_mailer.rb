class AppointmentMailer < ApplicationMailer
	default from: "trinhminhlongad@gmail.com"

	def appointment_mailer lead, appointment_id
		@lead = lead
		@appointment = Appointment.find(appointment_id)
		@contact = Contact.find(@appointment.contact_id)

		mail to: @contact.email, subject: @appointment.subject
	end
end
