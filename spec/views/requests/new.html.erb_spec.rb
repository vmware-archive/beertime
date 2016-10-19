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
      '<li><input type="checkbox"/>Hitachino <a target="_blank" href="http://example.com">' \
      'View More</a></li>'
    )
    expect(rendered).to include(
      submit_tag("Request")
    )
  end
end
