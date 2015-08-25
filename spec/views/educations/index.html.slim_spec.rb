require 'rails_helper'

RSpec.describe "educations/index", type: :view do
  before(:each) do
    assign(:educations, [
      Education.create!(
        :education_type => "Education Type",
        :school_name => "School Name",
        :degree => "Degree"
      ),
      Education.create!(
        :education_type => "Education Type",
        :school_name => "School Name",
        :degree => "Degree"
      )
    ])
  end

  it "renders a list of educations" do
    render
    assert_select "tr>td", :text => "Education Type".to_s, :count => 2
    assert_select "tr>td", :text => "School Name".to_s, :count => 2
    assert_select "tr>td", :text => "Degree".to_s, :count => 2
  end
end
