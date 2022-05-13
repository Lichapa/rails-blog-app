require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.first
  post = Post.find_by(author_id: user)
  subject do
    Like.new(author_id: post.author_id, post_id: post.id)
  end
  before { subject.save }

  it "author_id shouldn't be a string" do
    subject.author_id = 'string'
    expect(subject).to_not be_valid
  end

  it "post_id shouldn't be a string" do
    subject.post_id = 'string'
    expect(subject).to_not be_valid
  end
end
