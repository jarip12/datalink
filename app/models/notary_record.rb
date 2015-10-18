# == Schema Information
#
# Table name: notary_records
#
#  id          :integer          not null, primary key
#  notary_type :string(255)
#  notary_id   :string(255)
#  user_id     :integer
#  archive_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class NotaryRecord < ActiveRecord::Base
  extend Enumerize
  enumerize :notary_type, in: [:company, :person, :foreign], default: :person

  before_save :set_notary_id

  def set_notary_id
    self.notary_id = Time.now.to_i.to_s + self.user_id.to_s
  end

end
