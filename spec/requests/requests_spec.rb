# frozen_string_literal: true
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
           params: {},
           headers: @env

      expect(response).to have_http_status(204)
    end

    it 'asks request creation service to create beers' do
      service = double('service')
      expect(service).to receive(:create).with(name: 'Bob', beer_ids: [1, 4]).and_return(true)
      expect(RequestCreator).to receive(:new).and_return(service)

      post requests_path,
           params: { request: { beers: [1, 4], name: 'Bob' } },
           headers: @env

      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /requests' do
    it 'can accept a get' do
      get requests_path, headers: @env
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /requests/1' do
    before do
      service = double('service')
      expect(service).to receive(:delete).with(1).and_return(true)
      expect(RequestDeleter).to receive(:new).and_return(service)
    end

    it 'can delete a request' do
      delete '/requests/1',
             headers: @env

      expect(response).to have_http_status(302)
    end
  end
end
