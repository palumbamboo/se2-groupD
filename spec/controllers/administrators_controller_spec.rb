require "rails_helper"
require_relative "../support/devise"


RSpec.describe AdministratorsController, type: :controller do

  describe "AdministratorsController:" do

    # Clean tables #
    User.all.delete_all
    Administrator.all.delete_all
    ################

    # Create user-administrator and log in with him #
    user = User.create(:email => "admin@email.com", :password => "Prova123")
    user.update(:password_changed => true)
    admin = Administrator.new(:name => "Admin", :surname => "Test")
    admin.user = user
    user.save!
    admin.save! 
    
    ################

    context "Administrator logged" do
      login_user(user)
      it "should return index" do
        get :index
        assert_response :redirect
      end

      # update
      it "should update an administrator" do
        put :update, params: {
            id: user.administrator.id,
            administrator: {
                :name => "AdminNew",
                :surname => "Test",
                :user_id => user.id
            }
        }
        assert_response :redirect
        user.administrator.reload
        expect(user.administrator.name).to eq("AdminNew")
      end

      it "should destroy an administrator" do
        a = Administrator.first
        delete :destroy, params: {id: a.id}
        assert_response :redirect
        expect {a.reload}.to raise_error ActiveRecord::RecordNotFound
      end

    end

    context "Administrator NOT logged" do
      it "should not create administrator" do
        post :create, params: {
            administrator: {
                :name => "Admin3",
                :surname => "Test",
                :user_id => user.id
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not update an administrator" do
        put :update, params: {
            id: user.administrator.id,
            administrator: {
                :name => "Admin4",
                :surname => "Test",
                :user_id => user.id
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not destroy an officer" do
        delete :destroy, params: {id: user.administrator.id}
        expect(response.status).to eq(302)
      end
    end
  end
end