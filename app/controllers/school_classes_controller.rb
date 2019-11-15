class SchoolClassesController < ApplicationController

  def index
    @school_classes = SchoolClass.all
  end

  def show
    set_school_class
  end

  def edit
    set_school_class
  end

  private
  def set_school_class
    @school_class = SchoolClass.find(params[:id])
  end
end
