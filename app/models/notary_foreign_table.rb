# == Schema Information
#
# Table name: notary_foreign_tables
#
#  id                :integer          not null, primary key
#  realname          :string(255)
#  age               :integer
#  user_id           :integer
#  id_no             :integer
#  birth_day         :date
#  company_location  :string(255)
#  residence         :string(255)
#  paperwork_name    :string(255)
#  paperwork_no      :string(255)
#  apply_context     :string(255)
#  proxy_people_name :string(255)
#  sex               :string(255)
#  notary_record_id  :integer
#  user_verified     :boolean          default(FALSE)
#  apply_date        :date
#  reserve_at        :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class NotaryForeignTable < ActiveRecord::Base

  extend Enumerize
  enumerize :sex, in: [:male, :female], default: :male
  belongs_to :notary_record
  delegate :archive, to: :notary_record, :allow_nil => true

end
