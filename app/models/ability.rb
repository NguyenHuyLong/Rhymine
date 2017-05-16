class Ability
  include CanCan::Ability

  def initialize user, namespace
    user ||= User.new

    if namespace == "Admins"
      if user.is_admin?
        can :manage, Genre
        can [:read, :destroy], Song
        can [:read, :destroy], :user
      end
    elsif namespace == ""
      can :manage, Comment
      can :create, Like
      can :destroy, Like do |like|
        like.user == user
      end
      can :read, User
    end
  end
end
