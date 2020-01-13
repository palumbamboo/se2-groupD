require "rails_helper"
require_relative "../support/devise"


RSpec.describe NotesController, type: :controller do

  describe "NotesController:" do

    # Clean tables #
    User.all.delete_all
    SchoolClass.delete_all
    Student.all.delete_all
    Teacher.all.delete_all
    Note.all.delete_all
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
    note = Note.new(:date => Date.today, :description => "Note", :subject => "Math")
    note.teacher = teacher
    note.student = student
    note.school_class = sc
    note.save!
    ################


    context "Teacher logged" do
      login_user(user)
      
      it "should return show" do
        get :show, params: {id: note.id}
        assert_response :success
      end

      it "should get new" do
        get :new
        assert_response :success
      end

      it "should create note" do
        post :create, params: {
            note: {
                :date => Date.today,
                :description => "DescNew",
                :subject => "Math",
                :student_id => student.id,
                :school_class_id => sc.id,
                :teacher_id => user.teacher.id
            }
        }
        assert_response :redirect
        expect(Note.last.description).to eq("DescNew")
      end

      it "should get edit" do
        get :edit, params: {id: note.id}
        assert_response :success
      end

      it "should update note" do
        put :update, params: {
            id: note.id,
            note: {
              :date => Date.yesterday,
              :description => "DescNewV",
              :subject => "Math",
              :student_id => student.id,
              :school_class_id => sc.id,
              :teacher_id => user.teacher.id
            }
        }
        assert_response :redirect
        expect(note.reload.description).to eq("DescNewV")
      end
      
      it "should destroy note" do
        n = Note.last
        delete :destroy, params: {id: n.id}
        assert_response :redirect
        expect {n.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "Teacher NOT logged" do
      it "should not return show" do
        get :show, params: {id: note.id}
        expect(response.status).to eq(302)
      end

      it "should not get new" do
        get :new
        expect(response.status).to eq(302)
      end

      it "should not create note" do
        post :create, params: {
          note: {
            :date => Date.today,
            :description => "DescNew",
            :subject => "Math",
            :student_id => student.id,
            :school_class_id => sc.id,
            :teacher_id => user.teacher.id
        }
        }
        expect(response.status).to eq(302)
      end

      it "should not update" do
        put :update, params: {
            id: note.id,
            note: {
              :date => Date.yesterday,
              :description => "DescNewV",
              :subject => "Math",
              :student_id => student.id,
              :school_class_id => sc.id,
              :teacher_id => user.teacher.id
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not delete" do
        n = Note.last
        delete :destroy, params: {id: n.id}
        assert_response :redirect
        expect {n.reload}.not_to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

end
