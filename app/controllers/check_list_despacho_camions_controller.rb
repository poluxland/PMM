class CheckListDespachoCamionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create, :show]

  before_action :set_check_list_despacho_camion, only: %i[ show edit update destroy ]

  # GET /check_list_despacho_camions or /check_list_despacho_camions.json
  def index
    @check_list_despacho_camions = CheckListDespachoCamion.all
    @checklists_hoy = CheckListDespachoCamion.where(fecha: Date.today).count
  end

  # GET /check_list_despacho_camions/1 or /check_list_despacho_camions/1.json
  def show
  end

  # GET /check_list_despacho_camions/new
  def new
    @check_list_despacho_camion = CheckListDespachoCamion.new
  end

  # GET /check_list_despacho_camions/1/edit
  def edit
  end

  # POST /check_list_despacho_camions or /check_list_despacho_camions.json
  def create
    @check_list_despacho_camion = CheckListDespachoCamion.new(check_list_despacho_camion_params)

    respond_to do |format|
      if @check_list_despacho_camion.save
        format.html { redirect_to check_list_despacho_camions_url, notice: "Check list despacho camión creado exitosamente." }
        format.json { render :show, status: :created, location: @check_list_despacho_camion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @check_list_despacho_camion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /check_list_despacho_camions/1 or /check_list_despacho_camions/1.json
  def update
    respond_to do |format|
      if @check_list_despacho_camion.update(check_list_despacho_camion_params)
        format.html { redirect_to check_list_despacho_camions_url, notice: "Check list despacho camión actualizado exitosamente." }
        format.json { render :show, status: :ok, location: @check_list_despacho_camion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @check_list_despacho_camion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_list_despacho_camions/1 or /check_list_despacho_camions/1.json
  def destroy
    @check_list_despacho_camion.destroy

    respond_to do |format|
      format.html { redirect_to check_list_despacho_camions_url, notice: "Check list despacho camion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_list_despacho_camion
      @check_list_despacho_camion = CheckListDespachoCamion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def check_list_despacho_camion_params
      params.require(:check_list_despacho_camion).permit(:fecha, :inspector, :patente, :producto, :cantidad, :limpieza_del_saco, :armado_correcto_del_pallet, :sacos_rotos, :tipo_de_producto_correcto, :cantidad_de_pallets_o_sacos, :correcto_enfundado, :comentarios)
    end
end
