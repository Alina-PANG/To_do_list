class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_user_name(params[:user_name])
    user.send_password_reset if user
    redirect_to root_url, :notice => "Email sent with password reset instructions."
  end

  def edit
    if current_user
      @user = current_user
    else
      @user = User.find_by_password_reset_token!(params[:id])
    end
  end

  def update
    if current_user
      @user = current_user
      if @user.update(user_params)
        flash[:notice] = "Password has been reset!"
        redirect_to user_lists_path(@user)
      else
        render 'edit'
      end

    else
      @user = User.find_by_password_reset_token!(params[:id])
      if @user.password_reset_sent_at < 2.hours.ago
        redirect_to new_password_reset_path, :alert => "Password reset has expired."
      elsif @user.update(user_params)
        flash[:notice] = "Password has been reset!"
        redirect_to user_lists_path(@user)
      else
        render 'edit'
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password, :email)
  end
end
