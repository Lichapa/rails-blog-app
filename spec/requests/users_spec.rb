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
end
