class TeachersController < ApplicationController

  before_action :authenticate_user!
  before_action :teacher_permission
  before_action :teacher_auth, except: [:index]

  def index
    @teachers = Teacher.all
  end

  def show
    set_teacher
    @lectures = @teacher.lectures
  end

  def lectures
    set_teacher
    if params[:school_class_id]
      @school_class = @teacher.school_classes.find(params[:school_class_id])
    else
      @school_class = @teacher.school_classes.first
    end
    @lectures = @teacher.lectures.where(school_class_id: @school_class.id)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def marks
    set_teacher
    @marks = @teacher.marks
  end

  private
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_permission
    return true if current_user.teacher?
    redirect_to welcome_index_path, alert: 'Missing require permissions'
  end

  def teacher_auth
    return true if current_user.teacher.id == params[:id].to_i
    redirect_to teacher_path(current_user.teacher.id), alert: "Permission denied"
  end
end
