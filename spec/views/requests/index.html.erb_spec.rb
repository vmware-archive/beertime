require 'rails_helper'

RSpec.describe 'requests/index', type: :view do
  it 'shows list of requested beers' do
    beers = [
      OpenStruct.new(
        name: 'Hitachino',
        url: 'http://example.com'
      )
    ]
    request = Request.new(
      created_at: Time.now
    )
    allow(request).to receive(:beers).and_return(beers)
    assign(:requests, [request])

    render

    expect(rendered).to include(
      '2016-10-19 Hitachino'
    )
  end
end
