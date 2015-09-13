# == Schema Information
#
# Table name: loans
#
#  id            :integer          not null, primary key
#  start_day     :date
#  end_day       :date
#  loan_type     :string(255)
#  description   :string(255)
#  amount        :float(24)
#  archive_id    :integer
#  repay_on_time :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :loan do
    start_day "2015-08-25"
end_day "2015-08-25"
notary_type "MyString"
description "MyString"
amount 1.5
repay_on_time false
  end

end
