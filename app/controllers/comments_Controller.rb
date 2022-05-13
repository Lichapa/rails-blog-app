class CommentsController < ApplicationController
  before_action :current_user, only: [:create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(current_user.id, Post.find(params[:post_id]))
      flash[:success] = 'Comment saved successfully'
    else
      render :new
      flash.now[:error] = 'Comment not saved'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :text)
  end
end
