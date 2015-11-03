# == Schema Information
#
# Table name: family_relations
#
#  id                :integer          not null, primary key
#  id_no             :string(255)
#  realname          :string(255)
#  relation_name     :string(255)
#  family_related_id :integer
#  synced            :boolean          default(FALSE)
#  updated_once      :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe FamilyRelation, type: :model do

  it "after FamilyRelated create, the default family_relation has no profile" do

    archive = create(:archive)
    profile = Profile.new(id_no: nil)
    profile.save(:validate => false)

    family_related = archive.family_related

    expect(family_related.family_relations[0].profile).to eq nil

  end

end
