class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def user_post_counter
    counter = Post.where(author_id:).count
    user = User.find_by_id(id: author_id)
    user.update(posts_counter: counter)
  end

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
