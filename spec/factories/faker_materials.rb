# == Schema Information
#
# Table name: faker_materials
#
#  id                  :integer          not null, primary key
#  faker_material_no   :string(255)
#  faker_material_type :string(255)
#  scan_file           :string(255)
#  notary_related_id   :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :faker_material do
    faker_material_id "MyString"
faker_material_type "MyString"
notary_related_id 1
  end

end
