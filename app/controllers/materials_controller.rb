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
        format.html { redirect_to teacher_materials_url(@material.teacher), notice: "Material created" }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { redirect_to teacher_materials_url(@material.teacher), alert: @material.print_pretty_errors }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    respond_to do |format|
      if @material.update_attributes(material_params)
        format.html { redirect_to teacher_materials_url(@material.teacher), notice: "Material updated" }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { redirect_to teacher_materials_url(@material.teacher), alert: @material.print_pretty_errors }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    respond_to do |format|
      if @material.destroy
        format.html { redirect_to teacher_materials_url(@material.teacher), notice: "Material deleted" }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { redirect_to teacher_materials_url(@material.teacher), alert: "Material can't be deleted" }
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
