class WelcomeController < ApplicationController
  layout "welcome"
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def index
    if current_user
      redirect_to direct_user(current_user)
    end
  end

  def choose_role
    @user = current_user
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
