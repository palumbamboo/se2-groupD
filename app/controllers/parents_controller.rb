class ParentsController < ApplicationController

    before_action :authenticate_user!
    before_action :parent_permission
    before_action :parent_auth, except: [:index]

    def index
        @parents = Parent.all
    end

    def show
        set_parent
        @students = @parent.students
    end

    def new
        @parent = Parent.new
    end

    def students
        set_parent
        @students = @parent.students
        if params[:stud]
            @student = @parent.students.find(params[:stud])
            @subjects = Mark.where(student_id: params[:stud]).select(:subject).distinct
        else
            @student = @parent.students.first
            @subjects = Mark.where(student_id: @student.id).select(:subject).distinct
        end
        respond_to do |format|
            format.js
            format.html
        end
    end

    def marks_per_subject
        set_parent
        @subject = params[:sub]
        @marks = Mark.where(student_id: params[:stud], subject: params[:sub])
    end

    def assignments
        set_parent
        @students = @parent.students
        if params[:stud]
            @student = @students.find(params[:stud])
            @subjects = Assignment.where(school_class: @student.school_class).select(:subject).distinct
        else
            @student = @students.first
            @subjects = Assignment.where(school_class: @student.school_class).select(:subject).distinct
        end
        respond_to do |format|
            format.js
            format.html
        end
    end

    def assignments_per_subject
        set_parent
        s = @parent.students.find(params[:stud])
        @subject = params[:sub]
        @assignments = Assignment.where(school_class: s.school_class, subject: params[:sub])
    end

    def communications
        set_parent
        if params[:expiry_date_select] && params[:expiry_date_select] == "Valid"
            @communications = Communication.where("expiry_date >= ?", Date.today)
        elsif params[:expiry_date_select] && params[:expiry_date_select] == "Expired"
            @communications = Communication.where("expiry_date < ?", Date.today)
        else
            @communications = Communication.all
        end
        respond_to do |format|
            format.js
            format.html
        end
    end

    def attendances
        set_parent
        @students = @parent.students
        if params[:stud]
            @student = @students.find(params[:stud])
            if params[:month]
                @attendances = Attendance.where('extract(month from date) = ?', params[:month]).select{ |a| a.student_id == @student.id }
            else
                @attendances = Attendance.where('extract(month from date) = ?', Date.today.strftime("%m")).select{ |a| a.student_id == @student.id }
            end
        else
            @student = @students.first
            if params[:month]
                @attendances = Attendance.where('extract(month from date) = ?', params[:month]).select{ |a| a.student_id == @student.id }
            else
                @attendances = Attendance.where('extract(month from date) = ?', Date.today.strftime("%m")).select{ |a| a.student_id == @student.id }
            end
        end

        respond_to do |format|
            format.js
            format.html
        end
    end

    def create
        @parent = Parent.new(parent_params)
        if @parent.save
            redirect_to parents_url, notice: 'Parent created'
        end
    end

    def edit
        set_parent
    end

    def update
        set_parent
        if @parent.update_attributes(parent_params)
            redirect_to parents_url, notice: 'Parent updated'
        end
    end

    def destroy
        set_parent
        @parent.destroy
        redirect_to parents_url, notice: 'Parent deleted'
    end

    private

    def set_parent
        @parent = Parent.find(params[:id])
    end

    def parent_params
        params.require(:parent).permit(:id, :name, :surname, :email, :access_enabled)
    end

    def parent_permission
        return true if current_user.parent?
        redirect_to welcome_index_path, alert: 'Missing require permissions'
    end

    def parent_auth
        return true if current_user.parent.id == params[:id].to_i
        redirect_to parent_path(current_user.parent.id), alert: "Permission denied"
    end

end