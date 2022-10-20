class ContactMailer < ApplicationMailer
  default from: 'notifications@test.com'

  CONTACT_EMAIL = "squadfinder2205@gmail.com"

  def submission
    @message = "You have been invited to join a squad"
    mail(to: CONTACT_EMAIL, subject: 'squad mailer test')
  end
end
