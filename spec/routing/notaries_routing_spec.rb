require "rails_helper"

RSpec.describe NotariesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/notaries").to route_to("notaries#index")
    end

    it "routes to #new" do
      expect(:get => "/notaries/new").to route_to("notaries#new")
    end

    it "routes to #show" do
      expect(:get => "/notaries/1").to route_to("notaries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/notaries/1/edit").to route_to("notaries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/notaries").to route_to("notaries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/notaries/1").to route_to("notaries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/notaries/1").to route_to("notaries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/notaries/1").to route_to("notaries#destroy", :id => "1")
    end

  end
end
