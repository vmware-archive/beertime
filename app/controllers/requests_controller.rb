class RequestsController < ApplicationController
  def new
    @beers = Beer.all
    @request = Request.new
  end

  def create
    request = request_params[:request]
    if request
      beer_ids = request[:beers]
    end
  end

  private

  def request_params
    params.permit({request: {beers: []}})
  end
end
