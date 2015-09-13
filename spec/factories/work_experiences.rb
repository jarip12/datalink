# == Schema Information
#
# Table name: work_experiences
#
#  id                :integer          not null, primary key
#  start_day         :date
#  end_day           :date
#  company_name      :string(255)
#  job_title         :string(255)
#  notary_related_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :work_experience do
    start_day "2015-08-25"
end_day "2015-08-25"
company_name "MyString"
job_title "MyString"
  end

end
