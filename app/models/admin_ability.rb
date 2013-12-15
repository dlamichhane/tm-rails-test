class AdminAbility < ActiveRecord::Base
  # attr_accessible :title, :body
  include CanCan::Ability

  def initialize(user)
  	can :read, ActiveAdmin::Page, :name => "Dashboard"
    alias_action :create, :read, :update, :destroy, :to => :crud

  	if user.role?('admin')
  		can :manage, :all
  	end

  	if user.role?('manager')
  		can :read, Platform
      can :crud, Campaign
      can :read, AuditTrail
  	end
  end
end
