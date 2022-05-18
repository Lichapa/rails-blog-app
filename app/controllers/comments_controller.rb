class CommentsController < ApplicationController
  before_action :current_user, only: [:create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(current_user.id, Post.find(params[:post_id]))
      flash[:success] = 'Comment saved successfully'
    else
      render :new
      flash.now[:error] = 'Comment not saved'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    if @comment.destroy
      @comment.update_comments_counter(@comment.post_id)
      redirect_to user_posts_path(@comment.user_id), status: 303
      flash[:success] = 'Comment has been deleted successfully.'
    else
      redirect_to user_posts_path(@comment.user_id), status: 303
      flash.now[:error] = 'An error occured. Try again.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :text)
  end
end
