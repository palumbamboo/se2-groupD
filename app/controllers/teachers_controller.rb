class TeachersController < ApplicationController

  def index
    Teacher.delete_all
    @teach = Teacher.new
    @teach.name = 'Mario Rossi'
    @teach.subjects = ['Math', 'Science', 'Physics']
    @teach.save

    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end
end
