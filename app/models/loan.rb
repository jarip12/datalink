# == Schema Information
#
# Table name: loans
#
#  id            :integer          not null, primary key
#  start_day     :date
#  end_day       :date
#  notary_type   :string(255)
#  description   :string(255)
#  amount        :float(24)
#  archive_id    :integer
#  repay_on_time :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Loan < ActiveRecord::Base
  belongs_to :archive
end
