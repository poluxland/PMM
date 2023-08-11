class MantenimientosController < ApplicationController
  before_action :set_mantenimiento, only: %i[ show edit update destroy ]

  # GET /mantenimientos or /mantenimientos.json
 def index
    @mantenimientos_programados = Mantenimiento.where(estado: 'Programado')
    @mantenimientos_en_ejecucion = Mantenimiento.where(estado: 'En ejecución')
    @mantenimientos_terminados = Mantenimiento.where(estado: 'Terminado')
    @mantenimientos_cancelados = Mantenimiento.where(estado: 'Cancelado')
  end

  # GET /mantenimientos/1 or /mantenimientos/1.json
  def show
  end

  # GET /mantenimientos/new
  def new
    @mantenimiento = Mantenimiento.new
  end

  # GET /mantenimientos/1/edit
  def edit
  end

  # POST /mantenimientos or /mantenimientos.json
  def create
  @mantenimiento = Mantenimiento.new(mantenimiento_params)

  respond_to do |format|
    if @mantenimiento.save
      format.html { redirect_to mantenimientos_path, notice: "La tarea fue creada." }
      format.json { render :show, status: :created, location: @mantenimiento }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @mantenimiento.errors, status: :unprocessable_entity }
    end
  end
end


  # PATCH/PUT /mantenimientos/1 or /mantenimientos/1.json
  def update
    respond_to do |format|
      if @mantenimiento.update(mantenimiento_params)
        format.html { redirect_to mantenimientos_path, notice: "Tarea modificada." }
        format.json { render :show, status: :ok, location: @mantenimiento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mantenimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mantenimientos/1 or /mantenimientos/1.json
  def destroy
    @mantenimiento.destroy

    respond_to do |format|
      format.html { redirect_to mantenimientos_url, notice: "Mantenimiento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mantenimiento
      @mantenimiento = Mantenimiento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mantenimiento_params
      params.require(:mantenimiento).permit(:fecha_programada, :fecha_ejecucion, :area, :tarea, :clase, :departamento, :estado, :observacion)
    end
end
