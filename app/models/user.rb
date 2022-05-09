class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def recent_posts
    Post.where(author: self.id).order(created_at: :desc).limit(2)
  end
end
