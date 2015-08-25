# == Schema Information
#
# Table name: family_relations
#
#  id               :integer          not null, primary key
#  my_id            :integer
#  relation_name    :string(255)
#  relation_id_card :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class FamilyRelation < ActiveRecord::Base
end
