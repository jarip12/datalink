require 'rails_helper'

RSpec.describe "archives/index", type: :view do
  before(:each) do
    assign(:archives, [
      Archive.create!(
        :realname => "Realname",
        :id_no => "Id No",
        :user_id => 1
      ),
      Archive.create!(
        :realname => "Realname",
        :id_no => "Id No",
        :user_id => 1
      )
    ])
  end

  it "renders a list of archives" do
    render
    assert_select "tr>td", :text => "Realname".to_s, :count => 2
    assert_select "tr>td", :text => "Id No".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
