class TrasladosController < ApplicationController
  before_action :set_traslado, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:new, :create, :index]

  # GET /traslados or /traslados.json
  def index
    @traslados = Traslado.all
  end

  # GET /traslados/1 or /traslados/1.json
  def show
  end

  # GET /traslados/new
  def new
    @traslado = Traslado.new
  end

  # GET /traslados/1/edit
  def edit
  end

  # POST /traslados or /traslados.json
  def create
    @traslado = Traslado.new(traslado_params)

    respond_to do |format|
      if @traslado.save
        format.html { redirect_to traslados_url, notice: "Traslado creado." }
        format.json { render :show, status: :created, location: @traslado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @traslado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /traslados/1 or /traslados/1.json
  def update
    respond_to do |format|
      if @traslado.update(traslado_params)
        format.html { redirect_to traslados_url, notice: "Traslado editado." }
        format.json { render :show, status: :ok, location: @traslado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @traslado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traslados/1 or /traslados/1.json
  def destroy
  if current_user.email == 'jose.jerez@msindustrial.cl'
    @traslado.destroy
    respond_to do |format|
      format.html { redirect_to traslados_url, notice: "Traslado was successfully destroyed." }
      format.json { head :no_content }
    end
  else
    respond_to do |format|
      format.html { redirect_to traslados_url, alert: "You are not authorized to delete this Traslado." }
      format.json { head :forbidden }
    end
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_traslado
      @traslado = Traslado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def traslado_params
      params.require(:traslado).permit(:valor, :lugar, :observaciones, :centro_de_costo, :estado, :comentario)
    end
end
