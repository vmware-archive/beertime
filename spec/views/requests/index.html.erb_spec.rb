require 'rails_helper'

RSpec.describe 'requests/index', type: :view do
  it 'shows list of requested beers' do
    now = Time.now
    beer = OpenStruct.new(
      name: 'Hitachino',
      url: 'http://example.com'
    )
    request = Request.new(
      created_at: now
    )
    allow(request).to receive(:beer).and_return(beer)

    assign(:requests, [request])

    render

    expect(rendered).to include(
      "#{now.strftime('%F')} Hitachino"
    )
  end
end
