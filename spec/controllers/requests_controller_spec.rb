require 'rails_helper'

describe RequestsController, type: :controller do
  it 'should render a request beers page' do
    get :new
  end
end
