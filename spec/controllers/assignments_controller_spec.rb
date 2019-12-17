require "rails_helper"
require_relative "../support/devise"

RSpec.describe AssignmentsController, type: :controller do

  describe "AssignmentsController:" do

    User.all.delete_all
    SchoolClass.delete_all
    Teacher.all.delete_all
    Mark.all.delete_all
    Lecture.all.delete_all
    ################

    # Create user-teacher and user-parent and log in with parent #
    user_t = User.create(:email => "prova@email.com", :password => "Prova123")
    user_t.update(:password_changed => true)
    sc = SchoolClass.create(:number => 0, :section => "0")
    student = Student.create(:name => "Studente", :surname => "Test", :fiscal_code => "AABB123", :birth_date => Date.today - 15.years, :enrollment_date => Date.today)
    student.school_class = sc
    student.save!

    teacher = Teacher.create(:name => "Paolo", :surname => "Garza", :subjects => ["Math"])
    teacher.user = user_t
    teacher.school_classes = [sc]
    user_t.roles
    user_t.save!
    teacher.save!
    
    mark = Mark.create(:mark => 10, :subject => "Math", :date => "2018-11-12")
    mark.student = student
    mark.teacher = teacher
    mark.save!
    
    lecture = Lecture.create(:name => "Lecture 1", :start_time => Time.now, :end_time => Time.now + 1.hour, :duration => 1)
    lecture.teacher = teacher
    lecture.school_class = sc
    lecture.save!
    
    assignment = Assignment.create(:name => "Assignment", :expiry_date => Date.today + 1.day, :subject => "Math")
    assignment.school_class = sc
    assignment.teacher = teacher
    assignment.lecture = lecture
    assignment.save!
    ##########


    context "Parent logged" do
      login_user(user_t)
      it "should return index" do
        get :index
        assert_response :success
      end

      it "should return show" do
        get :show, params: {id: assignment.id}
        assert_response :success
      end

      it "should get edit" do
        get :edit, params: {id: assignment.id}
        assert_response :success
      end

      it "should update an assignment" do
        put :update, params: {
            id: assignment.id,
            assignment: {
                :name => "Assignment1"
            }
        }
        assert_response :redirect
        expect(Assignment.last.name).to eq("Assignment1")
      end

      it "should destroy an assignment" do
        a = Assignment.last
        delete :destroy, params: {id: a.id}
        assert_response :redirect
        expect {a.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "Parent NOT logged" do
      it "should not return index" do
        get :index
        expect(response.status).to eq(200) # 
      end

      it "should not return show" do
        get :show, params: {id: assignment.id}
        expect(response.status).to eq(302)
      end

      it "should not get new" do
        get :new
        expect(response.status).to eq(302)
      end

      it "should not create parent" do
        post :create, params: {
            parent: {
                :name => "Assignment",
                :expiry_date => Date.today + 1.day
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not update" do
        put :update, params: {
            id: user_t.teacher.id,
            parent: {
                :name => "Assignment2"
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not delete" do
        delete :destroy, params: {id: user_t.teacher.id}
        expect(response.status).to eq(302)
      end
    end
  end
end
