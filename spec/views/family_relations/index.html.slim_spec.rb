require 'rails_helper'

RSpec.describe "family_relations/index", type: :view do
  before(:each) do
    assign(:family_relations, [
      FamilyRelation.create!(
        :my_id => 1,
        :relation_name => "Relation Name",
        :relation_id_card => "Relation Id Card"
      ),
      FamilyRelation.create!(
        :my_id => 1,
        :relation_name => "Relation Name",
        :relation_id_card => "Relation Id Card"
      )
    ])
  end

  it "renders a list of family_relations" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Relation Name".to_s, :count => 2
    assert_select "tr>td", :text => "Relation Id Card".to_s, :count => 2
  end
end
