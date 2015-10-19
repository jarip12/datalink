require 'rails_helper'
require "cancan/matchers"

describe Ability, :type => :model do
  subject { ability }

  context "Admin manage all" do
    let(:admin) { create(:admin) }
    let(:ability){ Ability.new(admin) }
    it { is_expected.to be_able_to(:manage, Archive) }
  end

end