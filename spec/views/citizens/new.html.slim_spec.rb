require 'rails_helper'

RSpec.describe "citizens/new", type: :view do
  before(:each) do
    assign(:citizen, Citizen.new(
      :id_no => "MyString",
      :realname => "MyString"
    ))
  end

  it "renders new citizen form" do
    render

    assert_select "form[action=?][method=?]", citizens_path, "post" do

      assert_select "input#citizen_id_no[name=?]", "citizen[id_no]"

      assert_select "input#citizen_realname[name=?]", "citizen[realname]"
    end
  end
end
