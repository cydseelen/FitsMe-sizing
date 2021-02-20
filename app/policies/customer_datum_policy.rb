class CustomerDatumPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      true
    end

    def new?
      create?
    end
  end
end
