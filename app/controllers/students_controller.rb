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
        if params["first_parent_name"].present? && params["first_parent_surname"].present? && params["first_parent_email"].present?
            first_parent_user = User.create(email: params["first_parent_email"], password: "Prova123") #Basic password just for debug
            first_parent = Parent.new(name: params["first_parent_name"].to_s, surname: params["first_parent_surname"])
            first_parent.user = first_parent_user
            first_parent.students << @student # Attach the parent to the current student and viceversa
            if first_parent.save
            else   
                puts first_parent.errors.full_messages #For debugging purposes    
            end
        end
        if params["second_parent_name"].present? && params["second_parent_surname"].present? && params["second_parent_email"].present?
            second_parent_user = User.create(email: params["second_parent_email"], password: "Prova123") #Basic password just for debug
            second_parent = Parent.new(name: params["second_parent_name"].to_s, surname: params["second_parent_surname"])
            second_parent.user = second_parent_user
            second_parent.students << @student
            if second_parent.save
            else   
                puts second_parent.errors.full_messages #For debugging purposes    
            end
        end
        if @student.save
            redirect_to students_url, notice: 'Student created'
        else
            render :new 
        end
    end

    def edit
        set_student
    end

    def update
        set_student
        @student.update(student_params)
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
        params.require(:student).permit(:name, :surname, :fiscal_code, :enrollment_date, :birth_date, :school_class_id, :first_parent_name, :first_parent_surname, :first_parent_email, :second_parent_name, :second_parent_surname, :second_parent_email)
    end

end