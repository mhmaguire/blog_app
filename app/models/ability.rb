class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, :all
    else
      can :comment, Post do |post|
        post.comments_enabled?
      end
    end
  end
end
