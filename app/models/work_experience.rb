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
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class WorkExperience < ActiveRecord::Base
  belongs_to :notary_related

  validates :start_day, presence: true, on: :update, :if => :should_confirm?
  validates :end_day, presence: true, on: :update, :if => :should_confirm?
  validates :company_name, presence: true, on: :update, :if => :should_confirm?
  validates :job_title, presence: true, on: :update, :if => :should_confirm?

  def should_confirm?
    [self.start_day, self.end_day, self.company_name, self.job_title].any? { |value| not (value.nil? or value.blank?) }
  end

end
