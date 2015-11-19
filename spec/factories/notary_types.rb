# == Schema Information
#
# Table name: notary_types
#
#  id                      :integer          not null, primary key
#  type_name               :string(255)
#  notary_foreign_table_id :integer
#  type_info               :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

FactoryGirl.define do
  factory :notary_type do
    type_name "MyString"
notary_foreign_table_id 1
type_info "MyString"
  end

end
