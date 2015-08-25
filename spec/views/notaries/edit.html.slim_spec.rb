require 'rails_helper'

RSpec.describe "notaries/edit", type: :view do
  before(:each) do
    @notary = assign(:notary, Notary.create!(
      :no => "MyString",
      :notary_type => "MyString"
    ))
  end

  it "renders the edit notary form" do
    render

    assert_select "form[action=?][method=?]", notary_path(@notary), "post" do

      assert_select "input#notary_no[name=?]", "notary[no]"

      assert_select "input#notary_notary_type[name=?]", "notary[notary_type]"
    end
  end
end
