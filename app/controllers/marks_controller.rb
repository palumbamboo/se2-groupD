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
        @teacher = Teacher.find(mark_params[:teacher_id] || current_user.teacher.id)
        @mark.teacher = @teacher

        respond_to do |format|
            if @mark.save
                format.js
                format.html { redirect_to request.referer, notice: "Mark created" }
                format.json { render :show, status: :created, location: @mark }
            else
                format.js
                format.html { redirect_to request.referer, alert: @mark.print_pretty_errors }
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
                format.html { redirect_to request.referer, notice: "Mark updated" }
                format.json { render :show, status: :ok, location: @mark }
            else
                format.html { render :edit }
                format.json { render json: @mark.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        set_mark

        respond_to do |format|
            if @mark.destroy
                format.html { redirect_to request.referer, notice: "Mark correctly deleted" }
                format.json { render :show, status: :created, location: @mark }
            else
                format.html { redirect_to request.referer, alert: "Mark can't be deleted!" }
                format.json { render json: @mark.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def set_mark
        @mark = Mark.find(params[:id])
    end

    def mark_params
        p = params.require(:mark).permit(:id, :mark, :subject, :student_id, :teacher_id, :notes, :date)
        p[:mark] = p[:mark].to_f
        p[:date] = Date.parse(p[:date])
        p
    end
end