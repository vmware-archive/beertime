# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'layouts/application', type: :view do
  it 'shows correct links' do
    render

    assert_select 'li', 'pending requests'
    assert_select 'a[href="/requests/new"]', 'request beers'
    assert_select 'a[href="/beers/new"]', 'add a beer'
  end
end
