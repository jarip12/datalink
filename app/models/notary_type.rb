# == Schema Information
#
# Table name: notary_types
#
#  id                      :integer          not null, primary key
#  type_name               :string(255)
#  type_info               :string(255)
#  notary_foreign_table_id :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class NotaryType < ActiveRecord::Base
  belongs_to :notary_foreign_table

  extend Enumerize
  enumerize :type_name, in: [:birth, :single, :tortured, :register_residence, :country, :remarry, :family_relation,
                               :live, :residence, :death, :work_experience, :retire, :delegate, :declare, :guarantee,
                               :fingerprint, :heath, :education, :degree, :grade, :marry, :divorce, :driver, :certificate,
                               :owner, :deposit, :qualified, :translate, :other], default: :birth
end
