# == Schema Information
#
# Table name: notary_relateds
#
#  id               :integer          not null, primary key
#  has_crime_record :boolean          default(FALSE)
#  has_testament    :boolean          default(FALSE)
#  archive_id       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class NotaryRelated < ActiveRecord::Base
  belongs_to :archive
  has_many :educations
  has_many :work_experiences

  after_create :set_default_related

  def set_default_related
    education = Education.create
    work_experience = WorkExperience.create

    self.educations << education
    self.work_experiences << work_experience
  end
end
