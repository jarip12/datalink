# == Schema Information
#
# Table name: reservations
#
#  id                 :integer          not null, primary key
#  notary_table_id    :integer
#  notary_table_type  :string(255)
#  archive_id         :integer
#  status             :string(255)
#  user_id            :integer
#  sync_user_verified :string(255)      default("0")
#  reserve_at         :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Reservation < ActiveRecord::Base
  extend Enumerize
  enumerize :notary_table_type, in: [:neijing, :neimin, :waimin, :waijing, :exec, :taimin, :gangmin, :aomin, :gangjing, :taijing, :yibao], default: :neijing
  enumerize :status, in: [:pending, :handled, :refused], default: :pending

  delegate :user_verified, :realname, :id_no, to: :notary_table, :allow_nil => true
  has_one :notary_foreign_table

  before_save :set_reserve_at

  by_star_field :reserve_at

  def set_reserve_at
    self.reserve_at = (self.notary_table.reserve_day + " " + self.notary_table.reserve_hour + ":00").to_datetime
  end

  class << self
    def verified_in_user_system
      user_ids = Reservation.where(status: "handled", sync_user_verified: false).pluck('user_id')
      response = Excon.post(Setting.set_user_verified_url,
                              :body => {user_ids: user_ids, client_token: Setting.client_token}.to_json,
                              :headers => { "Content-Type" => "application/json" })

      body = JSON.parse(response.body)
      if response.status == 200 and body["success"]
        Reservation.where(user_id: user_ids).update_all(sync_user_verified: true)
      else
      end
    end
  end

  def archive
    profile = Profile.find_by(id_no: self.id_no)
    if profile
      profile.archive
    else
      nil
    end
  end

  def notary_table
    if self.notary_table_type == 'waimin'
      NotaryForeignTable.find(self.notary_table_id)
    else
      nil
    end
  end

  def user_realname
    notary_table.realname
  end
end
