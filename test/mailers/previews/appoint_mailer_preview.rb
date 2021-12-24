# Preview all emails at http://localhost:3000/rails/mailers/appoint_mailer
class AppointMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/appoint_mailer/appoint
  def appoint
    AppointMailer.appoint
  end

end
