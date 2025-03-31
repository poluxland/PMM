class PtmtrucksController < ApplicationController
  before_action :set_ptmtruck, only: %i[ show edit update destroy ]

  # GET /ptmtrucks or /ptmtrucks.json
  def index
    @ptmtrucks = Ptmtruck.where(salida: nil)
    @ptmtrucks_con_salida = Ptmtruck.where.not(salida: nil).order(salida: :desc).limit(60)
  end

  def historico
    @ptmtrucks = Ptmtruck.all

  end

  # GET /ptmtrucks/1 or /ptmtrucks/1.json
  def show
  end

  # GET /ptmtrucks/new
  def new
    @ptmtruck = Ptmtruck.new
  end

  # GET /ptmtrucks/1/edit
  def edit
  end

  # POST /ptmtrucks or /ptmtrucks.json
  def create
    @ptmtruck = Ptmtruck.new(ptmtruck_params)

    respond_to do |format|
      if @ptmtruck.save
        format.html { redirect_to ptmtrucks_url, notice: "Registro creado correctamente." }
        format.json { render :show, status: :created, location: @ptmtruck }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ptmtruck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ptmtrucks/1 or /ptmtrucks/1.json
  def update
    respond_to do |format|
      if @ptmtruck.update(ptmtruck_params)
        format.html { redirect_to ptmtrucks_url, notice: "Registro editado correctamente." }
        format.json { render :show, status: :ok, location: @ptmtruck }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ptmtruck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ptmtrucks/1 or /ptmtrucks/1.json
  def destroy
    @ptmtruck.destroy

    respond_to do |format|
      format.html { redirect_to ptmtrucks_url, notice: "Ptmtruck was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ptmtruck
      @ptmtruck = Ptmtruck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ptmtruck_params
      params.require(:ptmtruck).permit(:patente, :mmpp, :ingreso, :salida, :causa, :otros)
    end
end
