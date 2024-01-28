class ReportesController < ApplicationController
  before_action :set_trabajo
  before_action :set_reporte, only: [:show, :edit, :update, :destroy]

  # GET /trabajos/:trabajo_id/reportes
  def index
    @reportes = @trabajo.reportes
  end

  # GET /trabajos/:trabajo_id/reportes/:id
  def show
  end

  # GET /trabajos/:trabajo_id/reportes/new
  def new
    @reporte = @trabajo.reportes.build
  end

  # GET /trabajos/:trabajo_id/reportes/:id/edit
  def edit
  end

  # POST /trabajos/:trabajo_id/reportes
  def create
    @reporte = @trabajo.reportes.build(reporte_params)

    if @reporte.save
      redirect_to [@trabajo, @reporte], notice: 'Reporte was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /trabajos/:trabajo_id/reportes/:id
  def update
    if @reporte.update(reporte_params)
      redirect_to [@trabajo, @reporte], notice: 'Reporte was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trabajos/:trabajo_id/reportes/:id
  def destroy
    @reporte.destroy
    redirect_to trabajo_reportes_url(@trabajo), notice: 'Reporte was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trabajo
      @trabajo = Trabajo.find(params[:trabajo_id])
    end

    def set_reporte
      @reporte = @trabajo.reportes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reporte_params
      params.require(:reporte).permit(:control, :notas, :avance, :inactividad)
    end
end
