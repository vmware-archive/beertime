require 'rails_helper'

RSpec.describe 'Requests', type: :request do
  describe 'GET /requests/new' do
    it 'renders list of beers' do
      Beer.create(name: 'Hitachino')

      env = {
        HTTP_AUTHORIZATION: ActionController::HttpAuthentication::Basic.encode_credentials(
          ENV['HTTP_BASIC_AUTH_USERNAME'],
          ENV['HTTP_BASIC_AUTH_PASSWORD']
        )
      }
      get new_request_path, env: env

      expect(response).to have_http_status(200)
      expect(response.body).to include('<li>Hitachino</li>')
    end
  end
end
