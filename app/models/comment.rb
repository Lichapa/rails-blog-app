class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: true
  validates :author_id, :post_id, presence: true,
                                  numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
