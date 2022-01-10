# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.basic_role?
      can :read, Patient
      can :read, Physician
    elsif user.admin_role?
      can :read, :all
      can :create, Appointment
    else
      can :manage, :all
   end 
  end
end
