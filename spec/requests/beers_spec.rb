# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Beers', type: :request do
  before do
    @env = {
      HTTP_AUTHORIZATION: ActionController::HttpAuthentication::Basic.encode_credentials(
        ENV['HTTP_BASIC_AUTH_USERNAME'],
        ENV['HTTP_BASIC_AUTH_PASSWORD']
      )
    }
  end

  describe 'GET /beers/new' do
    it 'renders form for adding beers' do
      get new_beer_path, env: @env

      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end
end
