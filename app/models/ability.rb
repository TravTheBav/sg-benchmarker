# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :account_info, User, id: user.id
      can :manage, User, id: user.id
      can :manage, BuildOrder, user_id: user.id
      # can :manage, AttackBenchmark, user_id: user.id
    end   
  end
end
