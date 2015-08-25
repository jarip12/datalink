require 'rails_helper'

RSpec.describe "notaries/new", type: :view do
  before(:each) do
    assign(:notary, Notary.new(
      :no => "MyString",
      :notary_type => "MyString"
    ))
  end

  it "renders new notary form" do
    render

    assert_select "form[action=?][method=?]", notaries_path, "post" do

      assert_select "input#notary_no[name=?]", "notary[no]"

      assert_select "input#notary_notary_type[name=?]", "notary[notary_type]"
    end
  end
end
