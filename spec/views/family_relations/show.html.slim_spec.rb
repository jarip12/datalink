require 'rails_helper'

RSpec.describe "family_relations/show", type: :view do
  before(:each) do
    @family_relation = assign(:family_relation, FamilyRelation.create!(
      :my_id => 1,
      :relation_name => "Relation Name",
      :relation_id_card => "Relation Id Card"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Relation Name/)
    expect(rendered).to match(/Relation Id Card/)
  end
end
