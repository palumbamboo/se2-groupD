require "rails_helper"

RSpec.describe NotesController, type: :routing do

  FIRST_NOTE = "/notes/1"

  describe "routing" do
    it "routes to #index" do
      expect(:get => "/notes").to route_to("notes#index")
    end

    it "routes to #new" do
      expect(:get => "/notes/new").to route_to("notes#new")
    end

    it "routes to #show" do
      expect(:get => FIRST_NOTE).to route_to("notes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/notes/1/edit").to route_to("notes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/notes").to route_to("notes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => FIRST_NOTE).to route_to("notes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => FIRST_NOTE).to route_to("notes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => FIRST_NOTE).to route_to("notes#destroy", :id => "1")
    end
  end
end
