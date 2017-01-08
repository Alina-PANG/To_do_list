class PasswordResetsController < ApplicationController
  def new; end

  def create
    user = User.find_by_user_name(params[:user_name])
    user.send_password_reset if user
    redirect_to root_url, notice: 'Email sent with password reset instructions.'
  end

  def edit
    @user = if current_user
              current_user
            else
              User.find_by_password_reset_token!(params[:id])
            end
  end

  def update
    if current_user
      @user = current_user
      if @user.update(user_params)
        flash[:notice] = 'Password has been reset!'
        redirect_to user_lists_path(@user)
      else
        render 'edit'
      end

    else
        redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password, :email)
  end
end
