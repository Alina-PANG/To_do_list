class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_user_name(params[:session][:user_name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      flash[:notice] = 'Logged in!'
      redirect_to user_lists_path(user)
    else
      flash.now.alert = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    flash[:notice] = 'Logged out!'
    redirect_to root_url
  end
end
