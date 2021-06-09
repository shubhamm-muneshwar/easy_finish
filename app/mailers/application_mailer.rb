require 'action_mailer'

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => "587",
  :domain               => "gmail.com",
  :user_name            => ENV['SMTP_USER_EMAIL'],
  :password             => ENV['SMTP_EMAIL_PASSWORD'],
  :authentication       => 'plain',
  :enable_starttls_auto => true  }


class ApplicationMailer < ActionMailer::Base
  layout 'mailer'
  default from: ENV['SMTP_DEFAULT_FROM']

  def send_email(to, subject, email_body)
    mail(to: to, subject: subject, body: email_body)
  end

end
