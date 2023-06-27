# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # guest user

    # everyone can view build orders and benchmarks
    can :read, BuildOrder
    can :read, AttackBenchmark

    # required to access nested resources
    can :read, User

    # if a user is logged in they can manage their own build orders and benchmarks
    return unless user.present?
    can :manage, BuildOrder, user: user
    can :manage, AttackBenchmark, user: user
  end
end
