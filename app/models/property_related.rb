# == Schema Information
#
# Table name: property_relateds
#
#  id           :integer          not null, primary key
#  updated_once :boolean
#  archive_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class PropertyRelated < ActiveRecord::Base
end
