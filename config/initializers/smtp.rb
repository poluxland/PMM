ActionMailer::Base.delivery_method       = :smtp
ActionMailer::Base.perform_deliveries    = true
ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'gmail.com',
  user_name:            ENV['GMAIL_ADDRESS'],
  password:             ENV['GMAIL_APP_PASSWORD'],
  authentication:       :plain,
  enable_starttls_auto: true,
  open_timeout:         30,
  read_timeout:         30
}
