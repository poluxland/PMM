# config/initializers/smtp.rb
# frozen_string_literal: true

# 1) Usa SMTP como método de entrega
ActionMailer::Base.delivery_method = :smtp

# 2) Activa los envíos
ActionMailer::Base.perform_deliveries    = true

# 3) Haz que falle con error si algo sale mal
ActionMailer::Base.raise_delivery_errors = true

# 4) URL base para los helpers de mail (link_to, etc.)
ActionMailer::Base.default_url_options = {
  host:     ENV.fetch('MAILER_HOST', 'melon-platform.herokuapp.com'),
  protocol: 'https'
}

# Ya existentes:
ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'gmail.com',
  user_name:            ENV['GMAIL_ADDRESS'],      # control@msindustrial.cl
  password:             ENV['GMAIL_APP_PASSWORD'], # tu App Password de 16 chars
  authentication:       :plain,
  enable_starttls_auto: true
}
