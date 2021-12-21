class BarredorasController < ApplicationController
  before_action :set_barredora, only: %i[ show edit update destroy ]

  # GET /barredoras or /barredoras.json
  def index
    @barredoras = Barredora.all
  end

  # GET /barredoras/1 or /barredoras/1.json
  def show
  end

  # GET /barredoras/new
  def new
    @barredora = Barredora.new
  end

  # GET /barredoras/1/edit
  def edit
  end

  # POST /barredoras or /barredoras.json
  def create
    @barredora = Barredora.new(barredora_params)

    respond_to do |format|
      if @barredora.save
        format.html { redirect_to @barredora, notice: "Barredora was successfully created." }
        format.json { render :show, status: :created, location: @barredora }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @barredora.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barredoras/1 or /barredoras/1.json
  def update
    respond_to do |format|
      if @barredora.update(barredora_params)
        format.html { redirect_to @barredora, notice: "Barredora was successfully updated." }
        format.json { render :show, status: :ok, location: @barredora }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @barredora.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barredoras/1 or /barredoras/1.json
  def destroy
    @barredora.destroy
    respond_to do |format|
      format.html { redirect_to barredoras_url, notice: "Barredora was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barredora
      @barredora = Barredora.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def barredora_params
      params.require(:barredora).permit(:patio_h9, :m21_m22, :san_diego, :j09, :circunvalacion, :mmpp, :a202, :coke, :cal, :comentarios)
    end
end
