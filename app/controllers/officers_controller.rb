class OfficersController < ApplicationController

  before_action :set_officer, only: [:show, :edit, :update, :destroy, :parents, :students, :communications, :timetables]
  before_action :officer_auth

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
    user = User.initialize_user(params[:email])

    @officer = Officer.new(name: params[:name], surname: params[:surname], user: user)

    if @officer.save
      otp = Devise.friendly_token(20)
      user.update(password: otp)
      OfficerMailer.with(user: user, current_pass: otp).credential_mail.deliver_now
      respond_to do |format|
        format.js
        format.html { redirect_to administrator_add_user_url(current_user.administrator.id), notice: 'Officer successfully created'}
      end
    else
      format.html { redirect_to administrator_add_user_url(current_user.administrator.id), alert: @officer.print_pretty_errors}
    end
  end

  def enable
    parent = Parent.find(params[:parent].to_i)
    # Mailer implementation
    @user = parent.user
    otp = Devise.friendly_token(20)
    @user.update(password: otp)
    OfficerMailer.with(user: @user, current_pass: otp).credential_mail.deliver_now
    parent.update(:access_enabled => true)

    respond_to do |format|
      format.js
      format.html
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
      @class = SchoolClass.available_classes.first
    end
    @students = @class.students
    respond_to do |format|
      format.js
      format.html
    end
  end

  def timetables
    set_officer
    @classes = SchoolClass.available_classes
    if params[:class]
      @class = SchoolClass.find(params[:class])
    else
      @class = SchoolClass.available_classes.first
    end
    @subjects = Timetable.where(school_class_id: @class.id).select(:subject).distinct
    @monday = Timetable.where(school_class_id: @class.id, day_of_week: "1").select(:subject)
    @tuesday = Timetable.where(school_class_id: @class.id, day_of_week: "2").select(:subject)
    @wednesday = Timetable.where(school_class_id: @class.id, day_of_week: "3").select(:subject)
    @thursday = Timetable.where(school_class_id: @class.id, day_of_week: "4").select(:subject)
    @friday = Timetable.where(school_class_id: @class.id, day_of_week: "5").select(:subject)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def parents
    @parents = Parent.all.order(access_enabled: :asc)
  end

  def students
    set_officer
  end


  def communications
    set_officer
    if params[:expiry_date_select] && params[:expiry_date_select] == "Valid"
      @communications = Communication.where("expiry_date >= ?", Date.today)
    elsif params[:expiry_date_select] && params[:expiry_date_select] == "Expired"
      @communications = Communication.where("expiry_date < ?", Date.today)
    else
      @communications = Communication.all
    end
    respond_to do |format|
      format.js
      format.html
    end
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

  def officer_auth
    return true if (current_user.officer? && current_user.officer.id == params[:id].to_i) || current_user.administrator?
    redirect_to officer_path(current_user.officer.id), alert: "Permission denied"
  end
end
