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
  end

  # GET /timetables/new
  def new
    @timetable = Timetable.new
  end

  # GET /timetables/1/edit
  def edit
  end

  # POST /timetables
  # POST /timetables.json
  def create
    @timetable = Timetable.new(timetable_params)

    respond_to do |format|
      if @timetable.save
        format.html { redirect_to @timetable, notice: 'Timetable was successfully created.' }
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
        format.html { redirect_to @timetable, notice: 'Timetable was successfully updated.' }
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
      all_subjects = [""] # bisogna inizializzarli gli array qua?
      @message = "ok"
      if(sheet.row(1) == ["Hours", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"])    # check first header row
        (2..sheet.last_row).map do |i|
          (2..sheet.last_column).map do |j|
            all_subjects[i][j] << sheet.cell(i, j) # i rappresenta l'ora, j rappresenta il giorno
          end
        end
        if @message == "ok"
          # prima voglio cancellare tutti le timetables per quella classe
          # for j from 1 to 5 (giorni della settimana)
          # for i from 1 to 5 (slot temporali)
          # creo timetable con materia (scritta nel file), slot temporale, giorno, classe data dalla @school_class
          (2..sheet.last_row).map do |i|
            (2..sheet.last_column).map do |j|
              if all_subject[i][j].any?
                if i != 0
                  teacher = Teacher.find_by(subject: all_subject[i][j], school_class_id: @school_class).first
                  timetable = Timetable.create(subject: all_subject[i][j], day_of_week: j, slot_time: i, school_class_id: @school_class, teacher_id: teacher) # teacher id? Anche no
                  timetable.save
                end
              end
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
      params.require(:timetable).permit(:subject, :day_of_week, :start_time, :end_time, :teacher_id, :school_class_id)
    end
end
