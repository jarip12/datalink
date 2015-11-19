require 'rails_helper'
require "cancan/matchers"

describe Ability, :type => :model do
  subject { ability }

  context "Admin manage all" do
    let(:admin) { create(:admin) }
    let(:ability){ Ability.new(admin) }
    it { is_expected.to be_able_to(:manage, :all) }
  end

  context "UserStaff can search and show" do
    let(:user_staff) { create(:user_staff) }
    let(:ability){ Ability.new(user_staff) }

    it { is_expected.to be_able_to(:show, Archive) }
    it { is_expected.not_to be_able_to([:edit, :new], Archive) }

    it { is_expected.to be_able_to([:all], Reservation) }

    it { is_expected.to be_able_to(:search, Profile) }
    it { is_expected.to be_able_to(:show, Profile) }
    it { is_expected.not_to be_able_to(:edit, Profile) }

    it { is_expected.to be_able_to(:show, PropertyRelated) }
    it { is_expected.not_to be_able_to(:edit, PropertyRelated) }

    it { is_expected.to be_able_to(:show, NotaryRelated) }
    it { is_expected.not_to be_able_to(:edit, NotaryRelated) }

    it { is_expected.to be_able_to(:show, FamilyRelated) }
    it { is_expected.not_to be_able_to(:edit, FamilyRelated) }

  end

  context "Typer can search and show" do
    let(:typer) { create(:typer) }
    let(:ability){ Ability.new(typer) }
    let(:not_updated_profile) { create(:profile, :updated_once => false) }
    let(:updated_profile) { create(:profile, :updated_once => true) }

    let(:not_updated_property_related) { create(:property_related, :updated_once => false) }
    let(:updated_property_related) { create(:property_related, :updated_once => true) }

    let(:not_updated_notary_related) { create(:notary_related, :updated_once => false) }
    let(:updated_notary_related) { create(:notary_related, :updated_once => true) }

    let(:not_updated_family_related) { create(:family_related, :updated_once => false) }
    let(:updated_family_related) { create(:family_related, :updated_once => true) }

    it { is_expected.to be_able_to(:create, Archive) }
    it { is_expected.to be_able_to(:new, Archive) }
    it { is_expected.not_to be_able_to(:notary_records, Archive) }

    it { is_expected.not_to be_able_to([:all], Reservation) }

    it { is_expected.to be_able_to(:new_archive, Profile) }
    it { is_expected.to be_able_to(:search, Profile) }
    it { is_expected.to be_able_to(:show, Profile) }
    it { is_expected.to be_able_to(:edit, not_updated_profile) }
    it { is_expected.not_to be_able_to(:edit, updated_profile) }


    it { is_expected.to be_able_to(:show, PropertyRelated) }
    it { is_expected.to be_able_to(:edit, not_updated_property_related) }
    it { is_expected.not_to be_able_to(:edit, updated_property_related) }


    it { is_expected.to be_able_to(:show, NotaryRelated) }
    it { is_expected.to be_able_to(:edit, not_updated_notary_related) }
    it { is_expected.not_to be_able_to(:edit, updated_notary_related) }

    it { is_expected.to be_able_to(:show, FamilyRelated) }
    it { is_expected.to be_able_to(:edit, not_updated_family_related) }
    it { is_expected.not_to be_able_to(:edit, updated_family_related) }

  end


  context "Audit can search and show" do
    let(:audit) { create(:audit) }
    let(:ability){ Ability.new(audit) }

    it { is_expected.to be_able_to(:manage, [Archive, Profile, PropertyRelated, NotaryRelated, FamilyRelated, Reservation]) }

    it { is_expected.not_to be_able_to(:edit, Staff) }
    it { is_expected.not_to be_able_to(:new, Staff) }
    it { is_expected.not_to be_able_to(:create, Staff) }
    it { is_expected.not_to be_able_to(:index, Staff) }

    it { is_expected.not_to be_able_to(:manage, Staff) }

  end

end