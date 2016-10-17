require 'rails_helper'

RSpec.describe "dashboard/show", type: :view do
  it 'should render menu links' do
    render
    expect(rendered).to include '<a href="/beers">BEERS</a>'
  end
end
