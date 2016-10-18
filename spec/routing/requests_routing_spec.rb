require 'rails_helper'

describe RequestsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/requests/new').to route_to(
        controller: 'requests',
        action: 'new'
      )
    end
  end
end
