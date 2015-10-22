# == Schema Information
#
# Table name: family_relations
#
#  id                :integer          not null, primary key
#  id_no             :string(255)
#  realname          :string(255)
#  relation_name     :string(255)
#  owner_archive_id  :integer
#  family_related_id :integer
#  synced            :boolean          default(FALSE)
#  updated_once      :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :family_relation do
    id_no "MyString"
realname "MyString"
relation "MyString"
owner_archive_id 1
  end

end
