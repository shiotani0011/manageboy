class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
        include DeviseTokenAuth::Concerns::SetUserByToken
        
  skip_before_action :verify_authenticity_token

  helper_method :login!, :current_user

  def login!
      session[:user_id] = @user.id
  end

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
