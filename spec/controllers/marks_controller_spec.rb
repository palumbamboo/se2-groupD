require "rails_helper"
require_relative "../support/devise"


RSpec.describe MarksController, type: :controller do

  describe "MarksController:" do

    # Clean tables #
    User.all.delete_all
    SchoolClass.delete_all
    Student.all.delete_all
    Mark.all.delete_all
    ################

    # Sta roba sopra e sotto viene eseguita prima di ogni test?
    # O in ordine?

    # Create user-teacher and log in with him #
    user = User.create(:email => "prova@email.com", :password => "Prova123")
    sc = SchoolClass.create(:number => 0, :section => "0")
    student = Student.new(:name => "Studente", :surname => "Test", :fiscal_code => "AABB123", :birth_date => Date.today - 15.years, :enrollment_date => Date.today)
    student.school_class = sc
    student.save!
    teacher = Teacher.create(:name => "Paolo", :surname => "Garza", :subjects => ["Math"])
    teacher.user = user
    teacher.school_classes = [sc]
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
        # TODO: if da controllare?
        get :new
        assert_response :success
      end

      it "should create mark" do
        post :create, params: {
            mark: {
                :mark => 7,
                :subject => "Math",
                :date => Date.today,
                :student => student,
                :teacher => teacher
            }
        }
        assert_response :success
        # credo che questa cosa non inserisca il record
        # probabilmente da errore e fa il render new
        # infatti viene fuori 10 invece di 7 il mark
        expect(Mark.last.mark).to eq(7)
      end

      it "should get edit" do
        get :edit, params: {id: mark.id}
        assert_response :success
      end

      # non credo si faccia cosi
      it "should update a mark" do
        put :update, params: {
            mark: {
                :mark => 8,
                :subject => "Math",
                :date => Date.today,
                :student => student,
                :teacher => teacher
            }
        }
        assert_response :success
        # come valuto che il record è cambiato?
        expect(Mark.last.mark).to eq(8)
      end

      it "should destroy a mark" do
        m = Mark.first
        m.destroy
        # perche success e non redirect?
        assert_redirected_to :marks
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
                :student => student,
                :teacher => teacher
            }
        }
        assert_redirected_to :new_user_session
      end
    end
  end

end