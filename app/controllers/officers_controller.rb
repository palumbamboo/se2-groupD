class OfficersController < ApplicationController

  before_action :set_officer, only: [:show, :edit, :update, :destroy, :parents]
  before_action :officer_permission
  before_action :officer_auth, except: [:index]

  # GET /officers
  # GET /officers.json
  def index
    @officers = Officer.all
  end

  # GET /officers/1
  # GET /officers/1.json
  def show
  end

  # GET /officers/new
  def new
    @officer = Officer.new
  end

  # GET /officers/1/edit
  def edit
  end

  # POST /officers
  # POST /officers.json
  def create
    @officer = Officer.new(officer_params)

    respond_to do |format|
      if @officer.save
        format.html { redirect_to @officer, notice: 'Officer was successfully created.' }
        format.json { render :show, status: :created, location: @officer }
      else
        format.html { render :new }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end

  def enable
    parent = Parent.where("user_id = ?", params[:parent].to_i).first 
    # Mailer implementation
    @user = parent.user
    otp = Devise.friendly_token(20)
    @user.update(password: otp)
    OfficerMailer.with(user: @user, current_pass: otp).credential_mail.deliver_now
    parent.update(:access_enabled => true)

    respond_to do |format|
      format.js
    end

  end

  # PATCH/PUT /officers/1
  # PATCH/PUT /officers/1.json
  def update
    respond_to do |format|
      if @officer.update(officer_params)
        format.html { redirect_to @officer, notice: 'Officer was successfully updated.' }
        format.json { render :show, status: :ok, location: @officer }
      else
        format.html { render :edit }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end

  def class_composition
    set_officer
    @classes = SchoolClass.available_classes
    if params[:class]
      @class = SchoolClass.find(params[:class])
    else
      @class = SchoolClass.first
    end
    @students = @class.students
    respond_to do |format|
      format.js
      format.html
    end
  end

  def parents
    @parents = Parent.all.order(access_enabled: :asc)
  end

  # DELETE /officers/1
  # DELETE /officers/1.json
  def destroy
    @officer.destroy
    respond_to do |format|
      format.html { redirect_to officers_url, notice: 'Officer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_officer
    @officer = Officer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def officer_params
    params.fetch(:officer, {}).permit(:name, :surname)
  end

  def officer_permission
    return true if current_user.officer?
    redirect_to welcome_index_path, alert: 'Missing require permissions'
  end

  def officer_auth
    return true if current_user.officer.id == params[:id].to_i
    redirect_to officer_path(current_user.officer.id), alert: "Permission denied"
  end
end
