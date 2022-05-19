require 'rails_helper'
RSpec.describe 'user_index_path', type: :feature do
  describe 'User index page' do
    before(:each) do
      @first_user = User.create(name: 'Benjamin', photo: 'url', bio: 'Developer from Ghana',
                                posts_counter: 0, email: 'benjamin@mail.com', password: 'password', password_confirmation: 'password')
      @first_user = User.create(name: 'Edmond', photo: 'url', bio: 'Designer from Ghana',
                                posts_counter: 2, email: 'edmond@mail.com', password: 'password', password_confirmation: 'password')
      @second_user = User.create(name: 'Theo', photo: 'url', bio: 'Developer from Ghana',
                                 posts_counter: 4, email: 'theo@mail.com', password: 'password', password_confirmation: 'password')
      visit('users/sign_in')
      fill_in 'Email', with: 'benjamin@mail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'All Users'
    end
    it 'displays username of all other users' do
      expect(page).to have_content('Benjamin')
      expect(page).to have_content('Edmond')
      expect(page).to have_content('Theo')
    end
    it 'displys profile picture of each user' do
      all('img').each do |i|
        expect(i[:src]).to eq('url')
      end
    end
    it 'displays number of posts each user has' do
      expect(page).to have_content(0)
      expect(page).to have_content(2)
      expect(page).to have_content(4)
    end
    it "redirects to user's show page" do
      click_link 'Benjamin'
      expect(page).to have_content('Benjamin')
    end
  end
end
