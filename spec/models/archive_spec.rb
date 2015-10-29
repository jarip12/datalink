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
#  avatar     :string(255)
#

require 'rails_helper'

RSpec.describe Archive, type: :model do
  it "after archive create, latest notary_record's notary_id should be empty" do

      expect(NotaryRecord.count).to eq 0
      Archive.create
      @notary_record = NotaryRecord.last
      expect(@notary_record.notary_id).to eq ''

  end
end
