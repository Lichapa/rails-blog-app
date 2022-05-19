require 'rails_helper'
RSpec.describe 'post_index_route', type: :feature do
  describe 'Post' do
    before(:each) do
      @first_user = User.create(name: 'Benjamin', photo: 'link', bio: 'Programmer from Nigeria', posts_counter: 0,
                                email: 'benjamin@mail.com', password: 'password', password_confirmation: 'password')
      @second_user = User.create(name: 'Mphatso', photo: 'link', bio: 'Software developer', posts_counter: 0,
                                 email: 'mphatso@mail.com', password: 'password', password_confirmation: 'password')
      @third_user = User.create(name: 'Developer', photo: 'link', bio: 'downey is not junior', posts_counter: 0,
                                email: 'developer@gmail.com', password: 'password', password_confirmation: 'password')
      visit new_user_session_path
      fill_in 'Email', with: 'benjamin@mail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      @post = Post.create(title: 'First Post', text: 'This is the first post', comments_counter: 0, likes_counter: 0,
                          user: @first_user)
      @posta = Post.create(title: 'Second Post', text: 'This is the second post', comments_counter: 0,
                           likes_counter: 0, user: @second_user)
      @postb = Post.create(title: 'Third Post', text: 'This is the third post', comments_counter: 0, likes_counter: 0,
                           user: @third_user)
      @commenta = Comment.create(text: 'This is my first comment', user: User.first, post: Post.first)
      @commentb = Comment.create(text: 'This is my second comment', user: User.first, post: Post.first)
      @commentc = Comment.create(text: 'This is my third comment', user: User.first, post: Post.first)
      visit user_posts_path(@first_user.id)
    end
    it 'Display user\'s profile picture' do
      all('img').each do |i|
        expect(i[:src]).to eq('link')
      end
    end
    it 'Display user\'s username' do
      expect(page).to have_content('Benjamin')
    end
    it 'Display number of posts user has' do
      post = Post.all
      expect(post.size).to eql(3)
    end
    it 'Display post title' do
      expect(page).to have_content('First Post')
    end
    it 'Displays content of the post' do
      expect(page).to have_content 'This is the first post'
    end
    it 'displays first comments of a post' do
      expect(page).to have_content 'This is my first comment'
    end
    it 'displays number of comments a post has' do
      post = Post.first
      expect(page).to have_content(post.comments_counter)
    end
    it 'displays number of likes a post has' do
      post = Post.first
      expect(page).to have_content(post.likes_counter)
    end
    it 'Display post number in counter' do
      first_user = User.first
      expect(page).to have_content(first_user.posts_counter)
    end
    it 'redirects after click' do
      click_link 'First Post'
      expect(page).to have_current_path user_post_path(@post.user_id, @post)
    end
  end
end
