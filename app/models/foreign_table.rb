# == Schema Information
#
# Table name: foreign_tables
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

class ForeignTable < ActiveRecord::Base
end
