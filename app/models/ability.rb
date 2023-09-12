class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, Category
      can :create, Category
      can :update, Category, author_id: user.id
      can :destroy, Category, author_id: user.id
    end
  end
end
