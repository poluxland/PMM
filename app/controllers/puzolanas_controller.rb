class PuzolanasController < ApplicationController
  before_action :set_puzolana, only: %i[ show edit update destroy ]

  # GET /puzolanas or /puzolanas.json
  def index
    @puzolanas = Puzolana.all
  end

  # GET /puzolanas/1 or /puzolanas/1.json
  def show
  end

  # GET /puzolanas/new
  def new
    @puzolana = Puzolana.new
  end

  # GET /puzolanas/1/edit
  def edit
  end

  # POST /puzolanas or /puzolanas.json
  def create
    @puzolana = Puzolana.new(puzolana_params)

    respond_to do |format|
      if @puzolana.save
        format.html { redirect_to @puzolana, notice: "Puzolana was successfully created." }
        format.json { render :show, status: :created, location: @puzolana }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @puzolana.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /puzolanas/1 or /puzolanas/1.json
  def update
    respond_to do |format|
      if @puzolana.update(puzolana_params)
        format.html { redirect_to @puzolana, notice: "Puzolana was successfully updated." }
        format.json { render :show, status: :ok, location: @puzolana }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @puzolana.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puzolanas/1 or /puzolanas/1.json
  def destroy
    @puzolana.destroy
    respond_to do |format|
      format.html { redirect_to puzolanas_url, notice: "Puzolana was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_puzolana
      @puzolana = Puzolana.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def puzolana_params
      params.require(:puzolana).permit(:C403BC02_tensado_cinta, :C403BC02_alineamiento, :C403BC02_Polines, :C403BC02_fugas, :C403BC03_tensado_cinta, :C403BC03_alineamiento, :C403BC03_Polines, :C403BC03_fugas, :C403BC04_tensado_cinta, :C403BC04_alineamiento, :C403BC04_Polines, :C403BC04_fugas, :C403BC05_tensado_cinta, :C403BC05_alineamiento, :C403BC05_Polines, :C403BC05_fugas, :C403BC06_tensado_cinta, :C403BC06_alineamiento, :C403BC06_polines, :C403BC06_fugas)
    end
end
