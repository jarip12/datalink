class Ability
  include CanCan::Ability

  def initialize(staff)
    ap staff

    if staff.has_role?(:admin)
      can :manage, :all
      can :search, :Profile
    elsif staff.has_role?(:user)
      basic_read_only
    elsif staff.has_role?(:typer)
      basic_read_only
      can :new, Archive
      can :create, Archive

      can [:edit, :update], Archive.where("updated_at = created_at")
      can [:edit, :update], Profile.where("updated_at = created_at")
      can [:edit, :update], Notary.where("updated_at = created_at")
      can [:edit, :update], NotaryRelated.where("updated_at = created_at")

      #daynamic
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
    end
end
