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

    @chart_data = {
    'Quilimari' => @estado_cancha.quilimari,
    'Cachinales' => @estado_cancha.cachinales,
    'Ñilhue' => @estado_cancha.ñilhue,
    'Caolin' => @estado_cancha.caolin,
    'Fierro' => @estado_cancha.fierro,
    'Puzolana' => @estado_cancha.puzolana,
    'Tunga' => @estado_cancha.tunga,
    'Ceniza' => @estado_cancha.ceniza,
    'Yeso' => @estado_cancha.yeso,
    'Conchuela' => @estado_cancha.conchuela,
    'San Pedro' => @estado_cancha.san_pedro
  }

    mail to: 'jose.jerez@msindustrial.cl, fernando.gonzalez@msindustrial.cl'
  end



end
