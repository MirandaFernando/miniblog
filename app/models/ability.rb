# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user.has_role? :admin
      can :manage, :all
      can :access, :rails_admin       
      can :manage, :dashboard
    elsif user.has_role? :revisor
      can [:read, :edit, :update], Post
    else
      can [:index, :new, :create], Post
      can [:edit, :update, :show, :destroy], Post, user_id: user.id
    end
  end
end
