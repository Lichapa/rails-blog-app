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

end
