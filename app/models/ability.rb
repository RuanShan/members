class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard
      if user.has_role?('admin')
        can :manage, :all
      else

        can [:create,:read], Credit, user_id: user.id
        can [:destroy, :update], Credit, user_id: user.id, status: Credit::StatusEnum.unconfirmed
        can :display, Player, parent_id: user.id
        can [:read, :update], User, id: user.id
        can [:read], User, parent_id: user.id
        can [:read], CompanyNotice
      end
      cannot [:destroy], User, :email => 'admin@example.com'
    end
  end
end
