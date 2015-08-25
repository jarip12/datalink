require 'rails_helper'

RSpec.describe "notaries/show", type: :view do
  before(:each) do
    @notary = assign(:notary, Notary.create!(
      :no => "No",
      :notary_type => "Notary Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/No/)
    expect(rendered).to match(/Notary Type/)
  end
end
