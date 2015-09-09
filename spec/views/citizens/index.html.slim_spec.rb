require 'rails_helper'

RSpec.describe "citizens/index", type: :view do
  before(:each) do
    assign(:citizens, [
      Citizen.create!(
        :id_no => "Id No",
        :realname => "Realname"
      ),
      Citizen.create!(
        :id_no => "Id No",
        :realname => "Realname"
      )
    ])
  end

  it "renders a list of citizens" do
    render
    assert_select "tr>td", :text => "Id No".to_s, :count => 2
    assert_select "tr>td", :text => "Realname".to_s, :count => 2
  end
end
