require "rails_helper"
require_relative "../support/devise"


RSpec.describe LecturesController, type: :controller do

  describe "LecturesController:" do

    INTRO_TO_INTEGRALS = "Intro to integrals"
    12_11_2019 = "12/11/2019"
    INTRO_TO_AREAS = "Intro to areas"

    # Clean tables #
    User.all.delete_all
    SchoolClass.delete_all
    Teacher.all.delete_all
    Lecture.all.delete_all
    Student.all.delete_all
    Attendance.all.delete_all
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
    lecture = Lecture.create(:name => "Intro to derivatives", :start_time => "11/11/2019", :end_time => "11/11/2019", :topics => "Derivatives", :subject => "Math", :duration => 2)
    lecture.teacher = teacher
    lecture.school_class = sc
    lecture.save!
    ################


    context "Teacher logged" do
      login_user(user)
      it "should return index" do
        get :index
        assert_response :success
      end

      it "should return show" do
        get :show, params: {id: lecture.id}
        assert_response :success
      end

      it "should get new" do
        get :new, params: {teacher_id: teacher.id}
        assert_response :success
      end

      it "should create lecture" do
        post :create, params: {
            lecture: {
                :name => INTRO_TO_INTEGRALS,
                :start_time => 12_11_2019,
                :end_time => 12_11_2019,
                :topics => "Integrals",
                :subject => "Math",
                :duration => 3,
                :school_class_id => sc.id,
                :teacher_id => teacher.id
            }
        }
        assert_response :redirect
        expect(Lecture.last.name).to eq(INTRO_TO_INTEGRALS)
      end

      it "should get edit" do
        get :edit, params: {id: lecture.id}
        assert_response :success
      end

      it "should update a lecture" do
        put :update, params: {
            id: lecture.id,
            lecture: {
                :name => INTRO_TO_AREAS,
                :start_time => 12_11_2019,
                :end_time => 12_11_2019,
                :topics => "Areas",
                :subject => "Math",
                :duration => 3,
                :school_class_id => sc.id,
                :teacher_id => teacher.id
            }
        }
        assert_response :redirect
        expect(lecture.reload.name).to eq(INTRO_TO_AREAS)
      end
      
      it "should destroy a lecture" do
        l = Lecture.last
        delete :destroy, params: {id: l.id}
        assert_response :redirect
        expect {l.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "Teacher NOT logged" do
      it "should not return index" do
        get :index
        expect(response.status).to eq(200)
      end

      it "should not return show" do
        get :show, params: {id: lecture.id}
        expect(response.status).to eq(302)
      end

      it "should not get new" do
        get :new
        expect(response.status).to eq(302)
      end

      it "should not create lecture" do
        post :create, params: {
            lecture: {
                :name => INTRO_TO_INTEGRALS,
                :start_time => 12_11_2019,
                :end_time => 12_11_2019,
                :topics => "Integrals",
                :subject => "Math",
                :duration => 3,
                :school_class_id => sc.id,
                :teacher_id => teacher.id
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not update" do
        put :update, params: {
            id: lecture.id,
            lecture: {
                :name => INTRO_TO_AREAS,
                :start_time => 12_11_2019,
                :end_time => 12_11_2019,
                :topics => "Areas",
                :subject => "Math",
                :duration => 3,
                :school_class_id => sc.id,
                :teacher_id => teacher.id
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not delete" do
        l = Lecture.last
        delete :destroy, params: {id: l.id}
        assert_response :redirect
        expect {l.reload}.not_to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

end