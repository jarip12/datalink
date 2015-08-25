require 'rails_helper'

RSpec.describe "Notaries", type: :request do
  describe "GET /notaries" do
    it "works! (now write some real specs)" do
      get notaries_path
      expect(response).to have_http_status(200)
    end
  end
end
