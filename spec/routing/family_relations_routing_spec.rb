require "rails_helper"

RSpec.describe FamilyRelationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/family_relations").to route_to("family_relations#index")
    end

    it "routes to #new" do
      expect(:get => "/family_relations/new").to route_to("family_relations#new")
    end

    it "routes to #show" do
      expect(:get => "/family_relations/1").to route_to("family_relations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/family_relations/1/edit").to route_to("family_relations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/family_relations").to route_to("family_relations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/family_relations/1").to route_to("family_relations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/family_relations/1").to route_to("family_relations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/family_relations/1").to route_to("family_relations#destroy", :id => "1")
    end

  end
end
