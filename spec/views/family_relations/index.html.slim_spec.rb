require 'rails_helper'

RSpec.describe "family_relations/index", type: :view do
  before(:each) do
    assign(:family_relations, [
      FamilyRelation.create!(
        :id_no => "Id No",
        :realname => "Realname",
        :relation => "Relation",
        :owner_archive_id => 1
      ),
      FamilyRelation.create!(
        :id_no => "Id No",
        :realname => "Realname",
        :relation => "Relation",
        :owner_archive_id => 1
      )
    ])
  end

  it "renders a list of family_relations" do
    render
    assert_select "tr>td", :text => "Id No".to_s, :count => 2
    assert_select "tr>td", :text => "Realname".to_s, :count => 2
    assert_select "tr>td", :text => "Relation".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
