# frozen_string_literal: true

class BrusController < ApplicationController
  before_action :set_bru, only: %i[show edit update destroy]

  # GET /brus
  # GET /brus.json
  def index
    @brus = Bru.all
  end

  def resume
    @brus = Bru.last(6)
    @checklists = Checklist.last(3).reverse
  end

  # GET /brus/1
  # GET /brus/1.json
  def show; end

  # GET /brus/new
  def new
    @bru = Bru.new
  end

  # GET /brus/1/edit
  def edit; end

  # POST /brus
  # POST /brus.json
  def create
    @bru = Bru.new(bru_params)

    respond_to do |format|
      if @bru.save
        format.html { redirect_to @bru, notice: 'Bru was successfully created.' }
        format.json { render :show, status: :created, location: @bru }
      else
        format.html { render :new }
        format.json { render json: @bru.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brus/1
  # PATCH/PUT /brus/1.json
  def update
    respond_to do |format|
      if @bru.update(bru_params)
        format.html { redirect_to @bru, notice: 'Bru was successfully updated.' }
        format.json { render :show, status: :ok, location: @bru }
      else
        format.html { render :edit }
        format.json { render json: @bru.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brus/1
  # DELETE /brus/1.json
  def destroy
    @bru.destroy
    respond_to do |format|
      format.html { redirect_to brus_url, notice: 'Bru was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bru
    @bru = Bru.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bru_params
    params.require(:bru).permit(:fecha, :ingreso, :salida, :patente, :mmpp, :comentarios, :numero)
  end
end
