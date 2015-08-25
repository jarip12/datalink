require 'rails_helper'

RSpec.describe "educations/new", type: :view do
  before(:each) do
    assign(:education, Education.new(
      :education_type => "MyString",
      :school_name => "MyString",
      :degree => "MyString"
    ))
  end

  it "renders new education form" do
    render

    assert_select "form[action=?][method=?]", educations_path, "post" do

      assert_select "input#education_education_type[name=?]", "education[education_type]"

      assert_select "input#education_school_name[name=?]", "education[school_name]"

      assert_select "input#education_degree[name=?]", "education[degree]"
    end
  end
end
