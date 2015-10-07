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

require 'rails_helper'

RSpec.describe Notary, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
