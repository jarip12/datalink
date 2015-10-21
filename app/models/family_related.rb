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

  after_create :set_default_related

  after_update :set_sync

  def set_sync
    self.synced = false
    self.saved
  end

  def set_default_related
    family_relation = FamilyRelation.create
    self.family_relations << family_relation
  end
end
