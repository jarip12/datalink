# == Schema Information
#
# Table name: deposits
#
#  id          :integer          not null, primary key
#  deposit_day :date
#  receive_day :date
#  amount      :float(24)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Deposit < ActiveRecord::Base
end
