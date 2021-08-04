class EnvasadorasController < ApplicationController
  before_action :set_envasadora, only: %i[ show edit update destroy ]

  # GET /envasadoras or /envasadoras.json
  def index
    @envasadoras = Envasadora.last(1)

    @graph = 
    {
      
      BB:  Envasadora.last.llenado_bb,
      Bodega_BB:  Envasadora.last.bodega_bb,
      Costado: Envasadora.last.costado,
      Silo_28: Envasadora.last.silo_28,
      Fuller: Envasadora.last.bba_fuller,
      Exterior: Envasadora.last.exterior_bodega,
      Ventomatic: Envasadora.last.carga_ventomatic,
      Calle_servicio: Envasadora.last.calle_servicio,
      Ed_Ventomatic: Envasadora.last.edificio_ventomatic,
      Ed_Haver: Envasadora.last.edificio_haver,
      Pal_Haver: Envasadora.last.palletizador_haver,
      Recuperado: Envasadora.last.recuperado_bb,
      Escombros: Envasadora.last.sector_escombros

    }
    
  
end

def historico
  @recuperados = Envasadora.all
end

  # GET /envasadoras/1 or /envasadoras/1.json
  def show
  end

  # GET /envasadoras/new
  def new
    @envasadora = Envasadora.new
  end

  # GET /envasadoras/1/edit
  def edit
  end

  # POST /envasadoras or /envasadoras.json
  def create
    @envasadora = Envasadora.new(envasadora_params)

    respond_to do |format|
      if @envasadora.save
        format.html { redirect_to @envasadora, notice: "Envasadora was successfully created." }
        format.json { render :show, status: :created, location: @envasadora }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @envasadora.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /envasadoras/1 or /envasadoras/1.json
  def update
    respond_to do |format|
      if @envasadora.update(envasadora_params)
        format.html { redirect_to @envasadora, notice: "Envasadora was successfully updated." }
        format.json { render :show, status: :ok, location: @envasadora }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @envasadora.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /envasadoras/1 or /envasadoras/1.json
  def destroy
    @envasadora.destroy
    respond_to do |format|
      format.html { redirect_to envasadoras_url, notice: "Envasadora was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_envasadora
      @envasadora = Envasadora.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def envasadora_params
      params.require(:envasadora).permit(:llenado_bb, :bodega_bb, :costado, :silo_28, :bba_fuller, :exterior_bodega, :carga_ventomatic, :calle_servicio, :edificio_ventomatic, :edificio_haver, :palletizador_haver, :recuperado_bb, :sector_escombros, :comentarios)
    end
end
