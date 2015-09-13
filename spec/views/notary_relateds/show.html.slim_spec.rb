require 'rails_helper'

RSpec.describe "notary_relateds/show", type: :view do
  before(:each) do
    @notary_related = assign(:notary_related, NotaryRelated.create!(
      :has_crime_record => false,
      :has_testament => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
