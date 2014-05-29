class Api::RemindersController < RecordatoriosController
  skip_before_filter :verify_authenticity_token
  before_filter :authorize_by_token, only: [:create, :update, :destroy]
  # GET /recordatorios
  # GET /recordatorios.json
  def index
    if user_signed_in?
      @recordatorios = current_user.recordatorios.all
    end
  end
  
  private
  def authorize_by_token
    user_token = params[:auth_token].presence
    user       = user_token && User.find_by_authentication_token(user_token.to_s)
    if not user && Devise.secure_compare(user.email, current_user.email)
      render json: {success: false, message: "No autorizado"}, status: 422
      return
    end
  end
end