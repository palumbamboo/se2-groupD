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
      student.school_class = @school_class
      student.save
    end
    @previous_students.where.not(id: params[:students_to_add]).each do |student|            # if some of the previous students is
      student.school_class = SchoolClass.find_or_create_by(number: 0)                       # deselected, 'zero' class is assigned
      student.save                                                                          # to him/her -> the student doesn't have
    end                                                                                     # a class anymore                                                        
  end

  def file_import
    set_school_class
    @previous_students = @school_class.students
    uploaded_file = params[:class_file]
    file_path = Rails.root.join('tmp', uploaded_file.original_filename)
    File.open(file_path, 'wb') do |file|
      file.write(uploaded_file.read)
    end
    wb = Roo::Excelx.new(file_path)
    sheet = wb.sheet(0)
    all_ssns = [""]
    if(sheet.row(1) == ["Name", "Surname", "SSN"])    # check first header row
      (2..sheet.last_row).map do |i|
        if sheet.cell(i, 3)                   # check that the SSN isn't empty
          all_ssns << sheet.cell(i, 3)
        end
      end
    end
    File.delete(file_path)
    puts all_ssns
    Student.where(fiscal_code: all_ssns).each do |student|
      student.school_class = @school_class
      student.save
    end
    @previous_students.where.not(fiscal_code: all_ssns).each do |student|
      student.school_class = SchoolClass.find_or_create_by(number: 0)
      student.save
    end
  end

  private
  def set_school_class
    @school_class = SchoolClass.find(params[:id])
  end
end
