# == Schema Information
#
# Table name: house_purchases
#
#  id            :integer          not null, primary key
#  trade_day     :date
#  trade_type    :string(255)
#  house_type    :string(255)
#  house_address :string(255)
#  house_amount  :string(255)
#  archive_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class HousePurchase < ActiveRecord::Base
end
