require 'rails_helper'

RSpec.describe "educations/edit", type: :view do
  before(:each) do
    @education = assign(:education, Education.create!(
      :education_type => "MyString",
      :school_name => "MyString",
      :degree => "MyString"
    ))
  end

  it "renders the edit education form" do
    render

    assert_select "form[action=?][method=?]", education_path(@education), "post" do

      assert_select "input#education_education_type[name=?]", "education[education_type]"

      assert_select "input#education_school_name[name=?]", "education[school_name]"

      assert_select "input#education_degree[name=?]", "education[degree]"
    end
  end
end
