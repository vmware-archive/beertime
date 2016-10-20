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
  end

  describe 'GET /' do
    it 'return 200 when authenticated' do
      env = {
        HTTP_AUTHORIZATION: ActionController::HttpAuthentication::Basic.encode_credentials(
          ENV['HTTP_BASIC_AUTH_USERNAME'],
          ENV['HTTP_BASIC_AUTH_PASSWORD']
        )
      }

      get new_request_path, env: env

      expect(response).to have_http_status(200)
    end

    it 'return 401 when not authenticated' do
      get new_request_path

      expect(response).to have_http_status(401)
    end
  end
end
