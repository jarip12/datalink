require 'rails_helper'

RSpec.describe "notary_relateds/edit", type: :view do
  before(:each) do
    @notary_related = assign(:notary_related, NotaryRelated.create!(
      :has_crime_record => false,
      :has_testament => false
    ))
  end

  it "renders the edit notary_related form" do
    render

    assert_select "form[action=?][method=?]", notary_related_path(@notary_related), "post" do

      assert_select "input#notary_related_has_crime_record[name=?]", "notary_related[has_crime_record]"

      assert_select "input#notary_related_has_testament[name=?]", "notary_related[has_testament]"
    end
  end
end
