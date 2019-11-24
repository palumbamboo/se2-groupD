class TeachersController < ApplicationController

  before_action :authenticate_user!
  before_action :teacher_permission

  def index
    @teachers = Teacher.all
  end

  def show
    set_teacher
    @lectures = @teacher.lectures
  end

  def add_mark

  end

  def lectures
    set_teacher
    @lectures = @teacher.lectures
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
    redirect_to welcome_index_path, alert: 'Missing require permissions' unless current_user.teacher?
    true
  end
end
