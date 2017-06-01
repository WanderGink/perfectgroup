class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :read, :all
      cannot [:create, :update], Feedback
      can :create, [CommentProduct, Likeship, Relationship]
      can :update, [CommentProduct, Feedback, User]
      can :destroy, :all
    end
    unless user.admin?
      can :manage, [CommentProduct, Product]
      can :create, Feedback
      cannot :manage, User
      can [:read, :create, :destroy], Relationship
      can [:create, :destroy], Likeship
    end
  end
end
