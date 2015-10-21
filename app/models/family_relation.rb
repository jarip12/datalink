# == Schema Information
#
# Table name: family_relations
#
#  id                :integer          not null, primary key
#  id_no             :string(255)
#  realname          :string(255)
#  relation_name     :string(255)
#  owner_archive_id  :integeMr
#  family_related_id :integer
#  updated_once      :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class FamilyRelation < ActiveRecord::Base

  extend Enumerize
  enumerize :relation_name, in: [:father, :mother, :uncle], default: :father

  class << self
    def sync_to_user_system
      family_relations = FamilyRelation.where(synced: false)
      family_relation_ids = family_relations.pluck('id')

      family_relations.each do |family_relation|
        ap family_relation.to_json
        response = Excon.post(Setting.sync_family_relation_url,
                            :body => family_relation.to_json,
                            :headers => { "Content-Type" => "application/json" })

        body = JSON.parse(response.body)
        if response.status == 200 and body["success"]
          FamilyRelation.where(id: family_relation_ids).update_all(synced: true)
        end
      end
    end
  end

end
