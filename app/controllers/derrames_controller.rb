class DerramesController < ApplicationController
  before_action :set_derrame, only: %i[ show edit update destroy ]

  # GET /derrames or /derrames.json
  def index
    @derrames = Derrame.all
  end

  def blank
    @derrames = Truck.last(10)
    @last = Truck.last(10)
  end

  # GET /derrames/1 or /derrames/1.json
  def show
  end

  # GET /derrames/new
  def new
    @derrame = Derrame.new
  end

  # GET /derrames/1/edit
  def edit
  end

  # POST /derrames or /derrames.json
  def create
    @derrame = Derrame.new(derrame_params)

    respond_to do |format|
      if @derrame.save
        format.html { redirect_to @derrame, notice: "Derrame was successfully created." }
        format.json { render :show, status: :created, location: @derrame }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @derrame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /derrames/1 or /derrames/1.json
  def update
    respond_to do |format|
      if @derrame.update(derrame_params)
        format.html { redirect_to @derrame, notice: "Derrame was successfully updated." }
        format.json { render :show, status: :ok, location: @derrame }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @derrame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /derrames/1 or /derrames/1.json
  def destroy
    @derrame.destroy
    respond_to do |format|
      format.html { redirect_to derrames_url, notice: "Derrame was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_derrame
      @derrame = Derrame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def derrame_params
      params.require(:derrame).permit(:EM22, :Sepax, :Filtax, :Puzolana, :Yeso, :Silo_KKI, :cola_H9, :Aire_terciario, :Filtro_enfriadera, :EM21, :Aux_H9, :Skako, :Niagara, :CI08F01, :Coke, :Exterior_molinos_MP, :Cintas_MP, :comentarios)
    end
end
