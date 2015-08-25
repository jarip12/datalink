require 'rails_helper'

RSpec.describe "work_experiences/new", type: :view do
  before(:each) do
    assign(:work_experience, WorkExperience.new(
      :company_name => "MyString",
      :job_title => "MyString"
    ))
  end

  it "renders new work_experience form" do
    render

    assert_select "form[action=?][method=?]", work_experiences_path, "post" do

      assert_select "input#work_experience_company_name[name=?]", "work_experience[company_name]"

      assert_select "input#work_experience_job_title[name=?]", "work_experience[job_title]"
    end
  end
end
