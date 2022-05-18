class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counter(id)
    counts = Comment.where(post_id: id).count
    post = Post.find(id)
    post.update(comments_counter: counts)
  end
end
