# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @greeting = Cancha.where(operativa: false)

    mail to: 'jose.jerez@msindustrial.cl, fernando.gonzalez@msindustrial.cl'
  end
end
