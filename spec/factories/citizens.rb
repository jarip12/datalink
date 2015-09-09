# == Schema Information
#
# Table name: citizens
#
#  id         :integer          not null, primary key
#  id_no      :string(255)
#  realname   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :citizen do
    id_no "MyString"
realname "MyString"
  end

end
