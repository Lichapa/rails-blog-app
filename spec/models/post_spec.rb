require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    @user = User.new(name: 'Mphatso', bio: 'I am from Malawi', photo: 'photourl')
    Post.new(user: @user, title: 'rspec test', text: 'Create test and let them fail', comments_counter: 0,
             likes_counter: 0)
  end
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'if there is max 250 characters' do
    subject.title = "Prow scuttle parrel provost Sail ho shrouds spirits boom
                      mizzenmast yardarm. Pinnace holystone mizzenmast quarter
                      crow's nest nipperkin grog yardarm hempen halter furl.
                      Swab barque interloper chantey doubloon starboard grog
                      black jack gangway rutters."
    expect(subject).to_not be_valid
  end

  it 'likes counter is greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'if likes counter is integer' do
    subject.likes_counter = 'string'
    expect(subject).to_not be_valid
  end
end
