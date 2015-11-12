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
#  reservation_id    :integer
#  scan_file         :string(255)
#  synced            :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class NotaryRecord < ActiveRecord::Base
  belongs_to :archive
  extend Enumerize
  enumerize :notary_type, in: [:company, :person, :foreign], default: :person

  mount_uploader :scan_file, AvatarUploader

  delegate :notary_table_id, to: :reservation
  delegate :client_token, to: Setting


  before_save :set_notary_id

  def reservation
    Reservation.find(self.reservation_id)
  end


  class << self
    def push_to_user_system
      ap "push new notary_record to user system"
      ap Setting.sync_notary_record_url

      records = NotaryRecord.where(synced: false).where.not(user_id: nil)

      ap records.count
      records.each do |record|
        ap record.to_json
        response = Excon.post(Setting.sync_notary_record_url,
                              :body => record.to_json(:methods => :client_token),
                              :headers => { "Content-Type" => "application/json" })
        body = JSON.parse(response.body)
        if response.status == 200 and body["success"]
          record.update_attribute("synced", true)
        else
          ap body
        end


      end

    end
  end

  def set_notary_id
    self.notary_id = Time.now.to_i.to_s + self.user_id.to_s unless self.notary_id
  end

end
