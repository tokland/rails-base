class Ability
  include CanCan::Ability

  # http://github.com/ryanb/cancan/wiki/Defining-Abilities
  def initialize(user_to_check)
    user = user_to_check || User.new
    can :read, :all
    
    # can :update, :all
    # cannot :destroy, Article, :published => true
    # can :update, Comment { |comment| comment.user == user }
  end
end
