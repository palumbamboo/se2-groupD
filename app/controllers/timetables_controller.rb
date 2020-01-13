class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:show, :edit, :update, :destroy]

  # GET /timetables
  # GET /timetables.json
  def index
    @timetables = Timetable.all
  end

  # GET /timetables/1
  # GET /timetables/1.json
  def show
    # No implementation needed
  end

  # GET /timetables/new
  def new
    @timetable = Timetable.new
  end

  # GET /timetables/1/edit
  def edit
    # No implementation needed
  end

  # POST /timetables
  # POST /timetables.json
  def create
    @timetable = Timetable.new(timetable_params)

    respond_to do |format|
      if @timetable.save
        format.html { redirect_to timetables_url(@timetable), notice: 'Timetable was successfully created.' }
        format.json { render :show, status: :created, location: @timetable }
      else
        format.html { render :new }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timetables/1
  # PATCH/PUT /timetables/1.json
  def update
    respond_to do |format|
      if @timetable.update(timetable_params)
        format.html { redirect_to timetables(@timetable), notice: 'Timetable was successfully updated.' }
        format.json { render :show, status: :ok, location: @timetable }
      else
        format.html { render :edit }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timetables/1
  # DELETE /timetables/1.json
  def destroy
    @timetable.destroy
    respond_to do |format|
      format.html { redirect_to timetables_url, notice: 'Timetable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def file_import
    @school_class = SchoolClass.find_by(id: params[:class_id]);
    accepted_formats = [".xls", ".xlsx"]
    uploaded_file = params[:timetable_file]
    file_path = Rails.root.join('tmp', uploaded_file.original_filename)
    extension = File.extname(file_path)
    if accepted_formats.include? extension    # if the file has the correct extension
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end
      wb = Roo::Excelx.new(file_path)
      sheet = wb.sheet(0)
      @message = "ok"
      if(sheet.row(1) == ["Hours", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"])    # check first header row
        Timetable.where(school_class: @school_class).delete_all
        (2..sheet.last_row).map do |slot| # for slot from 1 to 5 (temporal slot)
        (2..sheet.last_column).map do |day| # for day from 1 to 5 (day of the week)
            if sheet.cell(slot, day) != ""
              subject = sheet.cell(slot, day)
              puts sheet.cell(slot,day)
              teacher = Teacher.select{|t| t.school_classes.include?(@school_class) && t.subjects.include?(subject)}.first
              timetable = Timetable.create(subject: subject, day_of_week: day-1, slot_time: slot-1, school_class: @school_class, teacher: teacher)
              timetable.save
            end
          end
        end
      else
        @message = "Wrong format of file. The file must have the first header row like this: \"Hours | Monday | Tuesday | Wednesday | Thursday | Friday\", and the following data rows must respect this order."
      end
      File.delete(file_path)
    else
      @message = "We're sorry, the file must have .xls or .xlsx extension."
    end
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable
      @timetable = Timetable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timetable_params
      params.require(:timetable).permit(:subject, :day_of_week, :start_time, :teacher_id, :school_class_id)
    end
end
