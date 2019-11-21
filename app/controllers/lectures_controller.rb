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
    @lecture = Lecture.new(lecture_params.merge(start_time: Time.now))

    respond_to do |format|
      if @lecture.save
        format.js
        format.html { redirect_to @lecture, notice: "Lecture created" }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
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

    respond_to do |format|
      if @lecture.update_attributes(lecture_params)
        format.js
        format.html { redirect_to @lecture, notice: "Lecture updated" }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
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

