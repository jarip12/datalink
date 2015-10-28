require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  login_admin
  describe "GET #new" do
    it "redirect profile edit" do
      post :create, profile: {"realname"=>"fe", "id_no"=>"421081198912013474", "email"=>"de"}
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(edit_profile_path(Profile.last))
    end
  end

end
