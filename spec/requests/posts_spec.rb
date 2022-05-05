require './spec/rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #posts' do
    before(:each) do
      get '/users/4/posts'
    end

    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Display all posts for user')
    end

    it 'renders a correct template' do
      expect(response).to render_template(:posts)
    end
  end

  describe 'GET #post' do
    before(:each) do
      get '/users/4/posts/15'
    end

    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Display one post and comments')
    end

    it 'renders a correct template' do
      expect(response).to render_template(:post)
    end
  end
end