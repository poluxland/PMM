# frozen_string_literal: true

class MmppsController < ApplicationController
  before_action :set_mmpp, only: %i[show edit update destroy]

  # GET /mmpps
  # GET /mmpps.json
  def index
    @mmpps = Mmpp.all
  end

  # GET /mmpps/1
  # GET /mmpps/1.json
  def show; end

  # GET /mmpps/new
  def new
    @mmpp = Mmpp.new
  end

  # GET /mmpps/1/edit
  def edit; end

  # POST /mmpps
  # POST /mmpps.json
  def create
    @mmpp = Mmpp.new(mmpp_params)

    respond_to do |format|
      if @mmpp.save
        format.html { redirect_to @mmpp, notice: 'Materia prima creada con exito' }
        format.json { render :show, status: :created, location: @mmpp }
      else
        format.html { render :new }
        format.json { render json: @mmpp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mmpps/1
  # PATCH/PUT /mmpps/1.json
  def update
    respond_to do |format|
      if @mmpp.update(mmpp_params)
        format.html { redirect_to @mmpp, notice: 'Mmpp actualizada.' }
        format.json { render :show, status: :ok, location: @mmpp }
      else
        format.html { render :edit }
        format.json { render json: @mmpp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mmpps/1
  # DELETE /mmpps/1.json
  def destroy
    @mmpp.destroy
    respond_to do |format|
      format.html { redirect_to mmpps_url, notice: 'Mmpp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mmpp
    @mmpp = Mmpp.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mmpp_params
    params.require(:mmpp).permit(:nombre, :descripcion, :densidad)
  end
end
