# == Schema Information
#
# Table name: work_experiences
#
#  id                :integer          not null, primary key
#  start_day         :date
#  end_day           :date
#  company_name      :string(255)
#  job_title         :string(255)
#  notary_related_id :integer
#  scan_file         :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe WorkExperience, type: :model do
end
