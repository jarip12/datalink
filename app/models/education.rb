# == Schema Information
#
# Table name: educations
#
#  id                :integer          not null, primary key
#  education_type    :string(255)
#  school_name       :string(255)
#  degree            :string(255)
#  enroll_day        :date
#  graduation_day    :date
#  notary_related_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Education < ActiveRecord::Base
  belongs_to :notary_related

  extend Enumerize
  enumerize :education_type, in: [:bachelor, :master, :doctor, :college, :highschool, :junior_highschool, :primary_school, :unknown], default: :bachelor

  validates :education_type, presence: true, on: :update, :if => :should_confirm?
  validates :school_name, presence: true, on: :update, :if => :should_confirm?
  validates :degree, presence: true, on: :update, :if => :should_confirm?
  validates :enroll_day, presence: true, on: :update, :if => :should_confirm?
  validates :graduation_day, presence: true, on: :update, :if => :should_confirm?

  def should_confirm?
    [self.school_name, self.degree, self.enroll_day, self.graduation_day].any? { |value| not (value.nil? or value.blank?) }
  end

end
