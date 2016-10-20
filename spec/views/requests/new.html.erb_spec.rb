# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'requests/new', type: :view do
  it 'shows view more links' do
    beers = [
      OpenStruct.new(
        id: 1,
        name: 'Hitachino',
        url: 'http://example.com'
      )
    ]
    assign(:beers, beers)
    request = Request.new
    assign(:request, request)

    render

    assert_select 'input[type="checkbox"][value="1"]'
    assert_select 'a[href="http://example.com"]', 'View More'
    assert_select 'input[type="text"][name="request[name]"]'
    assert_select 'input[type="submit"]'
  end
end
