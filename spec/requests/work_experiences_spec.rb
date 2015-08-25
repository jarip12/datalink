require 'rails_helper'

RSpec.describe "WorkExperiences", type: :request do
  describe "GET /work_experiences" do
    it "works! (now write some real specs)" do
      get work_experiences_path
      expect(response).to have_http_status(200)
    end
  end
end
