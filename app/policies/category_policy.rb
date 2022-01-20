class CategoryPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
    @user = user
    @scope = scope
    end
    
    def resolve
    if user.admin?
    scope.all
    end
    end
    
    private
    
    attr_reader :user, :scope
  end
    def index?
    @user.admin?
    end    
end