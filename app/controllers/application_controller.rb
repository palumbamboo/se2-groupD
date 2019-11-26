class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception, prepend: true
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    return root_path if resource.roles.size > 1
    return teacher_path(resource.teacher.id) if resource.teacher?
    return parent_path(resource.parent.id) if resource.parent?
    return officer_path(resource.officer.id) if resource.officer?
    super
  end

end
