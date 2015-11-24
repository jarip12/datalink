class Ability
  include CanCan::Ability

  def initialize(staff)

    if staff.has_role?(:admin)
      can :manage, :all
      cannot [:edit, :update], NotaryForeignTable do |table|
        table.reservation.status == "handled"
      end
    elsif staff.has_role?(:user)
      basic_read_only
    elsif staff.has_role?(:typer)
      basic_read_only

      cannot :manage, Reservation
      cannot :manage, NotaryForeignTable
      cannot :notary_records, Archive
      can [:new, :create], Archive

      can [:create, :new_archive], Profile

      can [:edit, :update], Profile, :updated_once => false
      can [:edit, :update], PropertyRelated, :updated_once => false
      can [:edit, :update], NotaryRelated, :updated_once => false
      can [:edit, :update], FamilyRelated, :updated_once => false

    elsif staff.has_role?(:audit)
      can :manage, :all
      cannot :manage, Staff
      cannot [:edit, :update], NotaryForeignTable do |table|
        table.reservation.status == "handled"
      end
    else
      cannot :manage, :all
    end

  end

  protected
    def basic_read_only
      can :search, Profile
      can :show, :all
      can :manage, Reservation
      can :manage, NotaryForeignTable
      cannot [:edit, :update], NotaryForeignTable do |table|
        table.reservation.status == "handled"
      end
      cannot :manage, Staff
      can :index, FamilyRelation
      can :index_tree, FamilyRelation
      can :notary_records, Archive
    end
end
