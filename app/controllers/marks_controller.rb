class MarksController < ApplicationController

    def index
        @marks = Mark.all
    end

    def show
        set_mark
    end

    def new
        @mark = Mark.new
    end

    def create
        @mark = Mark.new(mark_params)
        @mark.date = Date.civil(params[:mark]["date(1i)"].to_i,params[:mark]["date(2i)"].to_i,params[:mark]["date(3i)"].to_i)
        if @mark.save
            redirect_to marks_url, notice: 'Mark created'
        end
    end

    def edit
        set_mark
    end

    def update
        set_mark
        if @mark.update_attributes(mark_params)
            redirect_to marks_url, notice: 'Mark updated'
        end
    end

    def destroy
        set_mark
        @mark.destroy
        redirect_to marks_url, notice: 'Mark deleted'
    end

    private

    def set_mark
        @mark = Mark.find(params[:id])
    end

    def mark_params
        params.require(:mark).permit(:id, :mark, :subject, :student_id, :teacher_id, :notes)
    end
end