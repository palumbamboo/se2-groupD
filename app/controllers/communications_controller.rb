class CommunicationsController < ApplicationController

  before_action :officer_auth, only: [:create]
  # GET /communications
  # GET /communications.json
  def index
    @communications = Communication.all
  end

  # GET /communications/1
  # GET /communications/1.json
  def show
    set_communication
  end

  # GET /communications/new
  def new
    @communication = Communication.new
  end

  # GET /communications/1/edit
  def edit
    set_communication
  end

  # POST /communications
  # POST /communications.json
  def create
    @communication = Communication.new(communication_params)

    respond_to do |format|
      if @communication.save
        format.js
        format.html { redirect_to officer_communications_url(current_user.officer.id), notice: 'Communication was successfully created.' }
        format.json { render :show, status: :created, location: @communication }
      else
        format.html { redirect_to officer_communications_url(current_user.officer.id), alert: @communication.print_pretty_errors }
        format.json { render json: @communication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communications/1
  # PATCH/PUT /communications/1.json
  def update
    set_communication

    respond_to do |format|
      if @communication.update(communication_params)
        format.js
        format.html { redirect_to officer_communications_url(current_user.officer.id), notice: 'Communication was successfully updated.' }
        format.json { render :show, status: :ok, location: @communication }
      else
        format.html { redirect_to officer_communications_url(current_user.officer.id), alert: @communication.print_pretty_errors }
        format.json { render json: @communication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communications/1
  # DELETE /communications/1.json
  def destroy
    set_communication

    respond_to do |format|
      if @communication.destroy
        format.js
        format.html { redirect_to officer_communications_url(current_user.officer.id), notice: 'Communication was successfully deleted.' }
        format.json { render :show, status: :ok, location: @communication }
      else
        format.html { redirect_to officer_communications_url(current_user.officer.id), alert: "Communication can't be destroyed" }
        format.json { render json: @communication.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_communication
      @communication = Communication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def communication_params
      p = params.require(:communication).permit(:title, :start_date, :expiry_date, :description, :attachment)
      p[:expiry_date] = Date.parse(p[:expiry_date])
      p[:start_date] = Date.parse(p[:start_date])
      p
    end

  def officer_auth
    return true if current_user.officer?
    redirect_to direct_user(current_user), alert: "Permission denied"
  end
end
