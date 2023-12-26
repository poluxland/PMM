# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def estado_canchas
    @greeting = "Estado de canchas " + Time.now.in_time_zone('Santiago').to_s
    @estado_cancha = EstadoCancha.last

    mail to: 'jose.jerez@msindustrial.cl, fernando.gonzalez@msindustrial.cl'
  end
end
