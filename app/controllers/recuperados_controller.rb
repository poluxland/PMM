class RecuperadosController < ApplicationController
  before_action :set_recuperado, only: %i[ show edit update destroy ]

  # GET /recuperados or /recuperados.json
  def index
    @recuperados = Recuperado.last(1)
    
    @graph = 
      {
        
        EM22:  Recuperado.last.EM22,
        Sepax:  Recuperado.last.Sepax,
        Filxtax: Recuperado.last.Filtax,
        Puz: Recuperado.last.Puzolana,
        Yeso: Recuperado.last.Yeso,
        KKI: Recuperado.last.Silo_KKI,
        H9: Recuperado.last.cola_H9,
        AT: Recuperado.last.Aire_terciario,
        FE: Recuperado.last.Filtro_enfriadera,
        EM21: Recuperado.last.EM21,
        AUXH9: Recuperado.last.Aux_H9,
        Skako: Recuperado.last.Skako,
        Niagara: Recuperado.last.Niagara,
        CI08F01: Recuperado.last.CI08F01,
        Coke:Recuperado.last.Coke,
        MP: Recuperado.last.Exterior_molinos_MP,
        Cintas_MP:Recuperado.last.Cintas_MP

      }
      
    
  end

  def historico
    @recuperados = Recuperado.all
  end

  

  # GET /recuperados/1 or /recuperados/1.json
  def show
  end

  # GET /recuperados/new
  def new
    @recuperado = Recuperado.new
  end

  # GET /recuperados/1/edit
  def edit
  end

  # POST /recuperados or /recuperados.json
  def create
    @recuperado = Recuperado.new(recuperado_params)

    respond_to do |format|
      if @recuperado.save
        format.html { redirect_to @recuperado, notice: "Recuperado was successfully created." }
        format.json { render :show, status: :created, location: @recuperado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recuperado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recuperados/1 or /recuperados/1.json
  def update
    respond_to do |format|
      if @recuperado.update(recuperado_params)
        format.html { redirect_to @recuperado, notice: "Recuperado was successfully updated." }
        format.json { render :show, status: :ok, location: @recuperado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recuperado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recuperados/1 or /recuperados/1.json
  def destroy
    @recuperado.destroy
    respond_to do |format|
      format.html { redirect_to recuperados_url, notice: "Recuperado was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recuperado
      @recuperado = Recuperado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recuperado_params
      params.require(:recuperado).permit(:EM22, :Sepax, :Filtax, :Puzolana, :Yeso, :Silo_KKI, :cola_H9, :Aire_terciario, :Filtro_enfriadera, :EM21, :Aux_H9, :Skako, :Niagara, :CI08F01, :Coke, :Exterior_molinos_MP, :Cintas_MP, :comentarios, :total)
    end
end
