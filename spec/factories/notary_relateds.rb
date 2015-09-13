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

FactoryGirl.define do
  factory :notary_related do
    has_crime_record false
has_testament false
  end

end
