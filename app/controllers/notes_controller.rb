class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :teacher_auth, only: [:create, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    # No implementation needed
  end

  # GET /notes/new
  def new
    if params[:teacher_id]
      @teacher = Teacher.find(params[:teacher_id])
      @students = Student.where(school_class_id: @teacher.school_classes)
    end
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
    set_note
    @teacher = @note.teacher
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.school_class_id = Student.find(note_params[:student_id]).school_class_id
    @teacher = Teacher.find(note_params[:teacher_id])

    respond_to do |format|
      if @note.save
        format.js
        format.html { redirect_to teacher_notes_url(@teacher), notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    set_note
    @teacher = Teacher.find(@note.teacher_id)
    respond_to do |format|
      if @note.update_attributes(note_params)
        format.html { redirect_to teacher_notes_url(@teacher), notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @teacher = Teacher.find(@note.teacher_id)
    @note.destroy
    respond_to do |format|
      format.html { redirect_to teacher_notes_url(@teacher), notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def note_params
    params.require(:note).permit(:subject, :description, :date, :school_class_id, :teacher_id, :student_id)
  end

  def teacher_auth
    current_user.teacher?
  end

end
