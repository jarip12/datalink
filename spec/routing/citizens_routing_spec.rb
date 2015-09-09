require "rails_helper"

RSpec.describe CitizensController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/citizens").to route_to("citizens#index")
    end

    it "routes to #new" do
      expect(:get => "/citizens/new").to route_to("citizens#new")
    end

    it "routes to #show" do
      expect(:get => "/citizens/1").to route_to("citizens#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/citizens/1/edit").to route_to("citizens#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/citizens").to route_to("citizens#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/citizens/1").to route_to("citizens#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/citizens/1").to route_to("citizens#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/citizens/1").to route_to("citizens#destroy", :id => "1")
    end

  end
end
