# == Schema Information
#
# Table name: reservations
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  notary_type :string(255)
#  reserve_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :reservation do
    user_id 1
notary_type "MyString"
reserve_at "2015-09-10 10:14:45"
  end

end
