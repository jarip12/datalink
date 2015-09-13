require 'rails_helper'

RSpec.describe "NotaryRelateds", type: :request do
  describe "GET /notary_relateds" do
    it "works! (now write some real specs)" do
      get notary_relateds_path
      expect(response).to have_http_status(200)
    end
  end
end
