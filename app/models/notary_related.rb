# == Schema Information
#
# Table name: notary_relateds
#
#  id                   :integer          not null, primary key
#  has_crime_record     :boolean          default(FALSE)
#  has_testament        :boolean          default(FALSE)
#  archive_id           :integer
#  updated_once         :boolean          default(FALSE)
#  crime_record_file    :string(255)
#  testament_file       :string(255)
#  crime_record_comment :text(65535)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class NotaryRelated < ActiveRecord::Base
  belongs_to :archive
  has_many :educations
  has_many :work_experiences
  has_many :notary_records
  has_many :faker_materials

  accepts_nested_attributes_for :educations, :work_experiences, :notary_records, :faker_materials, reject_if: :all_blank, allow_destroy: true

  mount_uploader :crime_record_file, AvatarUploader
  mount_uploader :testament_file, AvatarUploader

  after_create :set_default_related


  def set_default_related
    Education.create!(notary_related_id: self.id)
    WorkExperience.create!(notary_related_id: self.id)
    NotaryRecord.create!(notary_related_id: self.id, notary_id: '')
    FakerMaterial.create!(notary_related_id: self.id)

  end

end
