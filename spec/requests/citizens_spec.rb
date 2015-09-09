require 'rails_helper'

RSpec.describe "Citizens", type: :request do
  describe "GET /citizens" do
    it "works! (now write some real specs)" do
      get citizens_path
      expect(response).to have_http_status(200)
    end
  end
end
