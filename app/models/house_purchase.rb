# == Schema Information
#
# Table name: house_purchases
#
#  id                  :integer          not null, primary key
#  trade_day           :date
#  trade_type          :string(255)
#  house_type          :string(255)
#  house_address       :string(255)
#  house_amount        :string(255)
#  property_related_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class HousePurchase < ActiveRecord::Base
  extend Enumerize
  enumerize :trade_type, in: [:buy, :sell], default: :buy
  enumerize :house_type, in: [:shop, :apartment, :villa], default: :shop

  validates :trade_day, presence: true, on: :update
  validates :trade_type, presence: true, on: :update
  validates :house_type, presence: true, on: :update
  validates :house_address, presence: true, on: :update
  validates :house_amount, presence: true, on: :update

end
