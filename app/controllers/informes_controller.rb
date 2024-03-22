class InformesController < ApplicationController
  before_action :set_informe, only: %i[ show edit update destroy ]

  # GET /informes or /informes.json
  def index
    @informes = Informe.all
  end

  def last
    @inf = Informe.order(created_at: :desc).second
    @info = Informe.order(created_at: :desc).third
    @informe = Informe.last
    if @informe
      render :show
    else
      redirect_to informes_path, alert: 'No informe records found.'
    end


  end

  # GET /informes/1 or /informes/1.json
  def show
  end

  # GET /informes/new
  def new
    @informe = Informe.new
  end

  # GET /informes/1/edit
  def edit
  end

  # POST /informes or /informes.json
  def create
    @informe = Informe.new(informe_params)

    respond_to do |format|
      if @informe.save
        format.html { redirect_to informe_url(@informe), notice: "Informe was successfully created." }
        format.json { render :show, status: :created, location: @informe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @informe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /informes/1 or /informes/1.json
  def update
    respond_to do |format|
      if @informe.update(informe_params)
        format.html { redirect_to informe_url(@informe), notice: "Informe was successfully updated." }
        format.json { render :show, status: :ok, location: @informe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @informe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /informes/1 or /informes/1.json
  def destroy
    @informe.destroy

    respond_to do |format|
      format.html { redirect_to informes_url, notice: "Informe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_informe
      @informe = Informe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def informe_params
      params.require(:informe).permit(:fecha, :especial_sin_funda, :especial_soluble, :especial_enfundado, :extra_sin_funda, :extra_soluble, :extra_enfundado, :big_bag_extra_sin_peba, :big_bag_extra_con_peba, :big_bag_especial_sin_peba, :big_bag_especial_con_peba, :produccion_especial, :produccion_extra, :inicio_produccion, :termino_produccion, :envases_especial, :envases_extra, :envases_big_bag, :pallets_buenos, :bobinas_plastificado, :observaciones, :envase_especial_soluble, :envase_extra_soluble, :envase_bigbag_con_peba, :fifo_1_especial, :fifo_2_especial, :fifo_3_especial, :fifo_4_especial, :fifo_5_especial, :fifo_6_especial, :fifo_7_especial, :fifo_8_extra, :fifo_9_extra)
    end
end
