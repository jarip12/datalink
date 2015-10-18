# == Schema Information
#
# Table name: notary_records
#
#  id          :integer          not null, primary key
#  notary_type :string(255)
#  notary_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :notary_record do
    notary_type "MyString"
notary_id 1
  end

end
