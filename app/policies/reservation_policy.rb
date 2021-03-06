class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    true
  end

  def destroy?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def index_manager?
    record.artist.user == user
  end
end
