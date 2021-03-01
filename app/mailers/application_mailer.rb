# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'control@msindustrial.cl'
  layout 'mailer'
end
