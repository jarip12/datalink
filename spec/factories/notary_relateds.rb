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

FactoryGirl.define do
  factory :notary_related do
    has_crime_record false
has_testament false
  end

end
