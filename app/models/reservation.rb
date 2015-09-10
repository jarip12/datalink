# == Schema Information
#
# Table name: reservations
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  notary_type :string(255)
#  reserve_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Reservation < ActiveRecord::Base
  extend Enumerize
  enumerize :notary_type, in: [:foreign], default: :foreign
end
