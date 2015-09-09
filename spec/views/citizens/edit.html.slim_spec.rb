require 'rails_helper'

RSpec.describe "citizens/edit", type: :view do
  before(:each) do
    @citizen = assign(:citizen, Citizen.create!(
      :id_no => "MyString",
      :realname => "MyString"
    ))
  end

  it "renders the edit citizen form" do
    render

    assert_select "form[action=?][method=?]", citizen_path(@citizen), "post" do

      assert_select "input#citizen_id_no[name=?]", "citizen[id_no]"

      assert_select "input#citizen_realname[name=?]", "citizen[realname]"
    end
  end
end
