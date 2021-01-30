class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy]
  include Pagy::Backend
  # GET /trucks
  # GET /trucks.json
  def index
    @pagy, @trucks = pagy(Truck.where.not(salida: "2000-01-01 00:00:00.000000000 +0000"))

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

  end

  def blank
    @trucks = Truck.where(salida: "2000-01-01 00:00:00.000000000 +0000")
  end
  # GET /trucks/1
  # GET /trucks/1.json
  def show
  end

  # GET /trucks/new
  def new
    @truck = Truck.new
  end

  # GET /trucks/1/edit
  def edit
  end

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
      params.require(:truck).permit(:fecha, :mmpp_id, :tipo, :llegada, :llamada, :salida, :patente, :wait, :motive, :cause, :number, :other)
    end
end
