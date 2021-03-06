# == Schema Information
#
# Table name: deposits
#
#  id                  :integer          not null, primary key
#  deposit_day         :date
#  receive_day         :date
#  amount              :float(24)
#  property_related_id :integer
#  updated_once        :boolean          default(FALSE)
#  scan_file           :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Deposit < ActiveRecord::Base

  mount_uploader :scan_file, ScanFileUploader

end
