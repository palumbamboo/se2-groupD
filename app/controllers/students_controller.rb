class StudentsController < ApplicationController

    def index
        @students = Student.all
    end

    def show
        set_student
    end

    def new
        @student = Student.new
    end

    def marks
        set_student
        @student.marks.to_json
    end

    def create
        @student = Student.new(student_params)
        @student.birth_date = Date.civil(params[:student]["birth_date(1i)"].to_i,params[:student]["birth_date(2i)"].to_i,params[:student]["birth_date(3i)"].to_i)
        @student.enrollment_date = Date.civil(params[:student]["enrollment_date(1i)"].to_i,params[:student]["enrollment_date(2i)"].to_i,params[:student]["enrollment_date(3i)"].to_i)
        if @student.save
            redirect_to students_url, notice: 'Student created'
        end
    end

    def edit
        set_student
    end

    def update
        set_student
        @student.birth_date = Date.civil(params[:student]["birth_date(1i)"].to_i,params[:student]["birth_date(2i)"].to_i,params[:student]["birth_date(3i)"].to_i)
        @student.enrollment_date = Date.civil(params[:student]["enrollment_date(1i)"].to_i,params[:student]["enrollment_date(2i)"].to_i,params[:student]["enrollment_date(3i)"].to_i)
        @student.update_attributes(student_params)
        if @student.save
            redirect_to students_url, notice: 'Student updated'
        end
        
    end

    def destroy
        set_student
        @student.destroy
        redirect_to students_url, notice: 'Student destroyed'
    end

    private

    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:name, :surname, :fiscal_code)
    end

end