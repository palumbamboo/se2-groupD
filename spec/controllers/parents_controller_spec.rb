require "rails_helper"
require_relative "../support/devise"


RSpec.describe ParentsController, type: :controller do

  describe "ParentsController:" do

    User.all.delete_all
    SchoolClass.delete_all
    Student.all.delete_all
    Parent.all.delete_all
    Teacher.all.delete_all
    Mark.all.delete_all
    ################

    # Create user-teacher and user-parent and log in with parent #
    user_t = User.create(:email => "prova@email.com", :password => "Prova123")
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

    user_p = User.create(:email => "mario.rossi@gmail.com", :password => "Prova456")
    user_p.update(:password_changed => true)
    parent = Parent.new(:name => "Mario", :surname => "Test", :email => "mario.rossi@gmail.com")
    parent.user = user_p
    parent.students << student
    user_p.roles
    user_p.save!
    parent.save!

    user_p2 = User.create(:email => "marianna.bianchi@gmail.com", :password => "Prova789")
    ##########


    context "Parent logged" do
      login_user(user_p)
      it "should return index" do
        get :index
        assert_response :success
      end

      it "should return show" do
        get :show, params: {id: parent.id}
        assert_response :success
      end

      # students
      it "should do students function" do
        get :students, params: {id: parent.id}
        assert_response :success
      end

      it "should get edit" do
        get :edit, params: {id: parent.id}
        assert_response :success
      end

      it "should update a parent" do
        put :update, params: {
            id: Parent.last.id,
            parent: {
                :name => "Marione",
                :email => "marione.rossi@gmail.com",
            }
        }
        assert_response :redirect
        expect(Parent.last.name).to eq("Marione")
      end

      it "should destroy a parent" do
        p = Parent.last
        delete :destroy, params: {id: p.id}
        assert_response :redirect
        expect {p.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "Parent NOT logged" do
      it "should not return index" do
        get :index
        expect(response.status).to eq(302)
      end

      it "should not return show" do
        get :show, params: {id: parent.id}
        expect(response.status).to eq(302)
      end

      it "should not get new" do
        get :new
        expect(response.status).to eq(302)
      end

      it "should not create parent" do
        post :create, params: {
            parent: {
                :name => "Marianna",
                :surname => "Bianchi",
                :email => "marianna.bianchi@gmail.com",
                :user_id => user_p.id, # ???
                :students_id => [student.id]
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not update" do
        put :update, params: {
            id: user_p.parent.id,
            parent: {
                :name => "Marione",
                :email => "marione.rossi@gmail.com",
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not delete" do
        delete :destroy, params: {id: user_p.parent.id}
        expect(response.status).to eq(302)
      end
    end
  end
# occhio che i parent ovunque secondo me son sbagliati
end