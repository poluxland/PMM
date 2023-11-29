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
  @trucks = Truck.includes(:mmpp).where(created_at: start_of_2022..end_of_2022)
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
