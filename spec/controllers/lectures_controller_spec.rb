require "rails_helper"
require_relative "../support/devise"


RSpec.describe LecturesController, type: :controller do

  describe "LecturesController:" do

    # Clean tables #
    User.all.delete_all
    SchoolClass.delete_all
    Teacher.all.delete_all
    ################

    # Create user-teacher and log in with him #
    user = User.create(:email => "prova@email.com", :password => "Prova123")
    sc = SchoolClass.create(:number => 0, :section => "0")
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
                :name => "Intro to integrals",
                :start_time => "12/11/2019",
                :end_time => "12/11/2019",
                :topics => "Integrals",
                :subject => "Math",
                :duration => 3,
                :school_class_id => sc.id,
                :teacher_id => teacher.id
            }
        }
        assert_response :redirect
        expect(Lecture.last.name).to eq("Intro to integrals")
      end

      it "should get edit" do
        get :edit, params: {id: lecture.id}
        assert_response :success
      end

      it "should update a lecture" do
        put :update, params: {
            id: Lecture.last.id,
            lecture: {
                :name => "Intro to areas",
                :start_time => "12/11/2019",
                :end_time => "12/11/2019",
                :topics => "Areas",
                :subject => "Math",
                :duration => 3,
                :school_class_id => sc.id,
                :teacher_id => teacher.id
            }
        }
        assert_response :redirect
        expect(Lecture.last.name).to eq("Intro to areas")
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
        assert_redirected_to :new_user_session
      end

      it "should not return show" do
        get :show, params: {id: lecture.id}
        assert_redirected_to :new_user_session
      end

      it "should not get new" do
        get :new
        assert_redirected_to :new_user_session
      end

      it "should not create lecture" do
        post :create, params: {
            lecture: {
                :name => "Intro to integrals",
                :start_time => "12/11/2019",
                :end_time => "12/11/2019",
                :topics => "Integrals",
                :subject => "Math",
                :duration => 3,
                :school_class_id => sc.id,
                :teacher_id => teacher.id
            }
        }
        assert_redirected_to :new_user_session
      end

      it "should not update" do
        put :update, params: {
            id: Lecture.last.id,
            lecture: {
                :name => "Intro to areas",
                :start_time => "12/11/2019",
                :end_time => "12/11/2019",
                :topics => "Areas",
                :subject => "Math",
                :duration => 3,
                :school_class_id => sc.id,
                :teacher_id => teacher.id
            }
        }
        assert_redirected_to :new_user_session
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