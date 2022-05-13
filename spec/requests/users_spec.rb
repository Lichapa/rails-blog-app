require './spec/rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) do
      get '/'
    end

    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to_not include('Displays a list of users')
    end

    it 'renders a correct template' do
      expect(response).to render_template(:index)
    end
  end

  # These test needs to be updated later after this branch because of the changes made to the code

  # describe 'GET #user' do
  #   before(:each) do
  #     get '/users/1'
  #   end

  #   it 'GET requests response status was correct' do
  #     expect(response).to have_http_status(:ok)
  #   end

  #   it 'response body includes correct placeholder text' do
  #     expect(response.body).to_not include('Display a user')
  #   end

  #   it 'renders a correct template' do
  #     expect(response).to render_template(:show)
  #   end
  # end
end
