class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return nil if self.session[:session_token].nil?
    @current_user ||= User.find_by(session_token: self.session[:session_token])
  end

  def login!(user)
    # @user.reset_session_token!
    # self.session[:session_token] = @user.session_token
    #
    # redirect_to users_url
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def log_out!
    self.session[:session_token] = nil
  end

  def require_signin!
    redirect_to new_session_url if current_user.nil?
  end

end
