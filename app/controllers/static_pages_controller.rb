class StaticPagesController < ApplicationController
  before_action :require_auth_token, only: :secret
  
  def home
  end

  def about
  end

  def contact
  end
  
  def secret
    respond_to do |format|
      format.html
      format.json { render json: {success: true, message: "Secret page" } }
    end
  end
  
  private
  def require_auth_token
    # Check if user is signed in so no token needed
    return if user_signed_in?
    # If the user isn't signed in, look for auth_token param and check against database
    user_token = params[:auth_token].presence
    user = User.find_by_authentication_token user_token.to_s
    sign_in user
    if not user
      redirect_to root_path, alert: "Invalid authentication token"
    end
  end
end
