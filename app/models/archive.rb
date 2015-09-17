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
#  avatar     :string(255)
#

class Archive < ActiveRecord::Base

  belongs_to :user
  has_one :profile
  has_one :notary_related
  has_many :loans
  has_many :house_purchases
  has_many :deposits
  has_many :family_relations


  after_create :set_default_relations

  accepts_nested_attributes_for :profile, :loans, :house_purchases, :deposits, :family_relations

  mount_uploader :avatar, AvatarUploader

  def set_default_relations

    self.loans << Loan.create
    self.house_purchases << HousePurchase.create
    self.deposits << Deposit.create
    self.notary_related = NotaryRelated.create
    self.family_relations << FamilyRelation.create

  end

  def user_email
    if user
      user.email
    else
      nil
    end
  end

end
