require "rails_helper"
require_relative "../support/devise"


RSpec.describe PrincipalsController, type: :controller do

  describe "PrincipalsController:" do

    # Clean tables #
    User.all.delete_all
    Principal.all.delete_all
    ################

    # Create user-principal and log in with him #
    user = User.create(:email => "admin@email.com", :password => "Prova123")
    user.update(:password_changed => true)
    principal = Principal.new(:name => "Admin", :surname => "Test")
    principal.user = user
    user.save!
    principal.save! 
    
    ################

    context "Principal logged" do
      login_user(user)
      it "should return index" do
        get :index
        assert_response :redirect
      end

      # update
      it "should update a principal" do
        put :update, params: {
            id: user.principal.id,
            principal: {
                :name => "Princ1",
                :surname => "Test",
                :user_id => user.id
            }
        }
        assert_response :redirect
        expect(user.principal.reload.name).to eq("Princ1")
      end

      it "should destroy a principal" do
        p = Principal.first
        delete :destroy, params: {id: p.id}
        assert_response :redirect
        expect {p.reload}.to raise_error ActiveRecord::RecordNotFound
      end

    end

    context "Principal NOT logged" do
      it "should not create administrator" do
        post :create, params: {
            principal: {
                :name => "Princ3",
                :surname => "Test",
                :user_id => user.id
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not update a principal" do
        put :update, params: {
            id: user.principal.id,
            principal: {
                :name => "Princ4",
                :surname => "Test",
                :user_id => user.id
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not destroy a principal" do
        delete :destroy, params: {id: user.principal.id}
        expect(response.status).to eq(302)
      end
    end
  end
end
