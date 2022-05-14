require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    @user = User.new(name: 'Mphatso', bio: 'I am from Malawi', photo: 'photourl')
    @post = Post.new(user: @user.id, title: 'rspec test', text: 'Create test and let them fail', comments_counter: 0,
                     likes_counter: 0)
    Comment.new(user_id: @post.user_id, post_id: @post.id, text: 'Test Comment')
  end
  before { subject.save }

  it "text shouldn't be empty" do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it "author_id shouldn't be a string" do
    subject.user_id = 'string'
    expect(subject).to_not be_valid
  end

  it "post_id shouldn't be a string" do
    subject.post_id = 'string'
    expect(subject).to_not be_valid
  end
end
