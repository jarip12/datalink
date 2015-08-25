# == Schema Information
#
# Table name: house_purchases
#
#  id            :integer          not null, primary key
#  trade_date    :date
#  trade_type    :string(255)
#  house_type    :string(255)
#  house_address :string(255)
#  house_amount  :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :house_purchase do
    trade_date "2015-08-25"
trade_type "MyString"
house_type "MyString"
house_address "MyString"
house_amount "MyString"
  end

end
