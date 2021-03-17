class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user.role == "manager" || user.admin?
  end

  def update?
    true
  end

  def destroy?
    user.role == "manager" || user.admin?
  end

  def geoloc?
    user.role == "manager" || user.admin?
  end
end
