require "rails_helper"

RSpec.describe HousePurchasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/house_purchases").to route_to("house_purchases#index")
    end

    it "routes to #new" do
      expect(:get => "/house_purchases/new").to route_to("house_purchases#new")
    end

    it "routes to #show" do
      expect(:get => "/house_purchases/1").to route_to("house_purchases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/house_purchases/1/edit").to route_to("house_purchases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/house_purchases").to route_to("house_purchases#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/house_purchases/1").to route_to("house_purchases#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/house_purchases/1").to route_to("house_purchases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/house_purchases/1").to route_to("house_purchases#destroy", :id => "1")
    end

  end
end
