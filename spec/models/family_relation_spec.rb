# == Schema Information
#
# Table name: family_relations
#
#  id               :integer          not null, primary key
#  id_no            :string(255)
#  realname         :string(255)
#  relation_name    :string(255)
#  owner_archive_id :integer
#  archive_id       :integer
#  updated_once     :boolean          default(FALSE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe FamilyRelation, type: :model do
end
