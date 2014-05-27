class Api::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  
  respond_to :json
  def register
    # If the user is signed in then (s)he cannot create any more accounts until signed 
    if user_signed_in?
      render json: {success: false, message: "Ya iniciaste sesión"}, status: 418
      return
    end

    user = User.new(user_params)
    if user.save
      # Sign in the user automatically
      sign_in user
      render :json=> user.as_json(:auth_token=>user.authentication_token, :email=>user.email), :status=>201
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
end