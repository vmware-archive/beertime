# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Application', type: :request do
  before do
    beers = [
      OpenStruct.new(
        name: 'Hitachino',
        url: 'http://example.com'
      )
    ]
    allow(Beer).to receive(:all).and_return(beers)
    @env = {
      HTTP_AUTHORIZATION: ActionController::HttpAuthentication::Basic.encode_credentials(
        ENV['HTTP_BASIC_AUTH_USERNAME'],
        ENV['HTTP_BASIC_AUTH_PASSWORD']
      )
    }
  end

  describe 'authentication' do
    it 'return 302 when authenticated' do
      get new_request_path, env: @env

      expect(response).to have_http_status(200)
    end

    it 'return 401 when not authenticated' do
      get new_request_path

      expect(response).to have_http_status(401)
    end
  end

  describe 'root route' do
    it 'redirects root to requests' do
      get root_path, env: @env

      expect(response).to have_http_status(301)
      expect(response).to redirect_to(requests_path)
    end
  end
end
