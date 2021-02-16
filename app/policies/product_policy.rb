class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
   true
  end
  
  def create?
    true
  end

  def show?
    record.user == user
  end

  def index?
    record.user == user
  end

  def edit?
    record.user == user
  end
  
  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
