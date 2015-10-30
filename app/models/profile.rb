# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  realname     :string(255)      default("")
#  id_no        :string(255)      default("")
#  sex          :string(255)
#  mobile       :string(255)
#  birth_day    :date
#  death_day    :date
#  address      :string(255)
#  archive_id   :integer
#  email        :string(255)
#  updated_once :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  avatar       :string(255)
#  id_no_img    :string(255)
#

class Profile < ActiveRecord::Base
  belongs_to :archive

  extend Enumerize
  enumerize :sex, in: [:male, :female], default: :male

  mount_uploader :avatar, AvatarUploader
  mount_uploader :id_no_img, AvatarUploader

  validates_uniqueness_of :id_no

  validates :realname, realname: true
  validates :id_no, id_no: true
  validates :email, email: true, allow_blank: true

  validates :mobile, mobile: true, on: :update
  validates :sex, presence: true, on: :update
  validates :birth_day, presence: true, on: :update
  validates :address, presence: true, on: :update

  self.per_page = 10
  paginates_per 10


end
