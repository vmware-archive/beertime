class RequestsController < ApplicationController
  def new
    @beers = Beer.all
  end
end
