# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.has_role? :admin
      can :manage, :all
      can :access, :rails_admin       
      can :manage, :dashboard
    elsif user.has_hole? :revisor
      can :write, :post         
    else
      cannot :manage, :all
    end
  end
end
