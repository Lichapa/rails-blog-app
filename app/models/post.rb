class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  after_save :user_post_counter

  private

  def user_post_counter
    author.increment!(:posts_counter)
  end
end
