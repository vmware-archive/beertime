# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'requests/index', type: :view do
  it 'shows list of requested beers' do
    now = Time.now
    beer = OpenStruct.new(
      name: 'Hitachino',
      url: 'http://example.com'
    )
    request = Request.new(
      id: 1,
      name: 'Bob',
      created_at: now
    )
    allow(request).to receive(:beer).and_return(beer)
    allow(request).to receive(:persisted?).and_return(true)

    assign(:requests, [request])

    render

    assert_select 'span[class="datetime"]', now.strftime('%F')
    assert_select 'span[class="beer-name"]', 'Hitachino'
    assert_select 'span[class="requester-name"]', 'Bob'
    assert_select 'a[href="http://example.com"]', 'View More'
    assert_select 'a[href="/requests/1"]', 'Delete'
  end
end
