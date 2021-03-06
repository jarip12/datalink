# == Schema Information
#
# Table name: deposits
#
#  id                  :integer          not null, primary key
#  deposit_day         :date
#  receive_day         :date
#  amount              :float(24)
#  property_related_id :integer
#  updated_once        :boolean          default(FALSE)
#  scan_file           :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :deposit do
    deposit_day "2015-08-25"
receive_day "2015-08-25"
amount 1.5
  end

end
