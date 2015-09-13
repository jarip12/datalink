require 'rails_helper'

RSpec.describe "notary_relateds/index", type: :view do
  before(:each) do
    assign(:notary_relateds, [
      NotaryRelated.create!(
        :has_crime_record => false,
        :has_testament => false
      ),
      NotaryRelated.create!(
        :has_crime_record => false,
        :has_testament => false
      )
    ])
  end

  it "renders a list of notary_relateds" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
