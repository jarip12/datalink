require 'rails_helper'

RSpec.describe "work_experiences/index", type: :view do
  before(:each) do
    assign(:work_experiences, [
      WorkExperience.create!(
        :company_name => "Company Name",
        :job_title => "Job Title"
      ),
      WorkExperience.create!(
        :company_name => "Company Name",
        :job_title => "Job Title"
      )
    ])
  end

  it "renders a list of work_experiences" do
    render
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Job Title".to_s, :count => 2
  end
end
