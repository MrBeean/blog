class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:show]
  before_action :set_current_user_post, only: [:edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).order('posts.created_at DESC')
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: I18n.t('controllers.posts.created.')
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: I18n.t('controllers.posts.updated.')
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: I18n.t('controllers.posts.destroyed.')
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :post, :visible)
    end

    def set_current_user_post
      @post = current_user.posts.find(params[:id])
    end
end
