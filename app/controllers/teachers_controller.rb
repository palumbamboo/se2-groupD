class TeachersController < ApplicationController

  before_action :authenticate_user!
  before_action :teacher_auth

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def show
    set_teacher
    @lectures = @teacher.lectures
  end

  def create
    user = User.initialize_user(params[:email])

    @teacher = Teacher.new(name: params[:name], surname: params[:surname], user: user)
    @teacher.school_classes << SchoolClass.find(params[:school_class].to_i)
    @teacher.subjects = params[:subjects].split(' ')
    if @teacher.save
      otp = Devise.friendly_token(20)
      user.update(password: otp)
      OfficerMailer.with(user: user, current_pass: otp).credential_mail.deliver_now
      respond_to do |format|
        format.js
      end
    else
      render :new
    end
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

  def notes
    set_teacher
    @notes = Note.where(teacher_id: params[:id])
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

  def materials
    set_teacher
    @school_classes = @teacher.school_classes
    if params[:school_class_id]
      @school_class = @school_classes.find(params[:school_class_id])
      @subjects = Material.where(school_class_id: @school_class.id, teacher: @teacher).select(:subject).distinct
    else
      @school_class = @school_classes.first
      @subjects = Material.where(school_class_id: @school_class.id, teacher: @teacher).select(:subject).distinct
    end
    respond_to do |format|
      format.js
      format.html
    end
  end


  def materials_per_subject
    set_teacher
    sc = @teacher.school_classes.find(params[:school_class_id])
    @subject = params[:sub]
    @materials = Material.where(school_class_id: sc.id, subject: params[:sub], teacher: @teacher)
  end

  private
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end


  def teacher_auth
    return true if (current_user.teacher? && current_user.teacher.id == params[:id].to_i) || current_user.administrator?
    redirect_to teacher_path(current_user.teacher.id), alert: "Permission denied"
  end
end
