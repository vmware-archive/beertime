require 'rails_helper'

RSpec.describe "beers/index", type: :view do
  it 'should render empty message when no beers exist' do
    assign(:beers, [])
    render
    expect(rendered).to include 'There are no beers in the database.'
  end

  it 'should render another message when beers exist' do
    assign(:beers, ["a beer"])
    render
    expect(rendered).to include 'There are beers in the database.'
  end
end
