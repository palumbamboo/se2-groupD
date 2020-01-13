require "rails_helper"
require_relative "../support/devise"


RSpec.describe TimetablesController, type: :controller do

  describe "TimetablesController:" do

    # Clean tables #
    User.all.delete_all
    SchoolClass.delete_all
    Teacher.all.delete_all
    Timetable.all.delete_all
    ################

    # Create user-teacher and log in with him #
    user = User.create(:email => "prova@email.com", :password => "Prova123")
    user.update(:password_changed => true)
    sc = SchoolClass.create(:number => 0, :section => "0")
    teacher = Teacher.create(:name => "Paolo", :surname => "Garza", :subjects => ["Math"])
    teacher.user = user
    teacher.school_classes = [sc]
    user.roles
    user.save!
    teacher.save!
    tt = Timetable.new(:subject => "Math", :day_of_week => 1, :slot_time => 1)
    tt.school_class = sc
    tt.teacher = teacher
    tt.save!
    tt_2 = Timetable.new(:subject => "Math", :day_of_week => 4, :slot_time => 1)
    tt_2.school_class = sc
    tt_2.teacher = teacher
    tt_2.save!
    ################


    context "Teacher logged" do
      login_user(user)
      
      it "should return show" do
        get :show, params: {id: tt.id}
        assert_response :success
      end

      it "should get new" do
        get :new
        assert_response :success
      end

      it "should create timetable" do
        post :create, params: {
            timetable: {
                :subject => "Math",
                :day_of_week => 2,
                :slot_time => 1,
                :school_class_id => sc.id,
                :teacher_id => user.teacher.id
            }
        }
        assert_response :success
        expect(Timetable.last.subject).to eq("Math")
      end

      it "should get edit" do
        get :edit, params: {id: tt.id}
        assert_response :success
      end

      it "should update timetable" do
        put :update, params: {
            id: tt.id,
            timetable: {
              :subject => "Math",
              :day_of_week => 3,
              :slot_time => 1,
              :school_class_id => tt.school_class.id,
              :teacher_id => tt.teacher.id
            }
        }
        assert_response :success
        expect(tt.reload.slot_time).to eq(1)
      end
      
      it "should destroy timetable" do
        t = Timetable.last
        delete :destroy, params: {id: t.id}
        assert_response :redirect
        expect {t.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "Teacher NOT logged" do
      it "should not return show" do
        get :show, params: {id: tt.id}
        expect(response.status).to eq(302)
      end

      it "should not get new" do
        get :new
        expect(response.status).to eq(302)
      end

      it "should not create timetable" do
        post :create, params: {
          timetable: {
            :subject => "Math",
            :day_of_week => 2,
            :slot_time => 1,
            :school_class_id => sc.id,
            :teacher_id => user.teacher.id
          }
        }
        expect(response.status).to eq(302)
      end

      it "should not update" do
        put :update, params: {
            id: tt.id,
            timetable: {
              :subject => "Math",
              :day_of_week => 3,
              :slot_time => 1,
              :school_class_id => sc.id,
              :teacher_id => user.teacher.id
            }
        }
        expect(response.status).to eq(302)
      end
    end
  end

end
