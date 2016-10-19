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
    request = Request.new
    assign(:request, request)

    render

    expect(rendered).to include(
      '<input type="checkbox" name="request[beers][]" id="request_beers_" />Hitachino'
    )

    expect(rendered).to include(
      '<a target="_blank" href="http://example.com">View More</a>'
    )

    expect(rendered).to include(
      submit_tag('Request')
    )
  end
end
