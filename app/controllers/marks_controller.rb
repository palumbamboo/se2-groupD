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
        @mark.date = @mark.date.to_date
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

        respond_to do |format|
            if @mark.update_attributes(mark_params)
                format.js
                format.html { redirect_to @mark, notice: "Mark updated" }
                format.json { render :show, status: :created, location: @mark }
            else
                format.html { render :new }
                format.json { render json: @mark.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        set_mark

        respond_to do |format|
            if @mark.destroy
                format.js
                format.html { redirect_to @mark, notice: "Mark deleted" }
                format.json { render :show, status: :created, location: @mark }
            else
                format.html { render :new }
                format.json { render json: @mark.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def set_mark
        @mark = Mark.find(params[:id])
    end

    def mark_params
        params.require(:mark).permit(:id, :mark, :subject, :student_id, :teacher_id, :notes, :date)
    end
end