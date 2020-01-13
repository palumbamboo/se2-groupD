require "rails_helper"
require_relative "../support/devise"

RSpec.describe CommunicationsController, type: :controller do

  describe "CommunicationsController:" do

    User.all.delete_all
    Officer.all.delete_all
    Communication.all.delete_all
    ################

    # Create user-officer and communication and log in with officer #
    user = User.create(:email => "prova@email.com", :password => "Prova123")
    user.update(:password_changed => true)
    officer = Officer.new(:name => "Officer", :surname => "Test")
    officer.user = user
    user.save!
    officer.save!

    comm = Communication.create(:title => "CommTest", :description => "Comm", :start_date => Date.today, :expiry_date => Date.today + 10.days)
    ##########


    context "Officer logged" do
      login_user(user)

      it "should return show" do
        get :show, params: {id: comm.id}
        assert_response :success
      end

      it "should get edit" do
        get :edit, params: {id: comm.id}
        assert_response :success
      end

      it "should create a communication" do
        post :create, params: {
          communication: {
              :title => "Comm1",
              :start_date => Date.today,
              :description => "Comm1",
              :expiry_date => Date.today + 20.days
          }
      }
      assert_response :redirect
      expect(Communication.last.title).to eq("Comm1")
      end

      it "should update a communication" do
        put :update, params: {
            id: comm.id,
            communication: {
                :title => "Comm1",
                :start_date => Date.today,
                :expiry_date => Date.today + 20.days
            }
        }
        assert_response :redirect
        expect(Communication.last.title).to eq("Comm1")
      end

      it "should destroy a communication" do
        c = Communication.last
        delete :destroy, params: {id: c.id}
        assert_response :redirect
        expect {c.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "Communication NOT logged" do

      it "should not return show" do
        get :show, params: {id: comm.id}
        expect(response.status).to eq(302)
      end

      it "should not get new" do
        get :new
        expect(response.status).to eq(302)
      end

      it "should not update" do
        put :update, params: {
            id: comm.id,
            communication: {
                :title => "Comm2",
                :start_date => Date.today,
                :expiry_date => Date.today + 20.days
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not delete" do
        delete :destroy, params: {id: comm.id}
        expect(response.status).to eq(302)
      end
    end
  end
end
