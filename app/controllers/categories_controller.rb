class CategoriesController < ApplicationController
    skip_before_action :authenticate_request, only: [:index, :show]
    before_action :require_admin, except: [:index, :show]


    
    # def new
    #     @category = Category.new 
    # end
  
    # def create
    #     @category = Category.new(category_params)
    #     if @category.save
    #       render json: @category, status: :created, location: @category
    #     else
    #       render json: @category.errors, status: :unprocessable_entity
    #     end
    # end

    # def edit
    #     @category = Category.find(params[:id])
    # end
    
    # def update
    #     @category = Category.find(params[:id])
    #     if @category.update(user_params)
    #       render json: @category
    #     else
    #       render json: @category.errors, status: :unprocessable_entity
    #     end
    # end

    # def index
    #     @categories = Category.paginate(page: params[:page], per_page: 5)
        
    #     render json: @categories 
    # end
  
    # def show
    #     @category = Category.find(params[:id])
    #     @articles = @category.articles.paginate(page: params[:page], per_page: 5)
        
    #     render json: @category 
    # end

    # def category_params
    #     params.require(:category).permit(:name)
    # end

    # def require_admin
    #     if !(logged_in? && @current_user.admin?)
    #       render json { "Only admins can perform that action" }
    #     end
    # end
    
    
end