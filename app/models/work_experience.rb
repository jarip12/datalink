# == Schema Information
#
# Table name: work_experiences
#
#  id           :integer          not null, primary key
#  start_day    :date
#  end_day      :date
#  company_name :string(255)
#  job_title    :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class WorkExperience < ActiveRecord::Base
end
