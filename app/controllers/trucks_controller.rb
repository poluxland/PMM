# frozen_string_literal: true

class TrucksController < ApplicationController
  before_action :set_truck, only: %i[show edit update destroy]
  include Pagy::Backend
  # GET /trucks
  # GET /trucks.json
  def index
    @trucks = (Truck.includes(:mmpp).where.not(salida: "2000-01-01 00:00:00.000000000 +0000")).last(10000)





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
    @trucks = Truck.includes(:mmpp).where(salida: '2000-01-01 00:00:00 -0300')
    @last = Truck.includes(:mmpp).last(10)
  end

  def month
    @month = Truck.includes(:mmpp).where(:created_at => Date.today.beginning_of_month..Date.today.end_of_month)
  end

  def year
    @year = Truck.includes(:mmpp).where(:created_at => Date.today.beginning_of_year..Date.today.end_of_year)
  end



  def report

    @trucks = (Truck.includes(:mmpp).where.not(salida: "2000-01-01 00:00:00.000000000 +0000"))
    @trucks_by_material = Truck.joins(:mmpp).where.not(salida: "2000-01-01 00:00:00.000000000 +0000").where('trucks.fecha >= ? AND trucks.fecha <= ?', Time.now.beginning_of_month, Time.now.end_of_month).group('mmpps.nombre').pluck('mmpps.nombre, COUNT(trucks.id) as total_trucks, AVG(trucks.wait) as average_trucks')
    @total_trucks = @trucks_by_material.sum { |t| t[1] }
    @average_trucks = @trucks_by_material.sum { |t| t[2] } / @trucks_by_material.size


    @trucks_by_material_day = Truck.joins(:mmpp).where.not(salida: "2000-01-01 00:00:00.000000000 +0000").where('trucks.fecha >= ? AND trucks.fecha <= ?', Time.now.beginning_of_day, Time.now.end_of_day).group('mmpps.nombre').pluck('mmpps.nombre, COUNT(trucks.id) as total_trucks, AVG(trucks.wait) as average_trucks')
    @total_trucks_day = @trucks_by_material_day.sum { |t| t[1] }
    @average_trucks_day = @trucks_by_material_day.sum { |t| t[2] } / @trucks_by_material_day.size



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
