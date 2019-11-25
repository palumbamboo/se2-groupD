class ParentsController < ApplicationController

    before_action :authenticate_user!
    before_action :parent_permission
    before_action :parent_auth, except: [:index]

    def index
        @parents = Parent.all
    end

    def show
        set_parent
    end

    def new
        @parent = Parent.new
    end

    def students
        set_parent
        @students = @parent.students
    end

    def show_marks
        set_parent
        @marks = @parent.students.first.marks
        respond_to do |format|
            format.js
            format.html { redirect_to @parent, notice: "Student marks loaded" }
        end
    end

    def switch_child
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
        params.require(:parent).permit(:id, :name, :surname, :email)
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