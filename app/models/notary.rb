# == Schema Information
#
# Table name: notaries
#
#  id                :integer          not null, primary key
#  no                :string(255)
#  notary_type       :string(255)
#  notary_related_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Notary < ActiveRecord::Base
  extend Enumerize
  enumerize :notary_type, in: [:bank], default: :bank
end
