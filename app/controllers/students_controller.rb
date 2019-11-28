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
            otp = Devise.friendly_token(20) #Generate a one-time password that will be used for creating the user
            first_parent_user = User.create(email: params["first_parent_email"], password: otp) #Basic password just for debug
            first_parent = Parent.new(name: params["first_parent_name"].to_s, surname: params["first_parent_surname"])
            first_parent.user = first_parent_user
            first_parent.students << @student # Attach the parent to the current student and viceversa
            if first_parent.save
            else   
                puts first_parent.errors.full_messages #For debugging purposes    
            end
        end
        if params["second_parent_name"].present? && params["second_parent_surname"].present? && params["second_parent_email"].present?
            otp = Devise.friendly_token(20) #Generate a one-time password that will be used for creating the user
            second_parent_user = User.create(email: params["second_parent_email"], password: otp) #Basic password just for debug
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
        if params["first_parent_name"].present? && params["first_parent_surname"].present? && params["first_parent_email"].present?
            first_parent = @student.parents.first
            current_name = first_parent.name
            current_surname = first_parent.surname
            if current_name != params["first_parent_name"] && current_surname != params["first_parent_surname"]
                first_parent.update(name: params["first_parent_name"], surname: params["first_parent_surname"])
            elsif current_name != params["first_parent_name"] && current_surname == params["first_parent_surname"]
                first_parent.update(name: params["first_parent_name"])
            elsif current_name == params["first_parent_name"] && current_surname != params["first_parent_surname"] 
                first_parent.update(surname: params["first_parent_surname"])
            end  
        end
        if params["second_parent_name"].present? && params["second_parent_surname"].present? && params["second_parent_email"].present?
            second_parent = @student.parents.second
            current_name = second_parent.name
            current_surname = second_parent.surname
            if current_name != params["second_parent_name"] && current_surname != params["second_parent_surname"]
                second_parent.update(name: params["second_parent_name"], surname: params["second_parent_surname"])
            elsif current_name != params["second_parent_name"] && current_surname == params["second_parent_surname"]
                second_parent.update(name: params["second_parent_name"])
            elsif current_name == params["second_parent_name"] && current_surname != params["second_parent_surname"] 
                second_parent.update(surname: params["second_parent_surname"])
            end  
        end
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
        params.require(:student).permit(:name, :surname, :fiscal_code, :enrollment_date, :birth_date, :school_class_id)
    end

end