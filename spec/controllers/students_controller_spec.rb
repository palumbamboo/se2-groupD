require "rails_helper"
require_relative "../support/devise"


RSpec.describe StudentsController, type: :controller do

    describe "StudentsController:" do

        # Clean tables #
        User.all.delete_all
        SchoolClass.delete_all
        Student.all.delete_all
        ################

        # Create user and log in with him #
        user = User.create(:email => "prova@email.com", :password => "Prova123")
        sc = SchoolClass.create(:number => 0, :section => "0")
        student = Student.new(:name => "Studente", :surname => "Test", :fiscal_code => "AABB123", :birth_date => Date.today - 15.years, :enrollment_date => Date.today)
        student.school_class = sc
        student.save!
        ################
        
        context "User logged" do
            login_user(user)
            it "should return index" do
                get :index
                assert_response :success
            end

            it "should return show" do
                get :show, params: {id: student.id}
                assert_response :success
            end
            
            it "should get new" do
                get :new
                assert_response :success
            end

            it "should create student" do
                post :create, params: { 
                    student: {
                                    :name => "S1", 
                                    :surname => "Test", 
                                    :fiscal_code => "ABABAB123", 
                                    :birth_date => Date.today - 15.years, 
                                    :enrollment_date => Date.today,
                                    :school_class_id => sc.id
                    }       
                }
                assert_redirected_to :students

                expect(Student.last.name).to eq("S1")
            end

            it "should destroy a student" do
                student = Student.first
                student.destroy
                expect {student.reload}.to raise_error ActiveRecord::RecordNotFound
            end
        end

        context "User NOT logged" do
            it "should not return index" do
                get :index
                assert_redirected_to :new_user_session
            end

            it "should not return show" do
                get :show, params: {id: student.id}
                assert_redirected_to :new_user_session
            end
            
            it "should not get new" do
                get :new
                assert_redirected_to :new_user_session
            end

            it "should not create student" do
                post :create, params: { 
                    student: {
                                    :name => "S2", 
                                    :surname => "Test", 
                                    :fiscal_code => "ABABAB123", 
                                    :birth_date => Date.today - 15.years, 
                                    :enrollment_date => Date.today,
                                    :school_class_id => sc.id
                    }       
                }
                assert_redirected_to :new_user_session
            end
        end
    end
    
end 