# == Schema Information
#
# Table name: notary_relateds
#
#  id                   :integer          not null, primary key
#  has_crime_record     :string(255)
#  has_testament        :string(255)
#  archive_id           :integer
#  updated_once         :boolean          default(FALSE)
#  crime_record_file    :string(255)
#  testament_file       :string(255)
#  crime_record_comment :text(65535)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

FactoryGirl.define do
  factory :notary_related do
    has_crime_record "has"
    has_testament "hasnt"
  end

end
