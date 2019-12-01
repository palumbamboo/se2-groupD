class SchoolClassesController < ApplicationController

  def index
    @school_classes = SchoolClass.available_classes
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

  def update
    set_school_class
    @previous_students = @school_class.students
    Student.where(id: params[:students_to_add]).each do |student| # setting school class id for each student selected
      student.school_class_id = @school_class.id
      student.save
    end
    @previous_students.where.not(id: params[:students_to_add]).each do |student|            # if some of the previous students is
      student.school_class_id = SchoolClass.where(number: 0, section: 0).first.id           # deselected, 'zero' class is assigned
      student.save                                                                          # to him/her -> the student doesn't have
    end                                                                                     # a class anymore                                                        
  end

  private
  def set_school_class
    @school_class = SchoolClass.find(params[:id])
  end
end
