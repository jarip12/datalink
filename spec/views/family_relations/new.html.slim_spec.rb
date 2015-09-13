require 'rails_helper'

RSpec.describe "family_relations/new", type: :view do
  before(:each) do
    assign(:family_relation, FamilyRelation.new(
      :id_no => "MyString",
      :realname => "MyString",
      :relation => "MyString",
      :owner_archive_id => 1
    ))
  end

  it "renders new family_relation form" do
    render

    assert_select "form[action=?][method=?]", family_relations_path, "post" do

      assert_select "input#family_relation_id_no[name=?]", "family_relation[id_no]"

      assert_select "input#family_relation_realname[name=?]", "family_relation[realname]"

      assert_select "input#family_relation_relation[name=?]", "family_relation[relation]"

      assert_select "input#family_relation_owner_archive_id[name=?]", "family_relation[owner_archive_id]"
    end
  end
end
