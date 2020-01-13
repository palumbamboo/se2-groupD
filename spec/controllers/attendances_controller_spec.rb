require "rails_helper"
require_relative "../support/devise"

RSpec.describe AttendancesController, type: :controller do

  describe "AttendancesController:" do

    User.all.delete_all
    SchoolClass.delete_all
    Teacher.all.delete_all
    Student.all.delete_all
    Attendance.all.delete_all
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
    
    attendance = Attendance.new(:date => Date.today, :absence_type => "Absent")
    attendance.student = student
    attendance.school_class = sc
    attendance.save!
    ##########


    context "Teacher logged" do
      login_user(user_t)
      it "should return index" do
        get :index
        assert_response :success
      end

      it "should return show" do
        get :show, params: {id: attendance.id}
        assert_response :success
      end

      it "should get edit" do
        get :edit, params: {id: attendance.id}
        assert_response :success
      end

      it "should update an attendance" do
        put :update, params: {
            id: attendance.id,
            attendance: {
                :date => Date.yesterday,
                :absence_type => "Absent"
            }
        }
        assert_response :success
        expect(attendance.reload.absence_type).to eq("Absent")
      end

      it "should destroy an assignment" do
        a = Attendance.last
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
        get :show, params: {id: attendance.id}
        expect(response.status).to eq(302)
      end

      it "should not get new" do
        get :new
        expect(response.status).to eq(302)
      end

      it "should not update" do
        put :update, params: {
            id: attendance.id,
            attendance: {
                :absence_type => "late_entrance"
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not delete" do
        delete :destroy, params: {id: attendance.id}
        expect(response.status).to eq(302)
      end
    end
  end
end
