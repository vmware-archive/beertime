require 'rails_helper'

RSpec.describe "beers/index", type: :view do
  before do
    assign(:beers, [])
  end

  it 'should render empty message when no beers exist' do
    render
    expect(rendered).to include 'There are no beers in the database.'
  end

  it 'should render another message when beers exist' do
    assign(:beers, ["a beer"])
    render
    expect(rendered).to include 'There are beers in the database.'
  end

  it 'should render link to new page' do
    render
    expect(rendered).to include  '<a href="/beers/new">New Beer</a>'
  end
end
