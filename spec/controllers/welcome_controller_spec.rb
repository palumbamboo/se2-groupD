require "rails_helper"
require_relative "../support/devise"


RSpec.describe WelcomeController, type: :controller do

  describe "WelcomeController:" do

    # Clean tables #
    User.all.delete_all
    ################

    # Create user and log in with him #
    user = User.create(:email => "prova@email.com", :password => "Prova123")
    ################

    context "User logged" do
      login_user(user)
    end

    context "User NOT logged" do
      it "should not return index" do
        get :index
        assert_response :success
      end
    end
  end

end