class LikesController < ApplicationController
  before_action :current_user, only: [:create]

  def new
    @like = Like.new
  end

  def create
    @like = Like.new(likes_params)
    @like.user_id = current_user.id
    @like.post_id = params[:post_id]

    if @like.save
      redirect_to user_post_path(current_user.id, Post.find(params[:post_id]))
      flash[:success] = 'Like saved successfully'
    else
      flash.now[:error] = 'Like not saved'
      redirect_to user_post_path(current_user.id, Post.find(params[:post_id]))

    end
  end

  private

  def likes_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
