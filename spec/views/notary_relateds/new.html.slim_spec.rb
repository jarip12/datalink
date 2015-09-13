require 'rails_helper'

RSpec.describe "notary_relateds/new", type: :view do
  before(:each) do
    assign(:notary_related, NotaryRelated.new(
      :has_crime_record => false,
      :has_testament => false
    ))
  end

  it "renders new notary_related form" do
    render

    assert_select "form[action=?][method=?]", notary_relateds_path, "post" do

      assert_select "input#notary_related_has_crime_record[name=?]", "notary_related[has_crime_record]"

      assert_select "input#notary_related_has_testament[name=?]", "notary_related[has_testament]"
    end
  end
end
