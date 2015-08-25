require 'rails_helper'

RSpec.describe "family_relations/new", type: :view do
  before(:each) do
    assign(:family_relation, FamilyRelation.new(
      :my_id => 1,
      :relation_name => "MyString",
      :relation_id_card => "MyString"
    ))
  end

  it "renders new family_relation form" do
    render

    assert_select "form[action=?][method=?]", family_relations_path, "post" do

      assert_select "input#family_relation_my_id[name=?]", "family_relation[my_id]"

      assert_select "input#family_relation_relation_name[name=?]", "family_relation[relation_name]"

      assert_select "input#family_relation_relation_id_card[name=?]", "family_relation[relation_id_card]"
    end
  end
end
