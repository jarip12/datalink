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

class Citizen < ActiveRecord::Base
end
