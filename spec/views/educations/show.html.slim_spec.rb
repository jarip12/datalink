require 'rails_helper'

RSpec.describe "educations/show", type: :view do
  before(:each) do
    @education = assign(:education, Education.create!(
      :education_type => "Education Type",
      :school_name => "School Name",
      :degree => "Degree"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Education Type/)
    expect(rendered).to match(/School Name/)
    expect(rendered).to match(/Degree/)
  end
end
