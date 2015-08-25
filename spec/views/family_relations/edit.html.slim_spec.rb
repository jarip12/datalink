require 'rails_helper'

RSpec.describe "family_relations/edit", type: :view do
  before(:each) do
    @family_relation = assign(:family_relation, FamilyRelation.create!(
      :my_id => 1,
      :relation_name => "MyString",
      :relation_id_card => "MyString"
    ))
  end

  it "renders the edit family_relation form" do
    render

    assert_select "form[action=?][method=?]", family_relation_path(@family_relation), "post" do

      assert_select "input#family_relation_my_id[name=?]", "family_relation[my_id]"

      assert_select "input#family_relation_relation_name[name=?]", "family_relation[relation_name]"

      assert_select "input#family_relation_relation_id_card[name=?]", "family_relation[relation_id_card]"
    end
  end
end
