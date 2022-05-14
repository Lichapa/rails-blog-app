class PostsController < ApplicationController
  before_action :current_user, only: [:create]

  def find_user
    @user = User.find(params[:user_id])
  end

  def index
    @posts = find_user.posts.includes(:comments)
  end

  def show
    @post = find_user.posts.includes(comments: [:user]).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(current_user.id)
    @post = @user.posts.new(
      title: post_params[:title],
      text: post_params[:text],
      user_id: post_params[:user_id],
      comments_counter: 0,
      likes_counter: 0
    )

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
    params.require(:post).permit(:user_id, :title, :text)
  end
end
