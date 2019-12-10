require "rails_helper"

RSpec.describe CommunicationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/communications").to route_to("communications#index")
    end

    it "routes to #new" do
      expect(:get => "/communications/new").to route_to("communications#new")
    end

    it "routes to #show" do
      expect(:get => "/communications/1").to route_to("communications#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/communications/1/edit").to route_to("communications#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/communications").to route_to("communications#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/communications/1").to route_to("communications#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/communications/1").to route_to("communications#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/communications/1").to route_to("communications#destroy", :id => "1")
    end
  end
end
