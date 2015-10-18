# == Schema Information
#
# Table name: archives
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  avatar     :string(255)
#

FactoryGirl.define do
  factory :archive do
    realname "MyString"
id_no "MyString"
user_id 1
  end

end
