class AprsController < ApplicationController
  before_action :set_apr, only: %i[ show edit update destroy ]

  # GET /aprs or /aprs.json
  def index
    @aprs = Apr.all
  end

  # GET /aprs/1 or /aprs/1.json
  def show
  end

  # GET /aprs/new
  def new
    @apr = Apr.new
  end

  # GET /aprs/1/edit
  def edit
  end

  # POST /aprs or /aprs.json
  def create
    @apr = Apr.new(apr_params)

    respond_to do |format|
      if @apr.save
        format.html { redirect_to @apr, notice: "Apr was successfully created." }
        format.json { render :show, status: :created, location: @apr }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aprs/1 or /aprs/1.json
  def update
    respond_to do |format|
      if @apr.update(apr_params)
        format.html { redirect_to @apr, notice: "Apr was successfully updated." }
        format.json { render :show, status: :ok, location: @apr }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @apr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aprs/1 or /aprs/1.json
  def destroy
    @apr.destroy
    respond_to do |format|
      format.html { redirect_to aprs_url, notice: "Apr was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apr
      @apr = Apr.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def apr_params
      params.require(:apr).permit(:nombre, :rut, :cargo, :año_ingreso, :otros)
    end
end
