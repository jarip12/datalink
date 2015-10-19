# == Schema Information
#
# Table name: property_relateds
#
#  id           :integer          not null, primary key
#  updated_once :boolean          default(FALSE)
#  archive_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class PropertyRelated < ActiveRecord::Base
  belongs_to :archive
  has_many :loans
  has_many :house_purchases
  has_many :deposits


  accepts_nested_attributes_for :loans, :house_purchases, :deposits, reject_if: :all_blank, allow_destroy: true

  after_create :set_default_related
  before_update :set_updated_once

  def set_updated_once
    self.updated_once = true
  end

  def set_default_related
    loan = Loan.create
    house_purchase = HousePurchase.create
    deposit = Deposit.create

    self.loans << loan
    self.house_purchases << house_purchase
    self.deposits << deposit
  end

end
