require "rails_helper"

RSpec.describe MaterialsController, type: :routing do

  FIRST_MAT = "/materials/1"

  describe "routing" do
    it "routes to #index" do
      expect(:get => "/materials").to route_to("materials#index")
    end

    it "routes to #new" do
      expect(:get => "/materials/new").to route_to("materials#new")
    end

    it "routes to #show" do
      expect(:get => FIRST_MAT).to route_to("materials#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/materials/1/edit").to route_to("materials#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/materials").to route_to("materials#create")
    end

    it "routes to #update via PUT" do
      expect(:put => FIRST_MAT).to route_to("materials#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => FIRST_MAT).to route_to("materials#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => FIRST_MAT).to route_to("materials#destroy", :id => "1")
    end
  end
end
