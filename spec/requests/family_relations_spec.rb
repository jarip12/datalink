require 'rails_helper'

RSpec.describe "FamilyRelations", type: :request do
  describe "GET /family_relations" do
    it "works! (now write some real specs)" do
      get family_relations_path
      expect(response).to have_http_status(200)
    end
  end
end
