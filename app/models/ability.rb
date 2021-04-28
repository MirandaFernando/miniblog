# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
      can :access, :rails_admin       
      can :manage, :dashboard         
    else
      can :read, :all
      can :user, :all
    end
  end
end
