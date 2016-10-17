require 'rails_helper'

RSpec.describe BeersController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(assigns(:beers)).to eq([])
      expect(response).to have_http_status(:success)
    end
  end
end
