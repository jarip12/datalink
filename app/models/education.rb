# == Schema Information
#
# Table name: educations
#
#  id             :integer          not null, primary key
#  education_type :string(255)
#  school_name    :string(255)
#  degree         :string(255)
#  enroll_day     :date
#  graduation_day :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Education < ActiveRecord::Base
end
