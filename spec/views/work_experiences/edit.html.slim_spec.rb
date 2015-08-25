require 'rails_helper'

RSpec.describe "work_experiences/edit", type: :view do
  before(:each) do
    @work_experience = assign(:work_experience, WorkExperience.create!(
      :company_name => "MyString",
      :job_title => "MyString"
    ))
  end

  it "renders the edit work_experience form" do
    render

    assert_select "form[action=?][method=?]", work_experience_path(@work_experience), "post" do

      assert_select "input#work_experience_company_name[name=?]", "work_experience[company_name]"

      assert_select "input#work_experience_job_title[name=?]", "work_experience[job_title]"
    end
  end
end
