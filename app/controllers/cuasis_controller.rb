class CuasisController < ApplicationController
  before_action :set_cuasi, only: [:show, :edit, :update, :destroy]

  # GET /cuasis
  # GET /cuasis.json
  def index
    @cuasis = Cuasi.all
  end

  # GET /cuasis/1
  # GET /cuasis/1.json
  def show
  end

  # GET /cuasis/new
  def new
    @cuasi = Cuasi.new
  end

  # GET /cuasis/1/edit
  def edit
  end

  # POST /cuasis
  # POST /cuasis.json
  def create
    @cuasi = Cuasi.new(cuasi_params)

    respond_to do |format|
      if @cuasi.save
        format.html { redirect_to @cuasi, notice: 'Cuasi was successfully created.' }
        format.json { render :show, status: :created, location: @cuasi }
      else
        format.html { render :new }
        format.json { render json: @cuasi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuasis/1
  # PATCH/PUT /cuasis/1.json
  def update
    respond_to do |format|
      if @cuasi.update(cuasi_params)
        format.html { redirect_to @cuasi, notice: 'Cuasi was successfully updated.' }
        format.json { render :show, status: :ok, location: @cuasi }
      else
        format.html { render :edit }
        format.json { render json: @cuasi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuasis/1
  # DELETE /cuasis/1.json
  def destroy
    @cuasi.destroy
    respond_to do |format|
      format.html { redirect_to cuasis_url, notice: 'Cuasi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuasi
      @cuasi = Cuasi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cuasi_params
      params.require(:cuasi).permit(:sitio, :fecha, :reporta, :potencial, :accion, :responsable, :estado)
    end
end
