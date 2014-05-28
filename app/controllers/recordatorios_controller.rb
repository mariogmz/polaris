class RecordatoriosController < ApplicationController
  before_action :set_recordatorio, only: [:show, :edit, :update, :destroy]

  # GET /recordatorios
  # GET /recordatorios.json
  def index
    @recordatorios = Recordatorio.all
  end

  # GET /recordatorios/1
  # GET /recordatorios/1.json
  def show
  end

  # GET /recordatorios/new
  def new
    @recordatorio = Recordatorio.new
  end

  # GET /recordatorios/1/edit
  def edit
  end

  # POST /recordatorios
  # POST /recordatorios.json
  def create
    @recordatorio = Recordatorio.new(recordatorio_params)

    respond_to do |format|
      if @recordatorio.save
        format.html { redirect_to @recordatorio, notice: 'Recordatorio was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recordatorio }
      else
        format.html { render action: 'new' }
        format.json { render json: @recordatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recordatorios/1
  # PATCH/PUT /recordatorios/1.json
  def update
    respond_to do |format|
      if @recordatorio.update(recordatorio_params)
        format.html { redirect_to @recordatorio, notice: 'Recordatorio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recordatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recordatorios/1
  # DELETE /recordatorios/1.json
  def destroy
    @recordatorio.destroy
    respond_to do |format|
      format.html { redirect_to recordatorios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recordatorio
      @recordatorio = Recordatorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recordatorio_params
      params.require(:recordatorio).permit(:user_id, :fecha_prestamo, :fecha_entrega, :contacto, :concepto, :detalle, :regresado)
    end
end
