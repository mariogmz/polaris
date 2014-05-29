class RecordatoriosController < ApplicationController
  # skip_before_filter :verify_authenticity_token
  before_action :set_recordatorio, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /recordatorios
  # GET /recordatorios.json
  # def index
    # @recordatorios = Recordatorio.all
  # end

  # GET /recordatorios/1
  # GET /recordatorios/1.json
  # def show
  # end

  # GET /recordatorios/new
  def new
    # @recordatorio = Recordatorio.new
    @recordatorio = current_user.recordatorios.build
  end

  # GET /recordatorios/1/edit
  def edit
    if not @recordatorio.user_id.eql? current_user.id
      respond_to do |format|
        format.html do
          flash[:alert] = "No estas autorizado para editar este registro"
          redirect_to root_url
        end
        format.json { render json: {success: false, message: "No estas autorizado para editar este registro"}, status: 422 }
      end
    end
  end

  # POST /recordatorios
  # POST /recordatorios.json
  def create
    @recordatorio = current_user.recordatorios.new(recordatorio_params)

    respond_to do |format|
      if @recordatorio.save
        format.html { redirect_to root_path, notice: 'Creado exitosamente' }
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
    if @recordatorio.user_id.eql? current_user.id
      respond_to do |format|
        if @recordatorio.update(recordatorio_params)
          format.html { redirect_to root_path, notice: 'Editado exitosamente ;)' }
          format.json { render json: {success: true, message: "Editado exitosamente"}, status: 200 }
        else
          format.html { render action: 'edit' }
          format.json { render json: @recordatorio.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: "No tienes autorizacion para realizar eso :("}
        format.json { render json: {success: false, message: "No tienes autorizacion para realizar eso :("}, status: 422 }
      end
    end
  end

  # DELETE /recordatorios/1
  # DELETE /recordatorios/1.json
  def destroy
    if @recordatorio.user_id.eql? current_user.id
      @recordatorio.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: {success: true, message: "Eliminado"}, status: 200 }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: "No tienes autorizacion para realizar eso :("}
        format.json { render json: {success: false, message: "No tienes autorizacion para realizar eso :("}, status: 422 }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recordatorio
      @recordatorio = Recordatorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recordatorio_params
      params.require(:recordatorio).permit(:user_id, :fecha_prestamo, :fecha_entrega, :contacto, :concepto, :detalle, :regresado, :lat, :long)
    end
end
