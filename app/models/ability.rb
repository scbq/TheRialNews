class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :read, Comment
      can [:create, :update], Comment, user_id: user.id
      cannot :destroy, Comment
    end
  end
end
