# == Schema Information
#
# Table name: archives
#
#  id         :integer          not null, primary key
#  realname   :string(255)
#  id_no      :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Archive < ActiveRecord::Base

  belongs_to :user

  def user_email
    if user
      user.email
    else
      nil
    end
  end

end
