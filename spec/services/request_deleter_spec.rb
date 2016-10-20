# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'RequestDeleter', type: :model do
  describe 'delete' do
    it 'deletes a request' do
      request = Request.new(id: 1)
      allow(Request).to receive(:find).with(1).and_return(request)
      request_deleter = RequestDeleter.new

      expect(Request).to receive(:destroy).with(1).and_return(request)
      response = request_deleter.delete(request_id: 1)

      expect(response).to eq(request)
    end
  end
end
