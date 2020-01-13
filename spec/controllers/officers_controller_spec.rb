require "rails_helper"
require_relative "../support/devise"


RSpec.describe OfficersController, type: :controller do

  describe "OfficersController:" do

    # Clean tables #
    User.all.delete_all
    Parent.all.delete_all
    Student.all.delete_all
    Officer.all.delete_all
    SchoolClass.delete_all
    ################

    # Create user-officer and log in with him #
    user = User.create(:email => "officer@email.com", :password => "Prova123")
    user.update(:password_changed => true)
    officer = Officer.new(:name => "Officer", :surname => "Test")
    officer.user = user
    user.save!
    officer.save! 
    sc = SchoolClass.create(:number => 1, :section => "A")
    user_p = User.create(:email => "parent.test@email.com", :password => "Prova456")
    student = Student.create(:name => "Studente", :surname => "Test", :fiscal_code => "AABB123", :birth_date => Date.today - 15.years, :enrollment_date => Date.today)
    student.school_class = sc
    student.save
    user.roles
    user.save!
    parent = Parent.new(:name => "Parent", :surname => "Test")
    parent.user = user_p
    parent.students << student
    user_p.roles
    user_p.save!
    parent.save!

    user_o2 = User.create(:email => "officer2@email.com", :password => "Provetta")
    user_prova = User.create(:email => "officerprova@email.com", :password => "Provetta2")

    ################

    context "Officer logged" do
      login_user(user)
      it "should enable" do
        old_password = user_p.encrypted_password
        post :enable, params: { id: Officer.first.id, parent: user_p.parent.id}
        expect(user_p.reload.encrypted_password).not_to eq(old_password)
      end

      # update
      it "should update an officer" do
        put :update, params: {
            id: user.officer.id,
            officer: {
                :name => "Prova",
                :surname => "Test",
                :user_id => user.id
            }
        }
        assert_response :redirect
        expect(Officer.last.name).to eq("Prova")
      end

      it "should get class composition" do
        get :class_composition, params: {
            id: user.officer.id,
            class: sc.id
        }
        assert_response :success
      end

      it "should return parents" do
        get :parents, params: {id: user.officer.id}
        assert_response :success
      end

      it "should destroy an officer" do
        o = Officer.first
        delete :destroy, params: {id: o.id}
        assert_response :redirect
        expect {o.reload}.to raise_error ActiveRecord::RecordNotFound
      end

    end

    context "Officer NOT logged" do
      it "should not create officer" do
        post :create, params: {
            officer: {
                :name => "Officer2",
                :surname => "Test",
                :user_id => user_o2.id
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not enable" do
        post :enable, params: { id: user.officer.id, parent: user_p.id}
        expect(response.status).to eq(302)
      end

      it "should not update an officer" do
        put :update, params: {
            id: user.officer.id,
            officer: {
                :name => "Prova",
                :surname => "Test",
                :user_id => user.id
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not return parents" do
        get :parents, params: {id: user.officer.id}
        expect(response.status).to eq(302)
      end

      it "should not destroy an officer" do
        delete :destroy, params: {id: user.officer.id}
        expect(response.status).to eq(302)
      end
    end
  end
end