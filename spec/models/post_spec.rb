require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(author_id: 11, title: 'rspec test', text: 'Create test and let them fail', comments_counter: 0,
             likes_counter: 0)
  end
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'if there is max 250 characters' do
    subject.title = 'under 250 characters'
    expect(subject).to be_valid
  end

  it 'likes counter is greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'if likes counter is integer' do
    subject.likes_counter = 'string'
    expect(subject).not_to be_valid
  end
end
