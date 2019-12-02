class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception, prepend: true
  before_action :authenticate_user!, except: [:index]
  before_action :user_changed_password?, except: [:index, :destroy]

  def after_sign_in_path_for(resource)
    direct_user(resource)
  end

  def direct_user resource
    return welcome_role_path(resource) if resource.roles.size > 1
    return teacher_path(resource.teacher.id) if resource.teacher?
    return parent_path(resource.parent.id) if resource.parent?
    return officer_path(resource.officer.id) if resource.officer?
    super
  end

  def after_sign_out_path_for(resource_or_scope)
    welcome_index_path(notice: 'Successfully log out')
  end

  def user_changed_password?
    unless current_user.password_changed?
      redirect_to edit_password_path(current_user), alert: 'Please update your password before continue'
    end
  end

end
