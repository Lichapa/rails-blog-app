class Comment < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :post

  def update_comments_counter
    counter = Comment.where(post_id: self.post_id).count
    post = Post.find_by(id: self.post_id)
    post.update(comments_counter: counter)
  end

end
