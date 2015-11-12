# == Schema Information
#
# Table name: reservations
#
#  id                 :integer          not null, primary key
#  notary_table_id    :integer
#  notary_table_type  :string(255)
#  archive_id         :integer
#  status             :string(255)
#  user_id            :integer
#  sync_user_verified :string(255)      default("0")
#  reserve_at         :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe Reservation, type: :model do
end
