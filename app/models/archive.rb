# == Schema Information
#
# Table name: archives
#
#  id         :integer          not null, primary key
#  realname   :string(255)
#  id_no      :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Archive < ActiveRecord::Base

  belongs_to :user
  has_one :profile
  has_one :notary_related
  has_many :loans
  has_many :house_purchases
  has_many :deposits


  after_create :set_default_relations

  accepts_nested_attributes_for :profile, :loans, :house_purchases, :deposits

  def set_default_relations
    loan = Loan.create
    house_purchase = HousePurchase.create
    deposit = Deposit.create


    self.loans << loan
    self.house_purchases << house_purchase
    self.deposits << deposit
    self.notary_related = NotaryRelated.create

  end

  def user_email
    if user
      user.email
    else
      nil
    end
  end

end
