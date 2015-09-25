class Ability
  include CanCan::Ability

  def initialize(user)

    if user.has_role?('admin')
      can :manage, :all
    else

      can [:read], Credit, user_id: user.id
      can :display, Player, parent_id: user.id
      can [:read, :update], User, id: user.id
    end

    can :manage, :all
    cannot [:destroy], User, :email => 'username@example.com'
  end
end
