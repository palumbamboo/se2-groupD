class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]
  before_action :teacher_auth, only: [:create, :destroy, :update, :edit]

  # GET /materials
  # GET /materials.json
  def index
    @materials = Material.all
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /materials/new
  def new
    if params[:school_class_id]
      @school_class = SchoolClass.find(params[:school_class_id].to_i)
    end
    if params[:teacher_id]
      @teacher = Teacher.find(params[:teacher_id].to_i)
    end
    if params[:school_class_id] && params[:teacher_id]
      @material = Material.new(school_class: @school_class, teacher: @teacher)
    end
  end

  # GET /materials/1/edit
  def edit
    @teacher = @material.teacher
  end

  # POST /materials
  # POST /materials.json
  def create
    @material = Material.new(material_params)

    respond_to do |format|
      if @material.save
        format.js
        format.html { redirect_to @material, notice: "Material created" }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    respond_to do |format|
      if @material.update_attributes(mark_params)
        format.js
        format.html { redirect_to @material, notice: "Material updated" }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    respond_to do |format|
      if @material.destroy
        format.js
        format.html { redirect_to @material, notice: "Material deleted" }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_params
      params.require(:material).permit(:title, :description, :file, :subject, :teacher_id, :school_class_id)
    end

  def teacher_auth
    return true if current_user.teacher?
    redirect_to direct_user(current_user), alert: "Permission denied"
  end
end
