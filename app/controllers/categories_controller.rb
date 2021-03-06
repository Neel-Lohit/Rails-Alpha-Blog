class CategoriesController < ApplicationController
    skip_before_action :authenticate_request, only: [:index, :show]
    before_action :require_admin, except: [:new, :index, :show, :create]

    def new
        @category = Category.new 
    end
  
    def create
        @category = policy_scope(Category).new(category_params)
        if @category.save
          flash[:notice] = "Category was successfully created"
          redirect_to @category
        else
          render 'new'
        end
    end

    def edit
        @category = Category.find(params[:id])
    end
    
    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
          flash[:notice] = "Category name updated successfully"
          redirect_to @category
        else
          render 'edit'
        end
    end

    def index
        @categories = Category.paginate(page: params[:page], per_page: 5)
        #authorize(@categories)
        respond_to do |format|
          format.html { @category }
          format.json { render json: @category }
        end
    end
  
    def show
        @category = Category.find(params[:id])
        @articles = @category.articles.paginate(page: params[:page], per_page: 5)
        respond_to do |format|
          format.html { @category }
          format.json { render json: @category }
        end
    end

    def category_params
        params.require(:category).permit(:name)
    end

    def require_admin
        if !(logged_in? && current_user.admin?)
          flash[:alert] = "Only admins can perform that action"
          redirect_to categories_path
        end
    end
    
    
end