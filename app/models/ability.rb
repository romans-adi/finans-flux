class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, :splash
      can :create, User
      can :read, :devise

      if user.persisted?
        can :read, :all
        can :create, Category
        can :create, Movement

        if user.author?
          can %i[update destroy], Category, author_id: user.id
          can %i[update destroy], Movement, category: { author_id: user.id }
        else
          cannot %i[update destroy], Category
          cannot %i[update destroy], Movement
        end
      end
    end
  end
end
