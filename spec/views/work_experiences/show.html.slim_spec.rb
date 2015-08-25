require 'rails_helper'

RSpec.describe "work_experiences/show", type: :view do
  before(:each) do
    @work_experience = assign(:work_experience, WorkExperience.create!(
      :company_name => "Company Name",
      :job_title => "Job Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Job Title/)
  end
end
