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

require 'rails_helper'

RSpec.describe Loan, type: :model do
end
