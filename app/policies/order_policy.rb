class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.role == "admin"
  end

  def create?
    user.role == "admin"
  end

  def destroy?
    user.role == "admin"
  end

  def update?
    user.role == "admin"
  end

  def geoloc?
    user.role == "admin"
  end
end
