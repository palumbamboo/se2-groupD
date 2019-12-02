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
    sc = SchoolClass.create(:number => 0, :section => "0")
    ################

    context "User logged" do
      login_user(user)
      it "should return index" do
        get :index
        assert_response :success
      end

      # show has no correspondent view
      it "should not return show" do
        expect{get :show, params: {id: sc.id}}.to raise_error ActionController::MissingExactTemplate
      end

      it "should get edit" do
        get :edit, params: {id: sc.id}
        assert_response :success
      end
    end

    context "User NOT logged" do
      it "should not return index" do
        get :index
        assert_redirected_to :new_user_session
      end

      it "should not return show" do
        get :show, params: {id: sc.id}
        assert_redirected_to :new_user_session
      end

      it "should not edit" do
        get :edit, params: {id: sc.id}
        assert_redirected_to :new_user_session
      end
    end
  end

end