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
    'Poroso' => @estado_cancha.ceniza,
    'Yeso' => @estado_cancha.yeso,
    'Conchuela' => @estado_cancha.conchuela,
    'Petcoke' => @estado_cancha.san_pedro
  }

    mail to: 'diego.garrido@meloncementos.cl, jose.jerez@msindustrial.cl, alejandro.olivares@msindustrial.cl, fernando.gonzalez@msindustrial.cl, guillermo.roco@meloncementos.cl, roberto.leiva@meloncementos.cl, jefesturno.planta@melon.cl, supervisor.envasadora@msindustrial.cl, marianelly.villarroel@meloncementos.cl, rodrigo.trigo@meloncementos.cl, gaston.guerrero@meloncementos.cl, maryorie.fajardo@msindustrial.cl'
  end


  def informes
    @greeting = "Informe envasado P.Montt " + Time.now.in_time_zone('Santiago').to_s
    @informes = Informe.last
    @inf = Informe.order(created_at: :desc).second
    @info = Informe.order(created_at: :desc).third





    mail to: 'martin.llancafil@meloncementos.cl, fernando.gonzalez@msindustrial.cl, julio.alvear@msindustrial.cl, jose.jerez@msindustrial.cl, johnny.rute@melon.cl, francisco.salgado@meloncementos.cl, gerardo.martinez@melon.cl, manuel.sepulveda@meloncementos.cl, mario.santibanez@meloncementos.cl, camila.birke@msindustrial.cl, cesar.hernandez@meloncementos.cl, juan.belmar@meloncementos.cl, pedro.pichaud@msindustrial.cl, angelica.llaitul@melonservicios.cl, evelin.hernandez@msindustrial.cl, Gabriel.arancibia@meloncementos.cl, ricardo.alvarez@meloncementos.cl, maximiliano.perez@meloncementos.cl, gregory.subero@msindustrial.cl, sergio.miranda@meloncementos.cl, jose.lavanderos@meloncementos.cl, alex.rioseco@meloncementos.cl, marcial.mancilla@msindustrial.cl, victor.gallardo@msindustrial.cl, isabel.tapia@meloncementos.cl'
  end



end
