class AssignmentsController < ApplicationController

  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    set_assignment
    respond_to do |format|
      format.js
    end
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end


  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

    # GET /assignments/1/edit
  def edit
    set_assignment
    @teacher = @assignment.teacher
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    set_assignment

    respond_to do |format|
      if @assignment.update(assignment_params)
        format.js
        format.html { redirect_to @assignment, notice: 'Assignment updated' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    set_assignment

    respond_to do |format|
      if @assignment.destroy
        format.js
        format.html { redirect_to @assignment, notice: "Assignment deleted" }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:name, :expiry_date, :file, :description)
    end
end
