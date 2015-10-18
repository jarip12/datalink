# == Schema Information
#
# Table name: notary_relateds
#
#  id               :integer          not null, primary key
#  has_crime_record :boolean          default(FALSE)
#  has_testament    :boolean          default(FALSE)
#  archive_id       :integer
#  updated_once     :boolean          default(FALSE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class NotaryRelated < ActiveRecord::Base
  belongs_to :archive
  has_many :educations
  has_many :work_experiences
  has_many :notaries

  accepts_nested_attributes_for :educations, :work_experiences, :notaries, reject_if: :all_blank, allow_destroy: true

  after_create :set_default_related
  before_update :before_after_update

  def before_after_update
    self.updated_once = true
  end

  def set_default_related
    education = Education.create
    work_experience = WorkExperience.create
    notary = Notary.create

    self.educations << education
    self.work_experiences << work_experience
    self.notaries << notary
  end

end
