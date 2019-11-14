class ParentsController < ApplicationController

    def index
        @parents = Parent.all
    end

    def show
        set_parent
    end

    def new
        @parent = Parent.new
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

end