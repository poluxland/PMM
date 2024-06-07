class EstadoCanchasController < ApplicationController
  before_action :set_estado_cancha, only: %i[ show edit update destroy ]

  # GET /estado_canchas or /estado_canchas.json
  def index
    @estado_canchas = EstadoCancha.last(10)

     @chart_data = prepare_chart_data

  end

  # GET /estado_canchas/1 or /estado_canchas/1.json
  def show
  end

  # GET /estado_canchas/new
  def new
    @estado_cancha = EstadoCancha.new
  end

  # GET /estado_canchas/1/edit
  def edit
  end

  # POST /estado_canchas or /estado_canchas.json
  def create
    @estado_cancha = EstadoCancha.new(estado_cancha_params)

    respond_to do |format|
      if @estado_cancha.save
        format.html { redirect_to estado_canchas_url, notice: "Estado cancha was successfully created." }
        format.json { render :show, status: :created, location: @estado_cancha }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estado_cancha.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_canchas/1 or /estado_canchas/1.json
  def update
    respond_to do |format|
      if @estado_cancha.update(estado_cancha_params)
        format.html { redirect_to estado_cancha_url(@estado_cancha), notice: "Estado cancha was successfully updated." }
        format.json { render :show, status: :ok, location: @estado_cancha }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estado_cancha.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_canchas/1 or /estado_canchas/1.json
  def destroy
    @estado_cancha.destroy

    respond_to do |format|
      format.html { redirect_to estado_canchas_url, notice: "Estado cancha was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_cancha
      @estado_cancha = EstadoCancha.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estado_cancha_params
      params.require(:estado_cancha).permit(:quilimari, :cachinales, :ñilhue, :caolin, :fierro, :puzolana, :tunga, :ceniza, :yeso, :conchuela, :san_pedro, :observaciones, :clinker_a, :clinker_b)
    end

    def prepare_chart_data
  last_record = EstadoCancha.last
  return {} unless last_record

  {
    'Quilimari' => last_record.quilimari,
    'Cachinales' => last_record.cachinales,
    'Ñilhue' => last_record.ñilhue,
    'Caolin' => last_record.caolin,
    'Fierro' => last_record.fierro,
    'Puzolana' => last_record.puzolana,
    'Tunga' => last_record.tunga,
    'Poroso' => last_record.ceniza,
    'Yeso' => last_record.yeso,
    'Conchuela' => last_record.conchuela,
    'Petcoke' => last_record.san_pedro,
    'Clinker A' => last_record.clinker_a,
    'Clinker B' => last_record.clinker_b
  }
end

end
