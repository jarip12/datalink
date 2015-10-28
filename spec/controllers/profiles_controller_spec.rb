require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  login_admin
  describe "POST #new" do
    it "redirect profile edit" do
      post :create, profile: {"realname"=>"雷锋", "id_no"=>"421081198912013474", "email"=>"dilin.life@gmail.com"}
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(edit_profile_path(Profile.last))
    end

    it "profile params error" do
      post :create, profile: {"realname"=>"雷锋xxyy", "id_no"=>"421081198912013474", "email"=>"dilin.life@gmail.com"}
      expect(response).to have_http_status(200)
    end

  end


end
