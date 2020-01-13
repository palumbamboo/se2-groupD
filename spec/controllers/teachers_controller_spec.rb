require "rails_helper"
require_relative "../support/devise"


RSpec.describe TeachersController, type: :controller do

  describe "TeachersController:" do

    # Clean tables #
    User.all.delete_all
    SchoolClass.delete_all
    Student.all.delete_all
    Teacher.all.delete_all
    Mark.all.delete_all
    Assignment.all.delete_all
    ################

    # Create user-teacher and log in with him #
    user = User.create(:email => "prova@email.com", :password => "Prova123")
    user.update(:password_changed => true)
    sc = SchoolClass.create(:number => 0, :section => "0")
    student = Student.create(:name => "Studente", :surname => "Test", :fiscal_code => "AABB123", :birth_date => Date.today - 15.years, :enrollment_date => Date.today)
    student.school_class = sc
    student.save!
    teacher = Teacher.create(:name => "Paolo", :surname => "Garza", :subjects => ["Math"])
    teacher.user = user
    teacher.school_classes = [sc]
    user.roles
    user.save!
    teacher.save!
    mark = Mark.create(:mark => 10, :subject => "Math", :date => Date.new(2019, 11, 12))
    mark.student = student
    mark.teacher = teacher
    mark.save!
    lecture = Lecture.create(:name => "Lecture 1", :start_time => Time.now, :duration => 1, :topics => "Prova", :subject => "Math")
    lecture.teacher = teacher
    lecture.school_class = sc
    lecture.save!
    assignment = Assignment.create(:name => "Assignment", :expiry_date => Date.today + 1.day, :subject => "Math", :description => "Homework")
    assignment.school_class = sc
    assignment.teacher = teacher
    assignment.lecture = lecture
    assignment.save!

    ################

    context "Teacher logged" do
      login_user(user)
      it "should return index" do
        get :index
        assert_response :redirect
      end

      it "should return show" do
        get :show, params: {id: teacher.id}
        assert_response :success
      end

      it "should return lectures" do
        get :lectures, params: {id: teacher.id, school_class_id: sc.id}
        assert_response :success
      end

      it "should return marks" do
        get :marks, params: {id: teacher.id}
        assert_response :success
      end

      it "should return assignments" do
        get :assignments, params: {id: teacher.id, school_class_id: sc.id}
        assert_response :success
      end

      it "should return notes" do
        get :notes, params: {id: teacher.id}
        assert_response :success
      end

      it "should return materials" do
        get :materials, params: {id: teacher.id}
        assert_response :success
      end

      it "should return timetables" do
        get :timetables, params: {id: teacher.id, school_class_id: sc.id}
        assert_response :success
      end

    end

    context "Teacher NOT logged" do
      it "should not return index" do
        get :index
        expect(response.status).to eq(302)
      end

      it "should not return show" do
        get :show, params: {id: teacher.id}
        expect(response.status).to eq(302)
      end

      it "should not return lectures" do
        get :lectures, params: {id: teacher.id}
        expect(response.status).to eq(302)
      end

      it "should not return marks" do
        get :marks, params: {id: teacher.id}
        expect(response.status).to eq(302)
      end

      it "should not return assignments" do
        get :marks, params: {id: teacher.id, school_class_id: sc.id}
        expect(response.status).to eq(302)
      end
    end
  end
end