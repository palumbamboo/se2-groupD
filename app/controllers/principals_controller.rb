class PrincipalsController < ApplicationController
  before_action :set_principal, only: [:show, :edit, :update, :destroy]
  before_action :principal_auth

  # GET /principals
  # GET /principals.json
  def index
    @principals = Principal.all
  end

  # GET /principals/1
  # GET /principals/1.json
  def show
  end

  # GET /principals/new
  def new
    @principal = Principal.new
  end

  # GET /principals/1/edit
  def edit
  end

  # POST /principals
  # POST /principals.json
  def create
    user = User.initialize_user(params[:email])

    @principal = Principal.new(name: params[:name], surname: params[:surname], user: user)

    respond_to do |format|
      if @principal.save
        format.html { redirect_to @principal, notice: 'Principal was successfully created.' }
        format.json { render :show, status: :created, location: @principal }
      else
        format.html { render :new }
        format.json { render json: @principal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /principals/1
  # PATCH/PUT /principals/1.json
  def update
    respond_to do |format|
      if @principal.update(principal_params)
        format.html { redirect_to @principal, notice: 'Principal was successfully updated.' }
        format.json { render :show, status: :ok, location: @principal }
      else
        format.html { render :edit }
        format.json { render json: @principal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /principals/1
  # DELETE /principals/1.json
  def destroy
    @principal.destroy
    respond_to do |format|
      format.html { redirect_to principals_url, notice: 'Principal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_principal
      @principal = Principal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def principal_params
      params.require(:principal).permit(:name, :surname)
    end

  def principal_auth
    return true if (current_user.principal? && current_user.principal.id == params[:id].to_i) || current_user.administrator?
    redirect_to principal_path(current_user.principal.id), alert: "Permission denied"
  end
end
