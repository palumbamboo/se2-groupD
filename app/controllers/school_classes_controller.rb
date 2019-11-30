class SchoolClassesController < ApplicationController

  def index
    @school_classes = SchoolClass.all
  end

  def show
    set_school_class
  end

  def edit
    set_school_class
    @students = @school_class.students
    @students_available = SchoolClass.find_by(number: 0).students
    respond_to do |format|
      format.js
    end
  end

  private
  def set_school_class
    @school_class = SchoolClass.find(params[:id])
  end
end
