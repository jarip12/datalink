require "rails_helper"

RSpec.describe NotaryRelatedsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/notary_relateds").to route_to("notary_relateds#index")
    end

    it "routes to #new" do
      expect(:get => "/notary_relateds/new").to route_to("notary_relateds#new")
    end

    it "routes to #show" do
      expect(:get => "/notary_relateds/1").to route_to("notary_relateds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/notary_relateds/1/edit").to route_to("notary_relateds#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/notary_relateds").to route_to("notary_relateds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/notary_relateds/1").to route_to("notary_relateds#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/notary_relateds/1").to route_to("notary_relateds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/notary_relateds/1").to route_to("notary_relateds#destroy", :id => "1")
    end

  end
end
