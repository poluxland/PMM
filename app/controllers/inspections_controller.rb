class InspectionsController < ApplicationController
  before_action :set_inspection, only: %i[ show edit update destroy ]

  # GET /inspections or /inspections.json
  def index
    @inspections = Inspection.all
    @lca = Inspection.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day).where(plant_id: 1)
    @vts = Inspection.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day).where(plant_id: 2)
    @ptm = Inspection.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day).where(plant_id: 3)
  end
  
  def full
    @inspections = Inspection.all
  end


  # GET /inspections/1 or /inspections/1.json
  def show
  end

  # GET /inspections/new
  def new
    @inspection = Inspection.new
  end

  # GET /inspections/1/edit
  def edit
  end

  # POST /inspections or /inspections.json
  def create
    @inspection = Inspection.new(inspection_params)

    respond_to do |format|
      if @inspection.save
        format.html { redirect_to @inspection, notice: "Inspection was successfully created." }
        format.json { render :show, status: :created, location: @inspection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inspections/1 or /inspections/1.json
  def update
    respond_to do |format|
      if @inspection.update(inspection_params)
        format.html { redirect_to @inspection, notice: "Inspection was successfully updated." }
        format.json { render :show, status: :ok, location: @inspection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inspections/1 or /inspections/1.json
  def destroy
    @inspection.destroy
    respond_to do |format|
      format.html { redirect_to inspections_url, notice: "Inspection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inspection
      @inspection = Inspection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inspection_params
      params.require(:inspection).permit(:plant_id, :area_id, :tarea_id, :supervisor_id, :trabajadores, :ast, :pts, :epp, :subsitio, :cumplimiento, :comentarios, :apr_id)
    end
end
