# == Schema Information
#
# Table name: citizens
#
#  id         :integer          not null, primary key
#  id_no      :string(255)
#  realname   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Citizen, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
