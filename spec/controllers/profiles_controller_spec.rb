require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  login_admin
  describe "GET #new" do
    it "returns http success" do
      post :create, profile: {"realname"=>"fe", "id_no"=>"421081198912013474", "email"=>"de"}
      expect(response).to have_http_status(302)
    end
  end

end
