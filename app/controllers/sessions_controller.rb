class SessionsController < ApplicationController
  before_filter :require_signin!, only: [:destroy]
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.nil?
      @user = User.new
      render :new
    else
      login_user!
    end
  end

  def destroy
    current_user.reset_session_token!
    self.session[:session_token] = nil

    redirect_to new_session_url
  end
end
