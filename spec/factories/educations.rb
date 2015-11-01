# == Schema Information
#
# Table name: educations
#
#  id                :integer          not null, primary key
#  education_type    :string(255)
#  school_name       :string(255)
#  degree            :string(255)
#  enroll_day        :date
#  graduation_day    :date
#  notary_related_id :integer
#  scan_file         :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :education do
    education_type "MyString"
school_name "MyString"
degree "MyString"
enroll_day "2015-08-25"
graduation_day "2015-08-25"
  end

end
