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
        format.html { redirect_to administrator_add_user_url(current_user.administrator.id), notice: 'Teacher successfully created'}
      end
    else
      format.html { redirect_to administrator_add_user_url(current_user.administrator.id), alert: @teacher.print_pretty_errors}
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

  def timetables
    set_teacher
    @classes = SchoolClass.available_classes
    if params[:school_class_id]
      @class = SchoolClass.find(params[:school_class_id])
    else
      @class = SchoolClass.available_classes.first
    end
    @subjects = Timetable.where(school_class_id: @class.id, teacher_id: @teacher.id).select(:subject).distinct
    @monday = Timetable.where(school_class_id: @class.id, day_of_week: "1", teacher_id: @teacher.id).select(:subject)
    @tuesday = Timetable.where(school_class_id: @class.id, day_of_week: "2", teacher_id: @teacher.id).select(:subject)
    @wednesday = Timetable.where(school_class_id: @class.id, day_of_week: "3", teacher_id: @teacher.id).select(:subject)
    @thursday = Timetable.where(school_class_id: @class.id, day_of_week: "4", teacher_id: @teacher.id).select(:subject)
    @friday = Timetable.where(school_class_id: @class.id, day_of_week: "5", teacher_id: @teacher.id).select(:subject)
    respond_to do |format|
      format.js
      format.html
    end
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
