require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do


  describe "for admin" do

    login_admin

    context "POST profiles#create" do
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

    context "POST profiles#update" do

      it "redirect profile show" do
        @profile = Profile.new
        @profile.save(validate: false)
        patch :update, profile: {realname: "雷锋", mobile: "18026931797", id_no: "421081198912013474", email: "dilin.life@gmail.com", address: "xx路", birth_day: "1986-09-03"}, id: Profile.last.id
        expect(response).to redirect_to(edit_profile_path(Profile.last))
      end

    end

  end

  describe "for typer" do

    login_typer
    it "GET #new success" do
      get :new_archive
      expect(response).to have_http_status(200)
    end

    context "POST profiles#create" do
      it "redirect profile edit" do
        post :create, profile: {"realname"=>"雷锋", "id_no"=>"421081198912013474", "email"=>"dilin.life@gmail.com"}
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(edit_profile_path(Profile.last))
      end

      it "redirect profile edit" do
        post :create, profile: {"realname"=>"雷锋", "id_no"=>"421081198912013474", "email"=>""}
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(edit_profile_path(Profile.last))
      end

      it "profile params error" do
        @profile = Profile.new(id_no: "421081198912013474")
        @profile.save(validate: false)
        post :create, profile: {"realname"=>"雷锋", "id_no"=> @profile.id_no, "email"=>""}
        expect(response).to have_http_status(200)
      end

      it "profile params error" do
        post :create, profile: {"realname"=>"雷锋xxyy", "id_no"=>"421081198912013474", "email"=>"dilin.life.com"}
        expect(response).to have_http_status(200)
      end

      it "profile params error" do
        post :create, profile: {"realname"=>"雷锋xxyy", "id_no"=>"421081198912013474", "email"=>"dilin.life@gmail.com"}
        expect(response).to have_http_status(200)
      end
    end

    context "POST profiles#update" do

      it "redirect profile show" do
        @profile = Profile.new
        @profile.save(validate: false)
        patch :update, profile: {realname: "雷锋", mobile: "18026931797", id_no: "421081198912013474", email: "dilin.life@gmail.com", address: "xx路", birth_day: "1986-09-03"}, id: Profile.last.id
        expect(response).to redirect_to(profile_path(Profile.last))
      end

    end

  end


end
