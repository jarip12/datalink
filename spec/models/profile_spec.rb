# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  realname   :string(255)
#  id_no      :string(255)
#  sex        :string(255)
#  mobile     :string(255)
#  birth_day  :date
#  death_day  :date
#  address    :string(255)
#  archive_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
