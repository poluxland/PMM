class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy]

  # GET /trucks
  # GET /trucks.json
  def index
    @trucks = Truck.where.not(salida: "2000-01-01 00:00:00.000000000 +0000")

    @trucks_data_day = [
      {
        name: "menos de 60min",
        data: @trucks.group_by_day(:created_at).where("wait <= 60").count
      }, 
      {
        name: "más de 60min",
        data: @trucks.group_by_day(:created_at).where("wait > 60").count
      }
    ]

    @trucks_data_month = [
      {
        name: "menos de 60min",
        data: @trucks.group_by_month(:created_at).where("wait <= 60").count
      }, 
      {
        name: "más de 60min",
        data: @trucks.group_by_month(:created_at).where("wait > 60").count
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
