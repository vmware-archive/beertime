# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Router', type: :routing do
  describe 'routing' do
    it 'routes to root to requests history page' do
      expect(get: '/').to route_to(
        controller: 'requests',
        action: 'index'
      )
    end
  end
end
