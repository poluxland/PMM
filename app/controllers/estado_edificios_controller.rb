class EstadoEdificiosController < ApplicationController
  before_action :set_estado_edificio, only: %i[ show edit update destroy ]

  # GET /estado_edificios or /estado_edificios.json
  def index
    @estado_edificios = EstadoEdificio.last(1)

    @graph = 
      {
        
        EM22: EstadoEdificio.last.Em22,
        EM21: EstadoEdificio.last.Em21,
        KKI: EstadoEdificio.last.Kki,
        KKM: EstadoEdificio.last.Kkm,
        Puz: EstadoEdificio.last.Puzolana,
        Yeso: EstadoEdificio.last.Yeso,
        Trans_cemento: EstadoEdificio.last.Trans_cemento,
        Enfriadera: EstadoEdificio.last.Enfriadera,
        Techo_ccm_h9: EstadoEdificio.last.Techo_ccm_h9,
        Patio_M22: EstadoEdificio.last.Patio_M22,
        Niagara: EstadoEdificio.last.Niagara,
        EM17: EstadoEdificio.last.EM17,
        Bba_flux: EstadoEdificio.last.Bba_flux,
        Area_202: EstadoEdificio.last.Area_202,
        Basculas: EstadoEdificio.last.Basculas,
        Estado_edificio: EstadoEdificio.last.Em_18_19,
        Taller_electrico: EstadoEdificio.last.Taller_electrico

      }




  end

  def ed
    @estado_edificios = EstadoEdificio.all
  end

  # GET /estado_edificios/1 or /estado_edificios/1.json
  def show
  end

  # GET /estado_edificios/new
  def new
    @estado_edificio = EstadoEdificio.new
  end

  # GET /estado_edificios/1/edit
  def edit
  end

  # POST /estado_edificios or /estado_edificios.json
  def create
    @estado_edificio = EstadoEdificio.new(estado_edificio_params)

    respond_to do |format|
      if @estado_edificio.save
        format.html { redirect_to @estado_edificio, notice: "Estado edificio was successfully created." }
        format.json { render :show, status: :created, location: @estado_edificio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estado_edificio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_edificios/1 or /estado_edificios/1.json
  def update
    respond_to do |format|
      if @estado_edificio.update(estado_edificio_params)
        format.html { redirect_to @estado_edificio, notice: "Estado edificio was successfully updated." }
        format.json { render :show, status: :ok, location: @estado_edificio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estado_edificio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_edificios/1 or /estado_edificios/1.json
  def destroy
    @estado_edificio.destroy
    respond_to do |format|
      format.html { redirect_to estado_edificios_url, notice: "Estado edificio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_edificio
      @estado_edificio = EstadoEdificio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estado_edificio_params
      params.require(:estado_edificio).permit(:Em22, :Em21, :Kki, :Kkm, :Puzolana, :Yeso, :Trans_cemento, :Enfriadera, :Techo_ccm_h9, :Patio_M22, :Niagara, :EM17, :Bba_flux, :Area_202, :Basculas, :Em_18_19, :Taller_electrico, :CI01CK01, :Silos_superiores, :Secador, :comentarios)
    end
end
