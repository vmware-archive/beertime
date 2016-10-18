require 'rails_helper'

RSpec.describe "Requests", type: :request do
  describe "GET /requests/new" do
    it "works! (now write some real specs)" do
      get new_request_path
      expect(response).to have_http_status(200)
    end
  end
end
