class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def recent_posts
    Post.where(author: id).order(created_at: :desc).limit(3)
  end
end
