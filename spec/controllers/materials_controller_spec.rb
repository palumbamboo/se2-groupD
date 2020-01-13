require "rails_helper"
require_relative "../support/devise"


RSpec.describe MaterialsController, type: :controller do

  describe "MaterialsController:" do

    # Clean tables #
    User.all.delete_all
    SchoolClass.delete_all
    Teacher.all.delete_all
    Material.all.delete_all
    ################

    # Create user-teacher and log in with him #
    user = User.create(:email => "prova@email.com", :password => "Prova123")
    user.update(:password_changed => true)
    sc = SchoolClass.create(:number => 0, :section => "0")
    teacher = Teacher.create(:name => "Paolo", :surname => "Garza", :subjects => ["Math"])
    teacher.user = user
    teacher.school_classes = [sc]
    user.roles
    user.save!
    teacher.save!
    material = Material.new(:title => "Material", :description => "Description", :subject => "Math")
    material.school_class = sc
    material.teacher = teacher
    material.save!
    ################


    context "Teacher logged" do
      login_user(user)
      
      it "should return show" do
        get :show, params: {id: material.id}
        assert_response :success
      end

      it "should get new" do
        get :new
        assert_response :success
      end

      it "should create material" do
        post :create, params: {
            material: {
                :title => "MatNew",
                :description => "DescNew",
                :subject => "Math",
                :school_class_id => sc.id,
                :teacher_id => user.teacher.id
            }
        }
        assert_response :redirect
        expect(Material.last.title).to eq("MatNew")
      end

      it "should get edit" do
        get :edit, params: {id: material.id}
        assert_response :success
      end

      it "should update material" do
        put :update, params: {
            id: material.id,
            material: {
              :title => "MatNewV",
              :description => "DescNewV",
              :subject => "Math",
              :school_class_id => sc.id,
              :teacher_id => user.teacher.id
            }
        }
        assert_response :redirect
        expect(material.reload.title).to eq("MatNewV")
      end
      
      it "should destroy material" do
        m = Material.last
        delete :destroy, params: {id: m.id}
        assert_response :redirect
        expect {m.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "Teacher NOT logged" do
      it "should not return show" do
        get :show, params: {id: material.id}
        expect(response.status).to eq(302)
      end

      it "should not get new" do
        get :new
        expect(response.status).to eq(302)
      end

      it "should not create material" do
        post :create, params: {
          material: {
            :title => "MatNew",
            :description => "DescNew",
            :subject => "Math",
            :school_class_id => sc.id,
            :teacher_id => user.teacher.id
        }
        }
        expect(response.status).to eq(302)
      end

      it "should not update" do
        put :update, params: {
            id: material.id,
            material: {
              :title => "MatNewV",
              :description => "DescNewV",
              :subject => "Math",
              :school_class_id => sc.id,
              :teacher_id => user.teacher.id
            }
        }
        expect(response.status).to eq(302)
      end

      it "should not delete" do
        m = Material.last
        delete :destroy, params: {id: m.id}
        assert_response :redirect
        expect {m.reload}.not_to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

end
