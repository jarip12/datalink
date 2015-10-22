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


  accepts_nested_attributes_for :loans, :house_purchases, :deposits, allow_destroy: true

  after_create :set_default_related

  def set_default_related

    loan = Loan.create(property_related_id: self.id)
    house_purchase = HousePurchase.create(property_related_id: self.id)
    deposit = Deposit.create(property_related_id: self.id)

  end

end
