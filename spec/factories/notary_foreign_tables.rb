# == Schema Information
#
# Table name: notary_foreign_tables
#
#  id                    :integer          not null, primary key
#  realname              :string(255)
#  sex                   :integer
#  age                   :integer
#  id_no                 :integer
#  use_country           :string(255)
#  now_address           :text(65535)
#  before_abroad_address :text(65535)
#  abroad_day            :date
#  notary_type           :string(255)
#  notary_type_info      :string(255)
#  translate_lang        :string(255)
#  email                 :string(255)
#  mobile                :string(255)
#  file_num              :integer
#  require_notary        :boolean          default(TRUE)
#  photo_num             :integer
#  work_unit             :text(65535)
#  birth_day             :date
#  comment               :text(65535)
#  agent_name            :string(255)
#  agent_relation        :string(255)
#  agent_mobile          :string(255)
#  agent_address         :text(65535)
#  sync_status           :string(255)
#  purpose               :string(255)
#  user_id               :integer
#  notary_record_id      :integer
#  user_verified         :boolean          default(FALSE)
#  reserve_at            :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
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
