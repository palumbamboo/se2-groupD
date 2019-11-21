class TeachersController < ApplicationController

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
  end

  private
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
