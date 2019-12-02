class PasswordsController < ApplicationController
  skip_before_action :user_changed_password?

  layout 'welcome'

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      current_user.password_changed = true
      current_user.save
      bypass_sign_in(current_user)
      redirect_to direct_user(current_user), notice: 'Password updated'
    else
      render :edit, notice: 'Password update failed, retry'
    end
  end

  private
  def user_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
