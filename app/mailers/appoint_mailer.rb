class AppointMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appoint_mailer.appoint.subject
  #
  def appoint
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
