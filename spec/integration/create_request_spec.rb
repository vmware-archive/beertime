# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Create Request Integration', type: :request do
  before do
    @env = {
      HTTP_AUTHORIZATION: ActionController::HttpAuthentication::Basic.encode_credentials(
        ENV['HTTP_BASIC_AUTH_USERNAME'],
        ENV['HTTP_BASIC_AUTH_PASSWORD']
      )
    }
  end

  describe 'Create Request' do
    it 'creates a request with beers' do
      beer1 = Beer.create!(name: 'Hitachino', url: 'http://example.com')
      beer2 = Beer.create!(name: 'Coedo', url: 'http://example.com')

      post requests_path,
           params: { request: { beers: [beer1.id, beer2.id], name: 'Bob' } },
           headers: @env

      expect(response).to have_http_status(302)
      expect(Request.count).to eq(2)

      requests = Request.all
      request1 = requests.first
      expect(request1.name).to eq('Bob')
      expect(request1.beer).to eq(beer1)
      request2 = requests.second
      expect(request2.name).to eq('Bob')
      expect(request2.beer).to eq(beer2)
    end
  end
end
