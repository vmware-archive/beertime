require 'rails_helper'

RSpec.describe 'RequestCreator', type: :model do
  describe 'create' do
    it 'creates a request with many beers' do
      allow(Beer).to receive(:find).with(1).and_return(
        Beer.new(
          id: 1,
          name: 'Hitachino',
          url: 'http://example.com'
        )
      )
      allow(Beer).to receive(:find).with(4).and_return(
        Beer.new(
          id: 4,
          name: 'Hitachino',
          url: 'http://example.com'
        )
      )
      service = RequestCreator.new

      response = service.create([1, 4])

      expect(response).to eq(true)
      expect(Request.count).to eq(1)
      request = Request.first
      expect(request.beers.count).to eq(2)
    end
  end
end
