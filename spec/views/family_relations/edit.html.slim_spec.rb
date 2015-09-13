require 'rails_helper'

RSpec.describe "family_relations/edit", type: :view do
  before(:each) do
    @family_relation = assign(:family_relation, FamilyRelation.create!(
      :id_no => "MyString",
      :realname => "MyString",
      :relation => "MyString",
      :owner_archive_id => 1
    ))
  end

  it "renders the edit family_relation form" do
    render

    assert_select "form[action=?][method=?]", family_relation_path(@family_relation), "post" do

      assert_select "input#family_relation_id_no[name=?]", "family_relation[id_no]"

      assert_select "input#family_relation_realname[name=?]", "family_relation[realname]"

      assert_select "input#family_relation_relation[name=?]", "family_relation[relation]"

      assert_select "input#family_relation_owner_archive_id[name=?]", "family_relation[owner_archive_id]"
    end
  end
end
