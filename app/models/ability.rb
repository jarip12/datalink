class Ability
  include CanCan::Ability

  def initialize(staff)
    ap staff

    if staff.has_role?(:admin)
      can :manage, :all
    elsif staff.has_role?(:user)
      can :search, Profile
      can :show, Profile
      can :show, Archive

    elsif staff.has_role?(:audit)

    elsif staff.has_role?(:typer)

    else
      cannot :manage, :all
      basic_read_only
    end

  end

  protected
    def basic_read_only
    end
end
