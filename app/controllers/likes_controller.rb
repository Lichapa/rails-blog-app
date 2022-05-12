class LikesController < ApplicationController
  before_action :current_user, only: [:create]

  def new
    @like = Like.new
  end

  def create
    @like = Like.new(likes_params)
    @like.author_id = current_user.id
    @like.post_id = params[:post_id]

    if @like.save
      redirect_to user_post_path(current_user.id, Post.find(params[:post_id]))
    else
      render new
    end
  end

  private

  def likes_params
    params.require(:like).permit(:author_id, :post_id)
  end
end
