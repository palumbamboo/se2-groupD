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

  def assignments
    set_teacher
    @school_classes = @teacher.school_classes
    if params[:school_class_id]
      @school_class = @school_classes.find(params[:school_class_id])
      @subjects = Assignment.where(school_class_id: @school_class.id, teacher: @teacher).select(:subject).distinct
    else
      @school_class = @school_classes.first
      @subjects = Assignment.where(school_class_id: @school_class.id, teacher: @teacher).select(:subject).distinct
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def assignments_per_subject
    set_teacher
    sc = @teacher.school_classes.find(params[:school_class_id])
    @subject = params[:sub]
    @assignments = Assignment.where(school_class_id: sc.id, subject: params[:sub], teacher: @teacher)
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
