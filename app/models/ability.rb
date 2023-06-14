# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # guest user

    # everyone can view a build order
    can :read, BuildOrder

    # required to access nested resources
    can :read, User

    # if a user is logged in they can manage their own Build Orders
    return unless user.present?
    can :manage, BuildOrder, user: user
  end
end
