class LecturesController < ApplicationController

  layout 'no_sidebar'

  def index
    @lectures = Lecture.all
  end

  def new
    raise "Missing Teacher" unless params[:teacher_id]

    @teacher = Teacher.find(params[:teacher_id])
    @lecture = Lecture.new
    @lecture.school_class = SchoolClass.find(params[:school_class_id]) if params[:school_class_id]
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
        @updated = true
        format.js
        format.html { redirect_to @lecture, notice: "Lecture updated" }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    set_lecture

    respond_to do |format|
      if @lecture.destroy
        format.js
        format.html { redirect_to @lecture, notice: "Lecture deleted" }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  def school_class_attendances
    set_lecture
    school_class = @lecture.school_class
    absents      = params[:students_ids].dig(:absents)&.map{ |s| Attendance.find_or_initialize_by(student: Student.find(s), school_class: school_class, date: Date.today) } || []
    absents.each{ |a| a.absence_type = "absent" }
    presents     = Attendance.where(student: Student.where(id: params[:students_ids][:presents]), school_class: school_class, date: Date.today)
    respond_to do |format|
      if absents.all?(&:save) && presents.delete_all
        @updated = true
        format.js
      else
        @updated = false
        format.js
      end
    end
  end

  private
  def lecture_params
    params.require(:lecture).permit(:name, :topics, :school_class_id, :teacher_id, :subject)
  end

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end

end

