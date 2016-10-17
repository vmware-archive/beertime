require 'rails_helper'

RSpec.describe "Pizzerias", type: :request do
  describe "GET /pizzerias" do
    it "pizzerias list" do
      get pizzerias_path
      expect(response).to have_http_status(200)
    end
  end
end
