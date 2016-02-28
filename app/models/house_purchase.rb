# == Schema Information
#
# Table name: house_purchases
#
#  id                  :integer          not null, primary key
#  trade_day           :date
#  trade_type          :string(255)
#  house_type          :string(255)
#  house_address       :string(255)
#  house_amount        :float(24)
#  scan_file           :string(255)
#  property_related_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class HousePurchase < ActiveRecord::Base
  extend Enumerize
  enumerize :trade_type, in: [:buy, :sell], default: :buy
  enumerize :house_type, in: [:shop, :apartment, :villa], default: :shop

  mount_uploader :scan_file, ScanFileUploader

end
