require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Mphatso', photo: 'https://malawi.com/photo1', bio: 'Testing code') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'photo should present' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end

  it 'bio should present' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than one' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'recent_posts method should return last three posts' do
    Post.create(author: subject, title: 'first post', text: 'test3', comments_counter: 0, likes_counter: 0)
    second_post = Post.create(author: subject, title: 'second post', text: 'test2', comments_counter: 0,
                              likes_counter: 0)
    third_post = Post.create(author: subject, title: 'third post', text: 'test3', comments_counter: 0, likes_counter: 0)
    fourth_post = Post.create(author: subject, title: 'fourth post', text: 'test4', comments_counter: 0,
                              likes_counter: 0)
    expect(subject.recent_posts.length).to eq 3
    expect(subject.posts_counter).to eq 4
    expect(subject.recent_posts).to include fourth_post, third_post, second_post
  end
end
