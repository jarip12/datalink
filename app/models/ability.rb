class Ability
  include CanCan::Ability

  def initialize(staff)

    if staff.has_role?(:admin)
      can :manage, :all
      can :search, :Profile
    elsif staff.has_role?(:user)
      basic_read_only
    elsif staff.has_role?(:typer)
      basic_read_only

      cannot :all, :Reservation
      can [:new, :create], Archive

      can [:edit, :update], Profile, :updated_once => false
      can [:edit, :update], PropertyRelated, :updated_once => false
      can [:edit, :update], NotaryRelated, :updated_once => false
      can [:edit, :update], FamilyRelated, :updated_once => false

    elsif staff.has_role?(:audit)
      can :manage, :all
      cannot :manage, :staff
    else
      cannot :manage, :all
    end

  end

  protected
    def basic_read_only
      can :search, Profile
      can :show, :all
      can :index, :Reservation
    end
end
