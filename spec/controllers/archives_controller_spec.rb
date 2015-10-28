require 'rails_helper'

RSpec.describe ArchivesController, type: :controller do

  login_admin
  describe "GET #new" do
    it "returns http success" do
      post :create, email: "dilin.life@gmail.com", realname: "雷思猛", id_no: "421081198912011234"
      expect(response).to have_http_status(:success)
    end
  end

end
