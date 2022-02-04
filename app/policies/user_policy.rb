class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
    # @user.id == record.id
    # @user == current_user
  end

  def update?
    # record.user == current_user
    # @user.id == record.id
    return true
  end
end
