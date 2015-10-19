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

  context "UserStaff can search and show" do
    let(:user_staff) { create(:user_staff) }
    let(:ability){ Ability.new(user_staff) }
    it { is_expected.to be_able_to(:show, Archive) }
    it { is_expected.not_to be_able_to(:edit, Archive) }
    it { is_expected.not_to be_able_to(:new, Archive) }

    it { is_expected.to be_able_to(:search, Profile) }
  end

  context "Typer can search and show" do
    let(:typer) { create(:typer) }
    let(:ability){ Ability.new(typer) }
    it { is_expected.to be_able_to(:show, Archive) }
    it { is_expected.to be_able_to(:search, Profile) }
  end


  context "Audit can search and show" do
    let(:audit) { create(:audit) }
    let(:ability){ Ability.new(audit) }
    it { is_expected.to be_able_to(:show, Archive) }
    it { is_expected.to be_able_to(:edit, Archive) }
    it { is_expected.to be_able_to(:search, Profile) }
  end

end