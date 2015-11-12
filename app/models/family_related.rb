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

  class << self
    def sync_to_user_system
      family_relateds = FamilyRelated.where(synced: false)
      family_related_ids = family_relateds.pluck('id')

      family_related_ids.each do |family_related|
        ap family_related.family_relations.to_json
        data = {"data": family_related.family_relations.as_json, client_token: Setting.client_token}
        ap data
        response = Excon.post(Setting.sync_family_relation_url,
                              :body => data,
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
