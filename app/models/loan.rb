# == Schema Information
#
# Table name: loans
#
#  id                  :integer          not null, primary key
#  start_day           :date
#  end_day             :date
#  notary_type         :string(255)
#  description         :string(255)
#  amount              :float(24)
#  property_related_id :integer
#  repay_on_time       :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Loan < ActiveRecord::Base
  belongs_to :property_related

  extend Enumerize
  enumerize :notary_type, in: [:bank, :small_loan_company, :private_lending_company, :pawnshop], default: :bank


  validates :start_day, presence: true, on: :update, :if => :should_confirm?
  validates :end_day, presence: true, on: :update, :if => :should_confirm?
  validates :notary_type, presence: true, on: :update, :if => :should_confirm?
  validates :description, presence: true, on: :update, :if => :should_confirm?
  validates :amount, presence: true, on: :update, :if => :should_confirm?

  def should_confirm?
    [self.start_day, self.end_day, self.description, self.amount].any? { |value| not (value.nil? or value.blank?) }
  end

end
