class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: [:new, :index, :show]
    before_action :set_user, only: %i[ show edit update destroy ]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]
  
    # GET /users or /users.json
    # def index
    #   @users = User.paginate(page: params[:page], per_page: 5)
    #   render json: @users 
      
    # end
  
    # # GET /users/1 or /users/1.json
    # def show
    #  # byebug - for debugging
     
    #    render json: @user 
    # end

  
  
    # # # GET /users/new
    # # def new
    # #   @user = User.new
    # # end
  
    # # GET /users/1/edit
    # def edit
    # end
  
    # # POST /users or /users.json
    # def create
    #   @user = User.new(user_params)
  
      
    #   if @user.save
    #     render json: @user, status: :created, location: @user
    #   else
    #     render json: @user.errors, status: :unprocessable_entity
    #   end
    # end
  
    # # PATCH/PUT /users/1 or /users/1.json
    # def update
    #   #respond_to do |format|

    #   if @user.update(user_params)
    #     render json: @user
    #   else
    #     render json: @user.errors, status: :unprocessable_entity
    #   end
    #   #end
    # end
  
    # # DELETE /users/1 or /users/1.json
    # def destroy
    #   @user.destroy
      
    # end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:username, :email, :password)
      end

      def require_same_user
        if @current_user != @user && !@current_user.admin?
          flash[:alert] = "You can only edit or delete your own account"
          redirect_to @user
        end
      end






  end
  