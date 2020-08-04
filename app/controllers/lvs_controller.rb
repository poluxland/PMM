class LvsController < ApplicationController
  before_action :set_lv, only: [:show, :edit, :update, :destroy]

  # GET /lvs
  # GET /lvs.json
  def index
    @lvs = Lv.all
  end

  # GET /lvs/1
  # GET /lvs/1.json
  def show
  end

  # GET /lvs/new
  def new
    @lv = Lv.new
  end

  # GET /lvs/1/edit
  def edit
  end

  # POST /lvs
  # POST /lvs.json
  def create
    @lv = Lv.new(lv_params)

    respond_to do |format|
      if @lv.save
        format.html { redirect_to @lv, notice: 'Lv was successfully created.' }
        format.json { render :show, status: :created, location: @lv }
      else
        format.html { render :new }
        format.json { render json: @lv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lvs/1
  # PATCH/PUT /lvs/1.json
  def update
    respond_to do |format|
      if @lv.update(lv_params)
        format.html { redirect_to @lv, notice: 'Lv was successfully updated.' }
        format.json { render :show, status: :ok, location: @lv }
      else
        format.html { render :edit }
        format.json { render json: @lv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lvs/1
  # DELETE /lvs/1.json
  def destroy
    @lv.destroy
    respond_to do |format|
      format.html { redirect_to lvs_url, notice: 'Lv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lv
      @lv = Lv.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lv_params
      params.require(:lv).permit(:proceso, :obervado, :observador, :altura, :izaje, :eemm, :lototo)
    end
end
