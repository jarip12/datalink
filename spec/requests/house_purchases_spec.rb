require 'rails_helper'

RSpec.describe "HousePurchases", type: :request do
  describe "GET /house_purchases" do
    it "works! (now write some real specs)" do
      get house_purchases_path
      expect(response).to have_http_status(200)
    end
  end
end
