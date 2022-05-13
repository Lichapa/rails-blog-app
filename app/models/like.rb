class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :author_id, :post_id, presence: true,
                                  numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_likes_counter

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
