# == Schema Information
#
# Table name: notary_relations
#
#  id                      :integer          not null, primary key
#  relation                :string(255)
#  realname                :string(255)
#  english_name            :string(255)
#  sex                     :string(255)
#  birth_day               :date
#  now_address             :text(65535)
#  before_abroad_address   :text(65535)
#  notary_foreign_table_id :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class NotaryRelation < ActiveRecord::Base
  belongs_to :notary_foreign_table
  extend Enumerize
  enumerize :sex, in: [:male, :female], default: :male
end
