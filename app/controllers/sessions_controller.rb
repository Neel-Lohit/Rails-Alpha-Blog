class SessionsController < ApplicationController

    skip_before_action :authenticate_request #, only: [:new]
    
    def new
    end

    
    def create
        user  = User.find_by(email: params[:session][:email].downcase)
            if user && user.authenticate(params[:session][:password])
                #respond_to do |format|
                    command = JsonWebToken.encode(user_id: user.id) 
                    #session[:user_id] = user.id
                    #session[:token] = command
                    #format.html { redirect_to user   ,notice: "Logged in successfully" }
                    #format.json { render :show, request.headers['Authorization'] = command, auth_token: command, status: :ok, location: user }
                    render json: { data: { token: command } }
                    # flash[:notice] = "Logged in successfully"
                    # redirect_to user
                #end               
            else
                flash.now[:alert] = "Incorrect credentials"
                render 'new'
            end 
    end 

    
    def destroy
        # session[:user_id] = nil
        # session[:token] = nil
        # flash[:notice] = "Logged out"
        # redirect_to root_path
    end

end