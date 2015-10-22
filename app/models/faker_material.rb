# == Schema Information
#
# Table name: faker_materials
#
#  id                  :integer          not null, primary key
#  faker_material_no   :string(255)
#  faker_material_type :string(255)
#  notary_related_id   :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class FakerMaterial < ActiveRecord::Base
  extend Enumerize
  enumerize :faker_material_type, in: [:company, :person, :foreign], default: :person

  validates :faker_material_no, presence: true, on: :update
  validates :faker_material_type, presence: true, on: :update
end
