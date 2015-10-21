# == Schema Information
#
# Table name: notary_records
#
#  id                :integer          not null, primary key
#  notary_type       :string(255)
#  notary_id         :string(255)
#  user_id           :integer
#  archive_id        :integer
#  notary_related_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class NotaryRecord < ActiveRecord::Base
  extend Enumerize
  enumerize :notary_type, in: [:company, :person, :foreign], default: :person

  before_save :set_notary_id

  class << self
    def push_to_user_system
      ap "push new notary_record to user system"
      ap Setting.sync_notary_record_url

      records = NotaryRecord.where(synced: false)
      ap records.count
      records.each do |record|
        ap record.to_json
        response = Excon.post(Setting.sync_notary_record_url,
                              :body => record.to_json,
                              :headers => { "Content-Type" => "application/json" })

        ap response.body[0..20]

      end

    end
  end

  def set_notary_id
    self.notary_id = Time.now.to_i.to_s + self.user_id.to_s
  end

end
