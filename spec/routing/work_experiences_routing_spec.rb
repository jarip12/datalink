require "rails_helper"

RSpec.describe WorkExperiencesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/work_experiences").to route_to("work_experiences#index")
    end

    it "routes to #new" do
      expect(:get => "/work_experiences/new").to route_to("work_experiences#new")
    end

    it "routes to #show" do
      expect(:get => "/work_experiences/1").to route_to("work_experiences#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/work_experiences/1/edit").to route_to("work_experiences#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/work_experiences").to route_to("work_experiences#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/work_experiences/1").to route_to("work_experiences#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/work_experiences/1").to route_to("work_experiences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/work_experiences/1").to route_to("work_experiences#destroy", :id => "1")
    end

  end
end
