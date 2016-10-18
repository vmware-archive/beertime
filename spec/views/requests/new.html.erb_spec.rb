require 'rails_helper'

RSpec.describe 'requests/new', type: :view do
  it 'shows view more links' do
    beers = [
      OpenStruct.new(
        name: 'Hitachino',
        url: 'http://example.com'
      )
    ]
    assign(:beers, beers)

    render

    expect(rendered).to include(
      '<li>Hitachino <a target="_blank" href="http://example.com">View More</a></li>'
    )
  end
end
