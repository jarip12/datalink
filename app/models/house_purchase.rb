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
#  property_related_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class HousePurchase < ActiveRecord::Base
  extend Enumerize
  enumerize :trade_type, in: [:buy, :sell], default: :buy
  enumerize :house_type, in: [:shop, :apartment, :villa], default: :shop

  validates :trade_day, presence: true, on: :update, :if => :should_confirm?
  validates :trade_type, presence: true, on: :update, :if => :should_confirm?
  validates :house_type, presence: true, on: :update, :if => :should_confirm?
  validates :house_address, presence: true, on: :update, :if => :should_confirm?
  validates :house_amount, presence: true, on: :update, :if => :should_confirm?

  def should_confirm?
    [self.trade_day, self.house_address, self.house_amount].any? { |value| not (value.nil? or value.blank?) }
  end

end
