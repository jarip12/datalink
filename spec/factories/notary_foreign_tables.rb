# == Schema Information
#
# Table name: notary_foreign_tables
#
#  id                :integer          not null, primary key
#  realname          :string(255)
#  age               :integer
#  birth_day         :date
#  company_location  :string(255)
#  residence         :string(255)
#  paperwork_name    :string(255)
#  paperwork_no      :string(255)
#  apply_context     :string(255)
#  proxy_people_name :string(255)
#  apply_date        :date
#  reserve_at        :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :notary_foreign_table do
    realname "MyString"
age 1
birth_day "2015-10-21"
company_location "MyString"
residence "MyString"
paperwork_name "MyString"
paperwork_no "MyString"
apply_context "MyString"
proxy_people_name "MyString"
apply_date "2015-10-21"
reserve_at "2015-10-21 08:47:56"
  end

end
