class AuthenticateUser < ApplicationController
    prepend SimpleCommand
  
    def initialize(email, password)
      @email = email
      @password = password
    end
  
    def call
      JsonWebToken.encode(user_id: user.id) if user
    end
  
    private
  
    attr_accessor :session, :email, :password
  
    def user
      user  = User.find_by(email: params[:session][:email].downcase)
      return user if user && user.authenticate(params[:session][:password])
  
      errors.add :user_authentication, 'invalid credentials'
      nil
    end
  end