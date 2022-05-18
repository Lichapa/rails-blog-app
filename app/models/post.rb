class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, presence: true,
                                               numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  def update_posts_counter(id)
    counts = Post.where(user_id: id).count
    user = User.find(id)
    user.update(posts_counter: counts)
  end
end
