class Api::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  before_filter :authenticate_user!, :except => [:create]
  before_filter :ensure_params_exist
  respond_to :json

  def create
    resource = User.find_for_database_authentication(:email => params[:user_login][:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user_login][:password])
      sign_in(:user, resource)
      resource.ensure_authentication_token!
      render :json=> {:success=>true, :auth_token=>resource.authentication_token, :email=>resource.email}
      return
    end
    invalid_login_attempt
  end

  def destroy
    # resource = User.find_for_database_authentication(:email => params[:user_login][:email])
    # resource.authentication_token = nil
    # resource.save
    # if user_signed_in?
    if current_user.email.eql? params[:user_login]
      current_user.reset_authentication_token!
      sign_out current_user
      render :json=> {:success=>true}, status: :ok
    else
      render :json => {success: false, message: "Not correct user"}, status: 403
    end
      # else
      #  render :json => {success: false, message: "Not signed in"}, status: 403
      # end 
  end

  protected
  def ensure_params_exist
    return unless params[:user_login].blank?
    render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
  end

  def invalid_login_attempt
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end
  
  def ensure_params_for_delete_exists
  end
end