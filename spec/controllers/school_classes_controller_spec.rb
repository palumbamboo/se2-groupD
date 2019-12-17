require "rails_helper"
require_relative "../support/devise"


RSpec.describe SchoolClassesController, type: :controller do

  describe "SchoolClassesController:" do

    # Clean tables #
    User.all.delete_all
    SchoolClass.delete_all
    ################

    # Create user and log in with him #
    user = User.create(:email => "prova@email.com", :password => "Prova123")
    user.update(:password_changed => true)
    sc = SchoolClass.create(:number => 0, :section => "0")
    ################

    context "User logged" do
      login_user(user)
      it "should return index" do
        get :index
        assert_response :success
      end

      it "should get edit" do
        get :edit, params: {id: sc.id}
        assert_response :success
      end
    end

    context "User NOT logged" do
      it "should not return index" do
        get :index
        expect(response.status).to eq(200)
      end

      it "should not return show" do
        get :show, params: {id: sc.id}
        expect(response.status).to eq(302)
      end

      it "should not edit" do
        get :edit, params: {id: sc.id}
        expect(response.status).to eq(302)
      end
    end
  end

end