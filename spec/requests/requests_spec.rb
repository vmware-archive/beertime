require 'rails_helper'

RSpec.describe 'Requests', type: :request do
  before do
    @env = {
      HTTP_AUTHORIZATION: ActionController::HttpAuthentication::Basic.encode_credentials(
        ENV['HTTP_BASIC_AUTH_USERNAME'],
        ENV['HTTP_BASIC_AUTH_PASSWORD']
      )
    }
  end

  describe 'GET /requests/new' do
    it 'renders list of beers' do
      allow(Beer).to receive(:all).and_return(
        [
          OpenStruct.new(
            name: 'Hitachino',
            url: 'http://example.com'
          )
        ]
      )

      get new_request_path, env: @env

      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /requests' do
    it 'can accept a post with no beers selected' do
      post requests_path,
        params: {request: {beers: []}},
        headers: @env
      expect(response).to have_http_status(204)
    end

    it 'can accept a post with beer ids' do
      post requests_path,
        params: {request: {beers: [1, 4]}},
        headers: @env

      expect(response).to have_http_status(204)
    end
  end
end
