require "rails_helper"

RSpec.describe AdministratorsController, type: :routing do

  FIRST_ADMIN = "/administrators/1"
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/administrators").to route_to("administrators#index")
    end

    it "routes to #new" do
      expect(:get => "/administrators/new").to route_to("administrators#new")
    end

    it "routes to #show" do
      expect(:get => FIRST_ADMIN).to route_to("administrators#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/administrators/1/edit").to route_to("administrators#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/administrators").to route_to("administrators#create")
    end

    it "routes to #update via PUT" do
      expect(:put => FIRST_ADMIN).to route_to("administrators#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => FIRST_ADMIN).to route_to("administrators#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => FIRST_ADMIN).to route_to("administrators#destroy", :id => "1")
    end
  end
end
