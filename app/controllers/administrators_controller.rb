class AdministratorsController < ApplicationController
  def index
    @administrators = Administrator.all
  end

  def new
    @administrator = Administrator.new
  end

  def create
    @administrator = Administrator.new(administrator_params)
    if @administrator.save
      redirect_to administrators_url, notice: 'Administrator created'
    end
  end

  def edit
    set_administrator
  end

  def show
    set_administrator
  end

  def update
    set_administrator
    if @administrator.update_attributes(administrator_params)
      redirect_to administrators_url, notice: 'Administrator updated'
    end
  end

  def destroy
    set_administrator
    @administrator.destroy
    redirect_to administrators_url, notice: 'Administrator deleted'
  end

  private

  def administrator_params
    params.require(:administrator).permit(:id, :name, :surname)
  end

  def set_administrator
    @administrator = Administrator.find(params[:id])
  end
end
