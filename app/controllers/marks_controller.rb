class MarksController < ApplicationController

    def index
        @marks = Mark.all
    end

    def show
        set_mark
    end

    def new
        if params[:teacher_id]
            @teacher = Teacher.find(params[:teacher_id])
        end
        @mark = Mark.new
    end

    def create
        @mark = Mark.new(mark_params)
        # @mark.date = Date.civil(params[:mark]["date(1i)"].to_i,params[:mark]["date(2i)"].to_i,params[:mark]["date(3i)"].to_i)
        respond_to do |format|
            if @mark.save
                format.js
                format.html { redirect_to @mark, notice: "Mark created" }
                format.json { render :show, status: :created, location: @mark }
            else
                format.html { render :new }
                format.json { render json: @mark.errors, status: :unprocessable_entity }
            end
        end
    end

    def edit
        set_mark
        @teacher = @mark.teacher
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
        params.require(:mark).permit(:id, :mark, :subject, :student_id, :teacher_id, :notes, :date)
    end
end