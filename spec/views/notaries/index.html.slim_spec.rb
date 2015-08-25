require 'rails_helper'

RSpec.describe "notaries/index", type: :view do
  before(:each) do
    assign(:notaries, [
      Notary.create!(
        :no => "No",
        :notary_type => "Notary Type"
      ),
      Notary.create!(
        :no => "No",
        :notary_type => "Notary Type"
      )
    ])
  end

  it "renders a list of notaries" do
    render
    assert_select "tr>td", :text => "No".to_s, :count => 2
    assert_select "tr>td", :text => "Notary Type".to_s, :count => 2
  end
end
