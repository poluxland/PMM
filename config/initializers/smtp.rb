# config/initializers/smtp.rb
# frozen_string_literal: true

if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.perform_deliveries    = true
  ActionMailer::Base.raise_delivery_errors = true

  ActionMailer::Base.default_url_options = {
    host:     ENV.fetch('MAILER_HOST', 'melon-platform.herokuapp.com'),
    protocol: 'https'
  }

  ActionMailer::Base.smtp_settings = {
    address:              'smtp.sendgrid.net',
    port:                 587,
    domain:               'gmail.com',
    user_name:            ENV['SENDGRID_USERNAME'],  # debe ser 'apikey'
    password:             ENV['SENDGRID_PASSWORD'],  # tu API key real
    authentication:       :plain,
    enable_starttls_auto: true
  }
end
