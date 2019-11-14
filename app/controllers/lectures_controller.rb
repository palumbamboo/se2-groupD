class LecturesController < ApplicationController

  def index
    @lectures = Lecture.all
  end

  def new
    raise "Missing Teacher" unless params[:teacher_id]

    @teacher = Teacher.find(params[:teacher_id])
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(lecture_params.merge(start_time: Date.today))

    if @lecture.save
      session[:current_lecture] = @lecture
      redirect_to teacher_url(@lecture.teacher)
    end
  end

  def show
    set_lecture
  end

  def edit
    set_lecture
    @teacher = @lecture.teacher
  end

  def update
    set_lecture
    if @lecture.update_attributes(lecture_params)
      redirect_to lectures_url, notice: 'Lecture updated'
    end
  end

  def destroy
    set_lecture
    @lecture.destroy
    redirect_to lectures_url, notice: 'Lecture deleted'
  end

  private
  def lecture_params
    params.require(:lecture).permit(:name, :topics, :school_class_id, :teacher_id, :subject)
  end

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end

end

