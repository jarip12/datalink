# == Schema Information
#
# Table name: family_relateds
#
#  id           :integer          not null, primary key
#  updated_once :boolean          default(FALSE)
#  archive_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FamilyRelated < ActiveRecord::Base
  belongs_to :archive
  has_many :family_relations

  accepts_nested_attributes_for :family_relations, reject_if: :all_blank, allow_destroy: true

  def user_id
    self.archive.user_id
  end

  class << self
    def sync_to_user_system

      ap Setting.sync_family_relation_url

      family_relateds = FamilyRelated.where(synced: false)

      family_relateds.each do |family_related|
        ap family_related
        ap family_related.family_relations.to_json
        data = {user_id: family_related.user_id, family_related_id: family_related.id, data: family_related.family_relations.as_json, client_token: Setting.client_token}
        ap data.to_json
        response = Excon.post(Setting.sync_family_relation_url,
                              :body => data.to_json,
                              :headers => { "Content-Type" => "application/json" })

        body = JSON.parse(response.body)
        if response.status == 200 and body["success"]
          FamilyRelated.where(id: family_related.id).update_all(synced: true)
        else
          ap body
        end
      end
    end
  end

end
