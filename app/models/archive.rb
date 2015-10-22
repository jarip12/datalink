# == Schema Information
#
# Table name: archives
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  avatar     :string(255)
#

class Archive < ActiveRecord::Base

  belongs_to :user
  has_one :profile
  has_one :notary_related
  has_one :property_related
  has_one :family_related
  has_many :notary_records


  after_create :set_default_relations

  accepts_nested_attributes_for :profile

  delegate :notaries, to: :notary_related
  delegate :family_relations, to: :family_related

  delegate :realname, to: :profile, :allow_nil => true
  delegate :id_no, to: :profile, :allow_nil => true



  def set_default_relations
    self.save!

    notary_related = NotaryRelated.create(archive_id: self.id)
    property_related = PropertyRelated.create(archive_id: self.id)
    family_related = FamilyRelated.create(archive_id: self.id)

  end

  def user_email
    if user
      user.email
    else
      nil
    end
  end

end
