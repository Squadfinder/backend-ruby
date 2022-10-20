class ApplicationMailer < ActionMailer::Base
  default from: 'notifications@test.com'
  layout 'mailer'
end
