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

  def set_default_related
    FamilyRelation.create!(family_related_id: self.id)
  end
end
