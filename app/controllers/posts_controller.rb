class PostsController < ApplicationController
    before_action :current_user, only: [:create]
    
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
    @comments = Comment.where(post_id: @post.id)
  end

  def new
   @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end


  private
    def post_params
      params.require(:post).permit(:author_id, :title, :text)
    end
end
