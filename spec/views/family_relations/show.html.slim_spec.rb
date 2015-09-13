require 'rails_helper'

RSpec.describe "family_relations/show", type: :view do
  before(:each) do
    @family_relation = assign(:family_relation, FamilyRelation.create!(
      :id_no => "Id No",
      :realname => "Realname",
      :relation => "Relation",
      :owner_archive_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Id No/)
    expect(rendered).to match(/Realname/)
    expect(rendered).to match(/Relation/)
    expect(rendered).to match(/1/)
  end
end
