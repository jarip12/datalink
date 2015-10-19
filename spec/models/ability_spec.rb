require 'rails_helper'
require "cancan/matchers"

describe Ability, :type => :model do
  subject { ability }

  context "Admin manage all" do
    let(:admin) { create(:admin) }
    let(:ability){ Ability.new(admin) }
    it { is_expected.to be_able_to(:manage, Archive) }
    it { is_expected.to be_able_to(:search, Profile) }
  end

  context "User can search and show" do
    let(:user_staff) { create(:user_staff) }
    let(:ability){ Ability.new(user_staff) }
    it { is_expected.to be_able_to(:show, Archive) }
    it { is_expected.to be_able_to(:search, Profile) }
  end


end