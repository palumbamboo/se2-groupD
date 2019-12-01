require "rails_helper"
require_relative "../support/devise"


RSpec.describe WelcomeController, type: :controller do

  describe "WelcomeController:" do

    # Clean tables #
    User.all.delete_all
    ################

    # Create user-teacher and log in with him #
    user = User.create(:email => "prova@email.com", :password => "Prova123")
    ################

    context "User logged" do
      login_user(user)
      it "should return index" do
        get :index
        assert_response :success
      end
    end

    context "User NOT logged" do
      it "should not return index" do
        get :index
        assert_redirected_to :new_user_session
      end
    end
  end

end