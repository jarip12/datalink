class Ability
  include CanCan::Ability

  def initialize(staff)
    if staff.blank?
      cannot :manage, :all
      basic_read_only
    elsif staff.has_role?(:admin)
      can :manage, :all
    elsif staff.has_role?(:member)

    end
    can :manage, :all
  end

  protected
    def basic_read_only
    end
end
