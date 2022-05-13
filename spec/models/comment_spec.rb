require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.first
  post = Post.find_by(author_id: user)
  subject do
    Comment.new(author_id: post.author_id, post_id: post.id, text: 'Test Comment')
  end
  before { subject.save }

  it "text shouldn't be empty" do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it "author_id shouldn't be a string" do
    subject.author_id = 'string'
    expect(subject).to_not be_valid
  end

  it "post_id shouldn't be a string" do
    subject.post_id = 'string'
    expect(subject).to_not be_valid
  end
end
