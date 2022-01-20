class ApplicationController < ActionController::Base
    include Pundit
    include JSONAPI::ActsAsResourceController
    protect_from_forgery with: :null_session

    before_action :authenticate_request
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!@current_user

    end

    def require_user
        if !logged_in?
          flash[:alert] = "You must be logged in to perform that action"
          redirect_to login_path
        end
    end

    def authenticate_request
        #byebug
        @current_user = AuthorizeApiRequest.call(request.headers,request.headers['Authorization'].split(' ')[1]).result
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end

     
end
