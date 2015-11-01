# == Schema Information
#
# Table name: notary_records
#
#  id                :integer          not null, primary key
#  notary_type       :string(255)
#  notary_id         :string(255)
#  user_id           :integer
#  archive_id        :integer
#  notary_related_id :integer
#  reservation_id    :integer
#  scan_file         :string(255)
#  synced            :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe NotaryRecord, type: :model do
end
