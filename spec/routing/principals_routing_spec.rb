require "rails_helper"

RSpec.describe PrincipalsController, type: :routing do

  FIRST_PRIN = "/principals/1"

  describe "routing" do
    it "routes to #index" do
      expect(:get => "/principals").to route_to("principals#index")
    end

    it "routes to #new" do
      expect(:get => "/principals/new").to route_to("principals#new")
    end

    it "routes to #show" do
      expect(:get => FIRST_PRIN).to route_to("principals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/principals/1/edit").to route_to("principals#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/principals").to route_to("principals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => FIRST_PRIN).to route_to("principals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => FIRST_PRIN).to route_to("principals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => FIRST_PRIN).to route_to("principals#destroy", :id => "1")
    end
  end
end
