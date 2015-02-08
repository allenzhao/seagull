class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is_superadmin?
      can :manage, :all
    else
      can :read, :all
    end
  end

  def admin
    can :manage, TeamMember
  end

  def superadmin
    can :manage, all
  end


end
