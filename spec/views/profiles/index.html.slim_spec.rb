require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :realname => "Realname",
        :id_no => "Id No",
        :sex => "Sex",
        :mobile => "Mobile",
        :address => "Address",
        :archive_id => 1
      ),
      Profile.create!(
        :realname => "Realname",
        :id_no => "Id No",
        :sex => "Sex",
        :mobile => "Mobile",
        :address => "Address",
        :archive_id => 1
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "Realname".to_s, :count => 2
    assert_select "tr>td", :text => "Id No".to_s, :count => 2
    assert_select "tr>td", :text => "Sex".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
