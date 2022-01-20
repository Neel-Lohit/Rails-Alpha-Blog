class ArticlesController < ApplicationController
  #skip_before_action :authenticate_request, only: [:index, :show]
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :require_user, except: [:show, :index] 
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # # GET /articles or /articles.json
  # def index
    
  #   @articles = Article.paginate(page: params[:page], per_page: 5)
  #   render json: @articles
  # end

  # # GET /articles/1 or /articles/1.json
  # def show
  #   render json: @article 
  #  # byebug - for debugging
  # end

  # # GET /articles/new
  # def new
  #   @article = Article.new
  # end

  # # GET /articles/1/edit
  # def edit
  # end

  # # POST /articles or /articles.json
  # def create
  #   @article = Article.new(article_params)
  #   @article.user = @current_user
    
  #   if @article.save
  #     render json: @article, status: :created, location: @article
  #   else
  #     render json: @article.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /articles/1 or /articles/1.json
  # def update
  #   if @article.update(article_params)
  #     render json: @article
  #   else
  #     render json: @article.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /articles/1 or /articles/1.json
  # def destroy
  #   @article.destroy
  # end

  # private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description, category_ids: [])
    end

    def require_same_user
      if @current_user != @article.user && !@current_user.admin?
        render json: "You can only edit or delete your own article"
      end
    end
end
