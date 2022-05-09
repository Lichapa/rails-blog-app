class Like < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :post

  def update_likes_counter
    counter = Like.where(post_id: self.post_id).count
    post = Post.find_by(id: self.post_id)
    post.update(likes_counter: counter)
  end
end
