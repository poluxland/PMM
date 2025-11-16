# frozen_string_literal: true

class TrucksController < ApplicationController
  before_action :set_truck, only: %i[show edit update destroy]
  include Pagy::Backend
  # GET /trucks
  # GET /trucks.json
  def index
    @trucks = (Truck.includes(:mmpp).where.not(salida: "2000-01-01 00:00:00.000000000 +0000")).last(20000)





    less_60_day = Truck.group_by_day(:created_at).where("wait <= 60").count
    more_60_day = Truck.group_by_day(:created_at).where("wait > 60").count

    percentual_less_60_day = less_60_day.merge(more_60_day){ |k, less, more| (less / (less + more).to_f * 100).round(2) }
    percentual_more_60_day = less_60_day.merge(more_60_day){ |k, less, more| (more / (less + more).to_f * 100).round(2) }

    @trucks_data_day = [
      {
        name: "menos de 60min",

        data: percentual_less_60_day
      },
      {
        name: "más de 60min",

        data: percentual_more_60_day
      }
    ]

    less_60_month = Truck.group_by_month(:created_at).where("wait <= 60").count
    more_60_month = Truck.group_by_month(:created_at).where("wait > 60").count

    percentual_less_60_month = less_60_month.merge(more_60_month){ |k, less, more| (less / (less + more).to_f * 100).round(2) }
    percentual_more_60_month = less_60_month.merge(more_60_month){ |k, less, more| (more / (less + more).to_f * 100).round(2) }

    @trucks_data_month = [
      {
        name: "menos de 60min",

        data: percentual_less_60_month
      },
      {
        name: "más de 60min",

        data: percentual_more_60_month
      }
    ]


@trucks_data_day_wait = [
      {
        name: "menos de 60min",
        data: Truck.group_by_day(:created_at).where("wait <= 60").count

      },
      {
        name: "más de 60min",
        data: Truck.group_by_day(:created_at).where("wait > 60").count

      }
    ]

 @trucks_data_month_wait = [
      {
        name: "menos de 60min",
        data: Truck.group_by_month(:created_at).where("wait <= 60").count

      },
      {
        name: "más de 60min",
        data: Truck.group_by_month(:created_at).where("wait > 60").count

      }
    ]


  end

  def blank
    @trucks = Truck.includes(:mmpp).where(created_at: Time.now.beginning_of_day..Time.now.end_of_day).where("wait <= 1")
    @last = Truck.includes(:mmpp).last(15)

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename=camiones_todos_#{Date.today}.xlsx"
      }
    end
  end

  def inf
  @year = params[:year].present? ? params[:year].to_i : Time.current.year

  # ---------------------------------------
  # BASE SCOPE (ya con preload y condiciones)
  # ---------------------------------------
  @trucks = Truck
              .includes(:mmpp)
              .where(fecha: Date.new(@year).all_year)
              .where("wait >= 1")

  # ---------------------------------------
  # 1) Estadísticas generales (1 sola query)
  # ---------------------------------------
  wait_stats = @trucks.group("wait <= 60").count
  le_60 = wait_stats[true]  || 0
  gt_60 = wait_stats[false] || 0
  total_wait = (le_60 + gt_60).nonzero? || 1

  @total_trucks_2025 = le_60 + gt_60
  @wait_le_60_count  = le_60
  @wait_gt_60_count  = gt_60

  @wait_pie_data = {
    "≤ 60 min" => ((le_60.to_f / total_wait) * 100).round(2),
    "> 60 min" => ((gt_60.to_f / total_wait) * 100).round(2)
  }

    # ---------------------------------------
  # 2) MMPP por mes (tabla pivot: MMPP x meses)
  #    Cada celda: cantidad de trucks y espera media
  # ---------------------------------------
  mmpp_stats_scope = Truck
                       .joins(:mmpp)
                       .where(fecha: Date.new(@year).all_year)
                       .where("wait >= 1")

  raw_stats = mmpp_stats_scope
                .select("
                  mmpps.nombre AS mmpp_name,
                  DATE_TRUNC('month', fecha) AS month,
                  COUNT(*) AS trucks_count,
                  AVG(wait) AS avg_wait
                ")
                .group("mmpps.nombre", "DATE_TRUNC('month', fecha)")

  # Meses del año seleccionado (1..12)
  @months_for_year = (1..12).map { |m| Date.new(@year, m, 1) }

  # Hash pivot: { "MMPP_NAME" => { date_beginning_of_month => { count:, avg_wait: } } }
  @mmpp_month_pivot = Hash.new { |h, k| h[k] = {} }

  raw_stats.each do |row|
    mmpp_name = row.mmpp_name
    month_key = row.month.to_date.beginning_of_month

    @mmpp_month_pivot[mmpp_name][month_key] = {
      count:    row.trucks_count.to_i,
      avg_wait: row.avg_wait.to_f
    }
  end

  @mmpp_names = @mmpp_month_pivot.keys.sort


  # ---------------------------------------
  # 2.b) Conchuela por TIPO y mes (pivot)
  # ---------------------------------------
  conchuela_stats_scope = mmpp_stats_scope
                            .where("LOWER(mmpps.nombre) = 'conchuela'")

  raw_conchuela = conchuela_stats_scope
                    .select("
                      COALESCE(trucks.tipo, 'Sin tipo') AS tipo_name,
                      DATE_TRUNC('month', fecha) AS month,
                      COUNT(*) AS trucks_count,
                      AVG(wait) AS avg_wait
                    ")
                    .group("COALESCE(trucks.tipo, 'Sin tipo')", "DATE_TRUNC('month', fecha)")

  @conchuela_tipo_month_pivot = Hash.new { |h, k| h[k] = {} }

  raw_conchuela.each do |row|
    tipo      = row.tipo_name
    month_key = row.month.to_date.beginning_of_month

    @conchuela_tipo_month_pivot[tipo][month_key] = {
      count:    row.trucks_count.to_i,
      avg_wait: row.avg_wait.to_f
    }
  end

  @conchuela_tipos = @conchuela_tipo_month_pivot.keys.sort


  # ---------------------------------------
  # 3) Conchuela (opt)
  # ---------------------------------------
  conchuela_scope = @trucks
                      .joins(:mmpp)
                      .where("LOWER(mmpps.nombre) = 'conchuela'")

  @conchuela_total = conchuela_scope.count

  conchuela_group = conchuela_scope.group(:tipo).count
  total_con = (conchuela_group.values.sum).nonzero? || 1

  @conchuela_by_tipo = conchuela_group.transform_values do |v|
    ((v.to_f / total_con) * 100).round(2)
  end

  @conchuela_planos_total = conchuela_scope.where(tipo: "Plano").count

  # ---------------------------------------
  # 4) Planos (OPTIMIZADO)
  # ---------------------------------------
  planos_scope = @trucks.where("LOWER(tipo) = 'plano'")

  planos_stats = planos_scope.group("wait <= 60").count
  pl_le60 = planos_stats[true]  || 0
  pl_gt60 = planos_stats[false] || 0
  total_planos = (pl_le60 + pl_gt60).nonzero? || 1

  @planos_le_60_count = pl_le60
  @planos_gt_60_count = pl_gt60

  @planos_wait_pie_data = {
    "≤ 60 min" => ((pl_le60.to_f / total_planos) * 100).round(2),
    "> 60 min" => ((pl_gt60.to_f / total_planos) * 100).round(2)
  }

  @planos_avg_wait_by_month = planos_scope.group_by_month(:fecha).average(:wait)

  # ---------------------------------------
  # 5) Estadísticas Planos (media, mediana, desviación, outliers)
  # ---------------------------------------
  waits = planos_scope.pluck(:wait).compact

  if waits.any?
    @planos_media = waits.sum.to_f / waits.size

    sorted = waits.sort
    mid = sorted.size / 2
    @planos_mediana = sorted.size.odd? ? sorted[mid] : (sorted[mid-1] + sorted[mid]) / 2.0

    if sorted.size > 1
      variance = sorted.sum { |w| (w - @planos_media)**2 } / (sorted.size - 1).to_f
      @planos_desv_est = Math.sqrt(variance)
    else
      @planos_desv_est = 0.0
    end

    if @planos_desv_est.positive?
      threshold = @planos_media + 3 * @planos_desv_est
      outliers = planos_scope.where("wait > ?", threshold).count
      total_pl = planos_scope.count.nonzero? || 1
      @planos_outliers_count = ((outliers.to_f / total_pl) * 100).round(2)
    else
      @planos_outliers_count = 0.0
    end

  else
    @planos_media = @planos_mediana = @planos_desv_est = 0
    @planos_outliers_count = 0
  end

  # ---------------------------------------
  # 6) Scatter planos
  # ---------------------------------------
  @planos_scatter_data =
    planos_scope.order(:fecha).pluck(:fecha, :wait).map { |f, w| [f.to_s, w] }
end







  def month
    @month = Truck.includes(:mmpp).where(:created_at => Date.today.beginning_of_month..Date.today.end_of_month)
  end

  def year
    @year = Truck.includes(:mmpp).where(:created_at => Date.today.beginning_of_year..Date.today.end_of_year)
  end

 def trucks_in_2022
  start_of_2022 = Date.new(2022, 1, 1)
  end_of_2022 = Date.new(2022, 12, 31)
  @trucks_in_2022 = Truck.includes(:mmpp).where(created_at: start_of_2022..end_of_2022)
end



  def report

     #@average_trucks = @trucks_by_material.size != 0 ? @trucks_by_material.sum { |t| t[2] } / @trucks_by_material.size : 0
     #@average_trucks_day = @trucks_by_material_day.size != 0 ? @trucks_by_material_day.sum { |t| t[2] } / @trucks_by_material_day.size : 0
     #@yesterday_average_trucks_day = @yesterday_trucks_by_material_day.size != 0 ? @yesterday_trucks_by_material_day.sum { |t| t[2] } / @yesterday_trucks_by_material_day.size : 0

    @average_trucks_month = Truck
                       .where("wait >= 1")
                       .where('fecha >= ? AND fecha <= ?', Time.now.in_time_zone('Santiago').beginning_of_month, Time.now.in_time_zone('Santiago').end_of_month)
                       .average(:wait)

    @last_month_average_trucks = Truck
                        .where("wait >= 1")
                        .where('fecha >= ? AND fecha <= ?', 1.month.ago.in_time_zone('Santiago').beginning_of_month, 1.month.ago.in_time_zone('Santiago').end_of_month)
                        .average(:wait)


    @average_trucks_day = Truck
                      .where("wait >= 1")
                      .where('fecha >= ? AND fecha <= ?', Time.now.in_time_zone('Santiago').beginning_of_day, Time.now.in_time_zone('Santiago').end_of_day)
                      .average(:wait)

    @yesterday_average_trucks_day = Truck
                                .where("wait >= 1")
                                .where('fecha >= ? AND fecha < ?', 1.day.ago.in_time_zone('Santiago').beginning_of_day, Time.now.in_time_zone('Santiago').beginning_of_day)
                                .average(:wait)



    @trucks = (Truck.includes(:mmpp).where("wait >= 1"))
    @trucks_by_material = Truck.joins(:mmpp)
                           .where("wait >= 1")
                           .where('trucks.fecha >= ? AND trucks.fecha <= ?', Time.now.in_time_zone('Santiago').beginning_of_month, Time.now.in_time_zone('Santiago').end_of_month)
                           .group('mmpps.nombre')
                           .pluck('mmpps.nombre, COUNT(trucks.id) as total_trucks, AVG(trucks.wait) as average_trucks')

    @total_trucks = @trucks_by_material.sum { |t| t[1] }



    @last_month_trucks_by_material = Truck.joins(:mmpp)
                            .where("wait >= 1")
                            .where('trucks.fecha >= ? AND trucks.fecha <= ?',
                            1.month.ago.in_time_zone('Santiago').beginning_of_month,
                            1.month.ago.in_time_zone('Santiago').end_of_month)
                            .group('mmpps.nombre')
                            .pluck('mmpps.nombre, COUNT(trucks.id) as total_trucks, AVG(trucks.wait) as average_trucks')

    @last_month_total_trucks = @last_month_trucks_by_material.sum { |t| t[1] }





    @trucks_by_material_day = Truck.joins(:mmpp)
                                .where("wait >= 1")
                                .where('trucks.fecha >= ? AND trucks.fecha <= ?', Time.now.in_time_zone('Santiago').beginning_of_day, Time.now.in_time_zone('Santiago').end_of_day)
                                .group('mmpps.nombre')
                                .pluck('mmpps.nombre, COUNT(trucks.id) as total_trucks, AVG(trucks.wait) as average_trucks')

    @total_trucks_day = @trucks_by_material_day.sum { |t| t[1] }


  @yesterday_trucks_by_material_day = Truck.joins(:mmpp)
                                         .where("wait >= 1")
                                         .where('trucks.fecha >= ? AND trucks.fecha < ?', 1.day.ago.in_time_zone('Santiago').beginning_of_day, Time.now.in_time_zone('Santiago').beginning_of_day)
                                         .group('mmpps.nombre')
                                         .pluck('mmpps.nombre, COUNT(trucks.id) as total_trucks, AVG(trucks.wait) as average_trucks')

  @yesterday_total_trucks_day = @yesterday_trucks_by_material_day.sum { |t| t[1] }



    less_60_day = Truck.group_by_day(:created_at).where("wait <= 60").count
    more_60_day = Truck.group_by_day(:created_at).where("wait > 60").count
    day = Truck.includes(:mmpp).group_by_day(:created_at).count

    percentual_less_60_day = less_60_day.merge(day){ |k, less, day| (less.to_f / day * 100).round(2) }
    percentual_more_60_day = less_60_day.merge(day){ |k, less, day| (( 1 - (less.to_f / day)) * 100).round(2) }


    @trucks_data_day = [
      {
        name: "menos de 60min",

        data: percentual_less_60_day
      },
      {
        name: "más de 60min",

        data: percentual_more_60_day
      }
    ]

    less_60_month = Truck.group_by_month(:created_at).where("wait <= 60").count
    more_60_month = Truck.group_by_month(:created_at).where("wait > 60").count

    percentual_less_60_month = less_60_month.merge(more_60_month){ |k, less, more| (less / (less + more).to_f * 100).round(2) }
    percentual_more_60_month = less_60_month.merge(more_60_month){ |k, less, more| (more / (less + more).to_f * 100).round(2) }


    @trucks_data_month = [
      {
        name: "menos de 60min",

        data: percentual_less_60_month
      },
      {
        name: "más de 60min",

        data: percentual_more_60_month
      }
    ]


@trucks_data_day_number = [
      {
        name: "menos de 60min",
        data: Truck.group_by_day(:created_at).where("wait <= 60").count

      },
      {
        name: "más de 60min",
        data: Truck.group_by_day(:created_at).where("wait > 60").count

      }
    ]

 @trucks_data_month_number = [
      {
        name: "menos de 60min",
        data: Truck.group_by_month(:created_at).where("wait <= 60").count

      },
      {
        name: "más de 60min",
        data: Truck.group_by_month(:created_at).where("wait > 60").count

      }
    ]


  end



  # GET /trucks/1
  # GET /trucks/1.json
  def show; end

  # GET /trucks/new
  def new
    @truck = Truck.new
  end

  # GET /trucks/1/edit
  def edit; end

  # POST /trucks
  # POST /trucks.json
  def create
    @truck = Truck.new(truck_params)

    respond_to do |format|
      if @truck.save
        format.html { redirect_to @truck, notice: 'Registro creado con exito.' }
        format.json { render :show, status: :created, location: @truck }
      else
        format.html { render :new }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trucks/1
  # PATCH/PUT /trucks/1.json
  def update
    respond_to do |format|
      if @truck.update(truck_params)
        format.html { redirect_to @truck, notice: 'Registro actualizado.' }
        format.json { render :show, status: :ok, location: @truck }
      else
        format.html { render :edit }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck.destroy
    respond_to do |format|
      format.html { redirect_to trucks_url, notice: 'Registro eliminado con exito.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_truck
    @truck = Truck.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def truck_params
    params.require(:truck).permit(:fecha, :mmpp_id, :tipo, :llegada, :llamada, :salida, :patente, :wait, :motive,
                                  :cause, :number, :other)
  end
end
