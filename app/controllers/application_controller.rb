class ApplicationController < ActionController::Base

    before_action :authenticate_request
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user

    end

    def require_user
        if !logged_in?
          flash[:alert] = "You must be logged in to perform that action"
          redirect_to login_path
        end
    end

    def authenticate_request
        #byebug
        @current_user = AuthorizeApiRequest.call(request.headers,session['token']).result
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end

     
end
