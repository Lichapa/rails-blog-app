class PostsController < ApplicationController
  before_action :current_user, only: [:create]

  def find_user
    @user = User.find(params[:user_id])
  end

  def index
    @posts = find_user.posts.includes(:comments)

    # @user = User.find(params[:user_id])
    # @posts = Post.where(author_id: params[:user_id])
  end

  def show
    # @post = Post.find(params[:id])
    # @comments = @post.comments.includes(:author)

    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to user_path(current_user.id)
      flash[:success] = 'Post saved successfully'
    else
      render :new
      flash.now[:error] = 'Post not saved'
    end
  end

  private

  def post_params
    params.require(:post).permit(:author_id, :title, :text)
  end
end
