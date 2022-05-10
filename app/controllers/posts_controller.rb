class PostsController < ApplicationController
  def posts
    @posts = Post.where(author_id: current_user)
    @user = User.find_by(id: current_user)
  end

  def post
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
    @comments = Comment.where(post_id: @post.id)
  end
end
