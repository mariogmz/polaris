#module Users
  class Api::RegistrationsController < Devise::RegistrationsController
    skip_before_action :verify_authenticity_token
    #before_filter :ensure_email_param_exists, only: [:register]
    #before_filter :ensure_password_param_exists, only: [:register]
    #before_filter :ensure_password_confirmation_param_exists, only: [:register]
    
    respond_to :json
    def register

      # user = User.new(email: [params[:email], password: params[:password]])
      user = User.new(user_params)
      if user.save
        render :json=> user.as_json(:auth_token=>user.authentication_token, :email=>user.email), :status=>201
        #begin
          #render :json=> user.as_json(:auth_token=>user.authentication_token, :email=>user.email), :status=>201
        #rescue
          #user.destroy
          #render :json=> {succes: false, message: "Failed creating user", status: :unprocessable_entity}
        #end
        return
      else
        warden.custom_failure!
        render :json=> user.errors, :status=>422
      end
    end
    
    private
    def user_params
      params.require(:user).permit(:email, :password)
    end
    
    protected
    
    def ensure_email_param_exists
      ensure_params_exist :email
    end
    
    def ensure_password_param_exists
      ensure_params_exist :password
    end
    
    def ensure_password_confirmation_param_exists
      ensure_params_exist :password_confirmation
    end
    
    def ensure_params_exist(param)
      return unless params[param].blank?
      render json: {succes: false, message: "Missing #{param} parameter: #{params[param]}", status: :unprocessable_entity}
    end
  end
  #end