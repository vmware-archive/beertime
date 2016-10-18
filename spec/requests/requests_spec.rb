require 'rails_helper'

RSpec.describe 'Requests', type: :request do
  describe 'GET /requests/new' do
    it 'renders list of beers' do
      Beer.create(name: 'Hitachino')

      get new_request_path

      expect(response).to have_http_status(200)
      expect(response.body).to include('<li>Hitachino</li>')
    end
  end
end
