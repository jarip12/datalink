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

class Profile < ActiveRecord::Base
  belongs_to :archive

  extend Enumerize
  enumerize :sex, in: [:male, :female], default: :male

  validates :realname, presence: true
  validates :id_no, presence: true

  validates :mobile, presence: true, mobile: true, on: :update
  validates :sex, presence: true, on: :update
  validates :birth_day, presence: true, on: :update
  validates :address, presence: true, on: :update

end
