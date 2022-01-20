class CategoryPolicy < ApplicationPolicy
    attr_reader :user, :categories
  
    def initialize(user, categories)
      @user = user
      @categories = categories
    end
  
    def index?
      @user.admin?
    end
end