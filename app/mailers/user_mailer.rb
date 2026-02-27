# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # -------------------------
  # Estado de canchas
  # -------------------------
  def estado_canchas
    @greeting = "Estado de canchas " + Time.now.in_time_zone("Santiago").to_s
    @estado_cancha = EstadoCancha.last

    @chart_data = {
      "Quilimari" => @estado_cancha.quilimari,
      "Cachinales" => @estado_cancha.cachinales,
      "Ñilhue" => @estado_cancha.ñilhue,
      "Caolin" => @estado_cancha.caolin,
      "Fierro" => @estado_cancha.fierro,
      "Puzolana" => @estado_cancha.puzolana,
      "Tunga" => @estado_cancha.tunga,
      "Poroso" => @estado_cancha.ceniza,
      "Yeso" => @estado_cancha.yeso,
      "Conchuela" => @estado_cancha.conchuela,
      "Petcoke" => @estado_cancha.san_pedro
    }

    mail(
      to: "diego.garrido@meloncementos.cl, jose.jerez@msindustrial.cl, alejandro.olivares@msindustrial.cl, fernando.gonzalez@msindustrial.cl, guillermo.roco@meloncementos.cl, helmut.brandau@meloncementos.cl, jefesturno.planta@melon.cl, supervisor.envasadora@msindustrial.cl, marianelly.villarroel@meloncementos.cl, gaston.guerrero@meloncementos.cl, maryorie.fajardo@msindustrial.cl, pedro.guzman@meloncementos.cl",
      subject: "Estado de canchas - #{Time.now.in_time_zone('Santiago').strftime('%d/%m/%Y %H:%M')}"
    )
  end

  # -------------------------
  # Informes envasado
  # -------------------------
  def informes
    @greeting = "Informe envasado P.Montt " + Time.now.in_time_zone("Santiago").to_s
    @informes = Informe.last
    @inf = Informe.order(created_at: :desc).second
    @info = Informe.order(created_at: :desc).third

    mail(
      to: "martin.llancafil@meloncementos.cl, fernando.gonzalez@msindustrial.cl, julio.alvear@msindustrial.cl, jose.jerez@msindustrial.cl, johnny.rute@melon.cl, francisco.salgado@meloncementos.cl, gerardo.martinez@melon.cl, manuel.sepulveda@meloncementos.cl, mario.santibanez@meloncementos.cl, camila.birke@msindustrial.cl, cesar.hernandez@meloncementos.cl, juan.belmar@meloncementos.cl, pedro.pichaud@msindustrial.cl, angelica.llaitul@melonservicios.cl, evelin.hernandez@msindustrial.cl, Gabriel.arancibia@meloncementos.cl, ricardo.alvarez@meloncementos.cl, maximiliano.perez@meloncementos.cl, gregory.subero@msindustrial.cl, sergio.miranda@meloncementos.cl, jose.lavanderos@meloncementos.cl, alex.rioseco@meloncementos.cl, marcial.mancilla@msindustrial.cl, victor.gallardo@msindustrial.cl, isabel.tapia@meloncementos.cl",
      subject: "Informe envasado P.Montt - #{Time.now.in_time_zone('Santiago').strftime('%d/%m/%Y %H:%M')}"
    )
  end

  # -------------------------
  # Reporte camiones (hoy/ayer/mes actual/mes anterior)
  # -------------------------
    def reporte_camiones
  tz  = "Santiago"
  now = Time.now.in_time_zone(tz)

  # Rangos iguales a la acción report (web)
  month_start     = now.beginning_of_month
  month_end       = now.end_of_month
  last_month_now  = 1.month.ago.in_time_zone(tz)
  last_month_start = last_month_now.beginning_of_month
  last_month_end   = last_month_now.end_of_month

  today_start     = now.beginning_of_day
  today_end       = now.end_of_day
  yesterday_start = 1.day.ago.in_time_zone(tz).beginning_of_day
  today_begin     = now.beginning_of_day # para el "< inicio_hoy"

  base = Truck.joins(:mmpp).where("wait >= 1")

  # Mes actual
  @trucks_by_material =
    base.where("trucks.fecha >= ? AND trucks.fecha <= ?", month_start, month_end)
        .group("mmpps.nombre")
        .pluck(
          "mmpps.nombre",
          Arel.sql("COUNT(trucks.id)"),
          Arel.sql("AVG(trucks.wait)")
        )
  @total_trucks = @trucks_by_material.sum { |t| t[1].to_i }
  @average_trucks_month =
    Truck.where("wait >= 1")
         .where("fecha >= ? AND fecha <= ?", month_start, month_end)
         .average(:wait).to_f

  # Mes anterior
  @last_month_trucks_by_material =
    base.where("trucks.fecha >= ? AND trucks.fecha <= ?", last_month_start, last_month_end)
        .group("mmpps.nombre")
        .pluck(
          "mmpps.nombre",
          Arel.sql("COUNT(trucks.id)"),
          Arel.sql("AVG(trucks.wait)")
        )
  @last_month_total_trucks = @last_month_trucks_by_material.sum { |t| t[1].to_i }
  @last_month_average_trucks =
    Truck.where("wait >= 1")
         .where("fecha >= ? AND fecha <= ?", last_month_start, last_month_end)
         .average(:wait).to_f

  # Hoy
  @trucks_by_material_day =
    base.where("trucks.fecha >= ? AND trucks.fecha <= ?", today_start, today_end)
        .group("mmpps.nombre")
        .pluck(
          "mmpps.nombre",
          Arel.sql("COUNT(trucks.id)"),
          Arel.sql("AVG(trucks.wait)")
        )
  @total_trucks_day = @trucks_by_material_day.sum { |t| t[1].to_i }
  @average_trucks_day =
    Truck.where("wait >= 1")
         .where("fecha >= ? AND fecha <= ?", today_start, today_end)
         .average(:wait).to_f

  # Ayer (NOTA: < inicio_hoy, igual que la web)
  @yesterday_trucks_by_material_day =
    base.where("trucks.fecha >= ? AND trucks.fecha < ?", yesterday_start, today_begin)
        .group("mmpps.nombre")
        .pluck(
          "mmpps.nombre",
          Arel.sql("COUNT(trucks.id)"),
          Arel.sql("AVG(trucks.wait)")
        )
  @yesterday_total_trucks_day = @yesterday_trucks_by_material_day.sum { |t| t[1].to_i }
  @yesterday_average_trucks_day =
    Truck.where("wait >= 1")
         .where("fecha >= ? AND fecha < ?", yesterday_start, today_begin)
         .average(:wait)

  mail(
    to: "jose.jerez@msindustrial.cl, fernando.gonzalez@msindustrial.cl",
    subject: "Reporte camiones - #{now.strftime('%d/%m/%Y %H:%M')}"
  )
end
end