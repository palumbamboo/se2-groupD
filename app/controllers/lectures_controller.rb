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
    @lecture = Lecture.new(lecture_params.merge(start_time: Time.now, duration: 1))

    respond_to do |format|
      if @lecture.save
        format.js
        format.html { redirect_to teacher_lectures_url(@teacher), notice: "Lecture created" }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.js
        format.html { redirect_to teacher_lectures_url(@teacher), alert: @lecture.print_pretty_errors }
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
        format.html { redirect_to teacher_lectures_url(@lecture.teacher), notice: "Lecture deleted" }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { redirect_to teacher_lectures_url(@lecture.teacher), alert: "Lecture can't be deleted!"}
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  def school_class_attendances
    set_lecture
    school_class = @lecture.school_class
    date         = @lecture.start_time
    absents = Student.where(id: params[:students_ids].dig(:absents) || [])

    late_times = []
    late_ids = []
    if params[:students_ids].dig(:late)
      params[:students_ids].dig(:late).each_value do |entry|
        late_times[entry["id"].to_i] = entry["time"]
        late_ids.push(entry["id"].to_i)
      end
      late = Student.where(id: late_ids)
      late.map do |l|
        att_destroy = Attendance.where('date BETWEEN ? AND ?', date.beginning_of_day, date).find_by(student: l)
        Attendance.destroy(att_destroy.id)

        arr = late_times[l.id].split(':')
        time = date.beginning_of_day + arr[0].to_i.hour + arr[1].to_i.minute

        Attendance.create(date: Time.now+1.hour, absence_type: 'Late', enters_at: time, student: l, school_class: school_class)
      end
    end

    early_times = []
    early_ids = []
    if  params[:students_ids].dig(:early)
      params[:students_ids].dig(:early).each_value do |entry|
        early_times[entry["id"].to_i] = entry["time"]
        early_ids.push(entry["id"].to_i)
      end
      early = Student.where(id: early_ids)
      early.map do |e|
        arr = early_times[e.id].split(':')
        time = date.beginning_of_day + arr[0].to_i.hour + arr[1].to_i.minute
        Attendance.create(date: Time.now+1.hour, absence_type: 'Earl', exits_at: time, student: e, school_class: school_class)
      end
    end

    absents.map{ |a| Attendance.create(date: Time.now+1.hour, absence_type: 'Absent', student: Student.find(a.id), school_class: school_class) }

    respond_to do |format|
      @updated = true
      format.js
      format.html
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

