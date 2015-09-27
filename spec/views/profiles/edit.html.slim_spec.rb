require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :realname => "MyString",
      :id_no => "MyString",
      :sex => "MyString",
      :mobile => "MyString",
      :address => "MyString",
      :archive_id => 1
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input#profile_realname[name=?]", "profile[realname]"

      assert_select "input#profile_id_no[name=?]", "profile[id_no]"

      assert_select "input#profile_sex[name=?]", "profile[sex]"

      assert_select "input#profile_mobile[name=?]", "profile[mobile]"

      assert_select "input#profile_address[name=?]", "profile[address]"

      assert_select "input#profile_archive_id[name=?]", "profile[archive_id]"
    end
  end
end