require "rails_helper"
require_relative "../support/devise"


RSpec.describe MarksController, type: :controller do

  describe "MarksController:" do

    # Clean tables #
    User.all.delete_all
    SchoolClass.delete_all
    Student.all.delete_all
    Teacher.all.delete_all
    Mark.all.delete_all
    ################

    # Create user-teacher and log in with him #
    user = User.create(:email => "prova@email.com", :password => "Prova123")
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
    mark = Mark.create(:mark => 10, :subject => "Math", :date => "2018-11-12")
    mark.student = student
    mark.teacher = teacher
    mark.save!
    ################

    context "Teacher logged" do
      login_user(user)
      it "should return index" do
        get :index
        assert_response :success
      end

      it "should return show" do
        get :show, params: {id: mark.id}
        assert_response :success
      end

      it "should get new" do
        get :new
        assert_response :success
      end

      it "should create mark" do
        post :create, params: {
            mark: {
                :mark => 7,
                :subject => "Math",
                :date => Date.today,
                :student_id => student.id,
                :teacher_id => teacher.id
            }
        }
        assert_response :redirect
        expect(Mark.last.mark).to eq(7)
      end

      it "should get edit" do
        get :edit, params: {id: mark.id}
        assert_response :success
      end

      it "should update a mark" do
        put :update, params: {
            id: Mark.last.id,
            mark: {
                :mark => 8,
                :subject => "Math",
                :date => Date.today,
                :student_id => student.id,
                :teacher_id => teacher.id
            }
        }
        assert_response :redirect
        expect(Mark.last.mark).to eq(8)
      end

      it "should destroy a mark" do
        m = Mark.last
        delete :destroy, params: {id: m.id}
        assert_response :redirect
        expect {m.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "Teacher NOT logged" do
      it "should not return index" do
        get :index
        assert_redirected_to :new_user_session
      end

      it "should not return show" do
        get :show, params: {id: mark.id}
        assert_redirected_to :new_user_session
      end

      it "should not get new" do
        get :new
        assert_redirected_to :new_user_session
      end

      it "should not create mark" do
        post :create, params: {
            mark: {
                :mark => 7,
                :subject => "Math",
                :date => Date.today,
                :student_id => student.id,
                :teacher_id => teacher.id
            }
        }
        assert_redirected_to :new_user_session
      end

      it "should not update" do
        put :update, params: {
          id: Mark.last.id,
          mark: {
              :mark => 8,
              :subject => "Math",
              :date => Date.today,
              :student_id => student.id,
              :teacher_id => teacher.id
          }
      }
        assert_redirected_to :new_user_session
      end

      it "should not delete" do
        m = Mark.last
        delete :destroy, params: {id: m.id}
        assert_response :redirect
        expect {m.reload}.not_to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

end